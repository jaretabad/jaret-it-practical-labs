#requires -Version 5.1
<#
.SYNOPSIS
    Collects a read-only Windows endpoint diagnostic baseline.

.DESCRIPTION
    Gathers system, network, storage, update, service, event-log, Defender,
    and firewall information. Runs non-destructive connectivity tests and
    separates raw private evidence from a reduced portfolio draft.

    This script does NOT change accounts, services, firewall rules, DNS,
    network adapters, registry values, updates, or security settings.

.NOTES
    Project: Jaret IT Support Journey - Practical Labs & Portfolio
    Lab: 01 - Windows Help Desk Diagnostic Toolkit
    Minimum PowerShell: Windows PowerShell 5.1
#>

[CmdletBinding()]
param(
    [string]$OutputRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) "output")
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = "Stop"

function Write-Utf8File {
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][AllowEmptyCollection()][AllowEmptyString()][string[]]$Content
    )

    $Content | Out-File -FilePath $Path -Encoding utf8 -Force
}

function ConvertTo-MarkdownValue {
    param([AllowNull()]$Value)

    if ($null -eq $Value) {
        return ""
    }

    return ([string]$Value).Replace("|", "\|").Replace("`r", " ").Replace("`n", " ").Trim()
}

function Add-ReportError {
    param(
        [Parameter(Mandatory = $true)][string]$Section,
        [Parameter(Mandatory = $true)][string]$Message
    )

    $script:CollectionErrors += [pscustomobject]@{
        Section = $Section
        Message = $Message
    }
}

function New-ConnectivityResult {
    param(
        [Parameter(Mandatory = $true)][string]$Test,
        [Parameter(Mandatory = $true)][string]$Layer,
        [Parameter(Mandatory = $true)][string]$Status,
        [Parameter(Mandatory = $true)][string]$Details
    )

    return [pscustomobject]@{
        Test    = $Test
        Layer   = $Layer
        Status  = $Status
        Details = $Details
    }
}

function ConvertTo-PublicConnectivityResult {
    param(
        [Parameter(Mandatory = $true)]$Result
    )

    $publicStatus = ([string]$Result.Status).ToUpperInvariant()
    $publicDetails = switch ($publicStatus) {
        "PASS" { "Test completed successfully." }
        "FAIL" { "Test did not pass. Review private evidence for diagnostic details." }
        "ERROR" { "Test encountered an error. Review private evidence for diagnostic details." }
        "NOT RUN" { "Test was not run. Review private evidence for diagnostic details." }
        default {
            $publicStatus = "ERROR"
            "Test encountered an error. Review private evidence for diagnostic details."
        }
    }

    return [pscustomobject]@{
        Test    = [string]$Result.Test
        Layer   = [string]$Result.Layer
        Status  = $publicStatus
        Details = $publicDetails
    }
}

function Get-PublicEndpointDescription {
    param(
        [Parameter(Mandatory = $true)][string]$OsCaption,
        [Parameter(Mandatory = $true)][string]$OsArchitecture
    )

    $osFamily = if ($OsCaption -match "(?i)\bWindows 11\b") {
        "Windows 11"
    }
    elseif ($OsCaption -match "(?i)\bWindows 10\b") {
        "Windows 10"
    }
    else {
        return "Windows test endpoint"
    }

    $architecture = if ($OsArchitecture -match "(?i)(64-bit|x64|64)") {
        "64-bit"
    }
    elseif ($OsArchitecture -match "(?i)(32-bit|x86|32)") {
        "32-bit"
    }
    else {
        $null
    }

    if ($architecture) {
        return ("{0} {1} test endpoint" -f $osFamily, $architecture)
    }

    return ("{0} test endpoint" -f $osFamily)
}

function ConvertTo-PublicStorageSummary {
    param(
        [Parameter(Mandatory = $true)][AllowEmptyCollection()][object[]]$StorageResults,
        [double]$FreeSpaceThresholdPercent = 20
    )

    if ($StorageResults.Count -eq 0) {
        return [pscustomobject]@{
            Test    = "Storage free-space threshold"
            Status  = "NOT RUN"
            Details = "Storage threshold could not be evaluated. Review private evidence for diagnostic details."
        }
    }

    $requiresReview = @($StorageResults | Where-Object {
        [double]$_.FreePercent -lt $FreeSpaceThresholdPercent
    }).Count -gt 0

    return [pscustomobject]@{
        Test    = "Storage free-space threshold"
        Status  = $(if ($requiresReview) { "REVIEW" } else { "PASS" })
        Details = $(if ($requiresReview) {
            "Storage requires review against the defined free-space threshold. Review private evidence for diagnostic details."
        }
        else {
            "Storage remained above the defined free-space threshold."
        })
    }
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
New-Item -ItemType Directory -Path $OutputRoot -Force | Out-Null
$runPath = Join-Path $OutputRoot ("Diagnostics_{0}" -f $timestamp)
$privatePath = Join-Path $runPath "PRIVATE_DO_NOT_UPLOAD"
$portfolioPath = Join-Path $runPath "PORTFOLIO_DRAFT"

New-Item -ItemType Directory -Path $privatePath -Force | Out-Null
New-Item -ItemType Directory -Path $portfolioPath -Force | Out-Null

$runPath = (Get-Item $runPath).FullName
$privatePath = (Get-Item $privatePath).FullName
$portfolioPath = (Get-Item $portfolioPath).FullName

$script:CollectionErrors = @()
$privateReport = @(
    "# Windows Help Desk Diagnostic Report - PRIVATE",
    "",
    "> Contains endpoint identifiers and raw operational data. Do not upload publicly.",
    "",
    ("- Generated: {0}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss zzz")),
    ("- PowerShell: {0}" -f $PSVersionTable.PSVersion.ToString()),
    "- Collection mode: read-only; no remediation performed",
    ""
)

$publicReport = @(
    "# Windows Endpoint Baseline - Portfolio Draft",
    "",
    "> Review with the redaction checklist before publishing. This draft intentionally omits raw identifiers and event messages.",
    "",
    ("- Generated: {0}" -f (Get-Date -Format "yyyy-MM-dd")),
    "- Scope: One Windows endpoint in a controlled home-lab exercise",
    "- Collection mode: Read-only; least privilege; no configuration changes",
    ""
)

# System baseline
try {
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $computer = Get-CimInstance -ClassName Win32_ComputerSystem
    $uptime = (Get-Date) - $os.LastBootUpTime

    $systemInfo = [pscustomobject]@{
        ComputerName      = $env:COMPUTERNAME
        Manufacturer      = $computer.Manufacturer
        Model             = $computer.Model
        OSName            = $os.Caption
        OSVersion         = $os.Version
        OSBuildNumber     = $os.BuildNumber
        OSArchitecture    = $os.OSArchitecture
        TotalMemoryGB     = [math]::Round(($computer.TotalPhysicalMemory / 1GB), 2)
        LastBootUpTime    = $os.LastBootUpTime
        UptimeHours       = [math]::Round($uptime.TotalHours, 1)
        PowerShellVersion = $PSVersionTable.PSVersion.ToString()
    }

    $systemInfo | Export-Csv -Path (Join-Path $privatePath "PRIVATE_System_Info.csv") -NoTypeInformation -Encoding UTF8

    $privateReport += "## System baseline"
    $privateReport += ""
    $privateReport += "| Field | Value |"
    $privateReport += "|---|---|"
    foreach ($property in $systemInfo.PSObject.Properties) {
        $privateReport += ("| {0} | {1} |" -f $property.Name, (ConvertTo-MarkdownValue $property.Value))
    }
    $privateReport += ""

    $publicReport += "## System baseline"
    $publicReport += ""
    $publicEndpointDescription = Get-PublicEndpointDescription -OsCaption ([string]$os.Caption) -OsArchitecture ([string]$os.OSArchitecture)
    $publicReport += ("- Endpoint: {0}" -f $publicEndpointDescription)
    $publicReport += ""
}
catch {
    Add-ReportError -Section "System baseline" -Message $_.Exception.Message
}

# Network configuration
$networkConfigs = @()
try {
    $networkConfigs = @(Get-NetIPConfiguration | ForEach-Object {
        [pscustomobject]@{
            InterfaceAlias     = $_.InterfaceAlias
            InterfaceStatus    = $(if ($null -ne $_.NetAdapter) { $_.NetAdapter.Status } else { "Unknown" })
            IPv4Address        = (@($_.IPv4Address | ForEach-Object { $_.IPAddress }) -join "; ")
            IPv4DefaultGateway = (@(
                $_.IPv4DefaultGateway | ForEach-Object {
                    $nextHopProperty = $null
                    if ($null -ne $_) {
                        $nextHopProperty = $_.PSObject.Properties["NextHop"]
                    }

                    if ($null -ne $nextHopProperty -and -not [string]::IsNullOrWhiteSpace([string]$nextHopProperty.Value)) {
                        [string]$nextHopProperty.Value
                    }
                }
            ) -join "; ")
            DnsServers         = (@($_.DNSServer | ForEach-Object { $_.ServerAddresses }) -join "; ")
            NetworkCategory    = $(if ($null -ne $_.NetProfile) { $_.NetProfile.NetworkCategory } else { "Unknown" })
        }
    })

    $networkConfigs | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Network_Config.csv") -NoTypeInformation -Encoding UTF8

    $adapters = Get-NetAdapter | Select-Object Name, InterfaceDescription, Status, LinkSpeed, MacAddress
    $adapters | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Network_Adapters.csv") -NoTypeInformation -Encoding UTF8

    $privateReport += "## Network configuration"
    $privateReport += ""
    $privateReport += "| Interface | Status | IPv4 | Gateway | DNS servers | Category |"
    $privateReport += "|---|---|---|---|---|---|"
    foreach ($item in $networkConfigs) {
        $privateReport += ("| {0} | {1} | {2} | {3} | {4} | {5} |" -f `
            (ConvertTo-MarkdownValue $item.InterfaceAlias),
            (ConvertTo-MarkdownValue $item.InterfaceStatus),
            (ConvertTo-MarkdownValue $item.IPv4Address),
            (ConvertTo-MarkdownValue $item.IPv4DefaultGateway),
            (ConvertTo-MarkdownValue $item.DnsServers),
            (ConvertTo-MarkdownValue $item.NetworkCategory))
    }
    $privateReport += ""

    $connectedCount = @($networkConfigs | Where-Object { $_.InterfaceStatus -eq "Up" }).Count
    $ipv4Count = @($networkConfigs | Where-Object { -not [string]::IsNullOrWhiteSpace($_.IPv4Address) }).Count
    $publicReport += "## Network baseline"
    $publicReport += ""
    $publicReport += ("- Interfaces reporting Up: {0}" -f $connectedCount)
    $publicReport += ("- Interfaces with an IPv4 address: {0}" -f $ipv4Count)
    $publicReport += "- Raw IP, gateway, DNS and MAC values omitted from this draft"
    $publicReport += ""
}
catch {
    Add-ReportError -Section "Network configuration" -Message $_.Exception.Message
}

# Layered connectivity tests
$connectivityResults = @()

try {
    $loopbackPassed = Test-Connection -ComputerName "127.0.0.1" -Count 2 -Quiet
    $connectivityResults += New-ConnectivityResult -Test "TCP/IP loopback" -Layer "Local TCP/IP stack" `
        -Status $(if ($loopbackPassed) { "PASS" } else { "FAIL" }) `
        -Details $(if ($loopbackPassed) { "127.0.0.1 responded" } else { "127.0.0.1 did not respond" })
}
catch {
    $connectivityResults += New-ConnectivityResult -Test "TCP/IP loopback" -Layer "Local TCP/IP stack" -Status "ERROR" -Details $_.Exception.Message
}

$gateway = $null
if ($networkConfigs.Count -gt 0) {
    $gatewayText = $networkConfigs |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_.IPv4DefaultGateway) } |
        Select-Object -First 1 -ExpandProperty IPv4DefaultGateway
    if (-not [string]::IsNullOrWhiteSpace($gatewayText)) {
        $gateway = ($gatewayText -split ";")[0].Trim()
    }
}

if ($gateway) {
    try {
        $gatewayPassed = Test-Connection -ComputerName $gateway -Count 2 -Quiet
        $connectivityResults += New-ConnectivityResult -Test "Default gateway reachability" -Layer "Local network" `
            -Status $(if ($gatewayPassed) { "PASS" } else { "FAIL" }) `
            -Details $(if ($gatewayPassed) { "Gateway responded" } else { "Gateway did not answer ICMP; some devices intentionally block it" })
    }
    catch {
        $connectivityResults += New-ConnectivityResult -Test "Default gateway reachability" -Layer "Local network" -Status "ERROR" -Details $_.Exception.Message
    }
}
else {
    $connectivityResults += New-ConnectivityResult -Test "Default gateway reachability" -Layer "Local network" -Status "NOT RUN" -Details "No IPv4 default gateway was detected"
}

try {
    $dnsAnswer = Resolve-DnsName -Name "www.microsoft.com" -Type A -ErrorAction Stop |
        Where-Object {
            $null -ne $_.PSObject.Properties["IPAddress"] -and
            $null -ne $_.IPAddress
        } |
        Select-Object -First 1
    $dnsPassed = $null -ne $dnsAnswer
    $connectivityResults += New-ConnectivityResult -Test "DNS resolution" -Layer "Name resolution" `
        -Status $(if ($dnsPassed) { "PASS" } else { "FAIL" }) `
        -Details $(if ($dnsPassed) { "www.microsoft.com resolved" } else { "No IPv4 answer returned" })
}
catch {
    $connectivityResults += New-ConnectivityResult -Test "DNS resolution" -Layer "Name resolution" -Status "FAIL" -Details $_.Exception.Message
}

try {
    $httpsPassed = Test-NetConnection -ComputerName "www.microsoft.com" -Port 443 -InformationLevel Quiet -WarningAction SilentlyContinue
    $connectivityResults += New-ConnectivityResult -Test "HTTPS port reachability" -Layer "Application transport" `
        -Status $(if ($httpsPassed) { "PASS" } else { "FAIL" }) `
        -Details $(if ($httpsPassed) { "TCP 443 reachable" } else { "TCP 443 was not reachable during the test" })
}
catch {
    $connectivityResults += New-ConnectivityResult -Test "HTTPS port reachability" -Layer "Application transport" -Status "ERROR" -Details $_.Exception.Message
}

$connectivityResults | Export-Csv -Path (Join-Path $privatePath "Connectivity_Tests_PRIVATE.csv") -NoTypeInformation -Encoding UTF8
$publicConnectivityResults = @($connectivityResults | ForEach-Object {
    ConvertTo-PublicConnectivityResult -Result $_
})
$publicConnectivityResults |
    Export-Csv -Path (Join-Path $portfolioPath "Connectivity_Tests.csv") -NoTypeInformation -Encoding UTF8

$privateReport += "## Connectivity tests"
$privateReport += ""
$privateReport += "| Test | Layer | Status | Details |"
$privateReport += "|---|---|---|---|"
foreach ($test in $connectivityResults) {
    $privateReport += ("| {0} | {1} | {2} | {3} |" -f `
        (ConvertTo-MarkdownValue $test.Test),
        (ConvertTo-MarkdownValue $test.Layer),
        (ConvertTo-MarkdownValue $test.Status),
        (ConvertTo-MarkdownValue $test.Details))
}
$privateReport += ""

$publicReport += "## Layered connectivity tests"
$publicReport += ""
$publicReport += "| Test | Layer | Status |"
$publicReport += "|---|---|---|"
foreach ($test in $publicConnectivityResults) {
    $publicReport += ("| {0} | {1} | {2} |" -f `
        (ConvertTo-MarkdownValue $test.Test),
        (ConvertTo-MarkdownValue $test.Layer),
        (ConvertTo-MarkdownValue $test.Status))
}
$publicReport += ""

# Storage
$storageResults = @()
try {
    $storageResults = @(Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
        $freePercent = if ($_.Size -gt 0) { [math]::Round(($_.FreeSpace / $_.Size) * 100, 1) } else { 0 }
        [pscustomobject]@{
            Drive       = $_.DeviceID
            SizeGB      = [math]::Round(($_.Size / 1GB), 1)
            FreeGB      = [math]::Round(($_.FreeSpace / 1GB), 1)
            FreePercent = $freePercent
            Review      = $(if ($freePercent -lt 20) { "YES - below 20% free" } else { "No threshold finding" })
        }
    })

    $storageResults | Export-Csv -Path (Join-Path $privatePath "Storage_Summary_PRIVATE.csv") -NoTypeInformation -Encoding UTF8
    $publicStorageSummary = ConvertTo-PublicStorageSummary -StorageResults $storageResults
    $publicStorageSummary | Export-Csv -Path (Join-Path $portfolioPath "Storage_Summary.csv") -NoTypeInformation -Encoding UTF8

    $privateReport += "## Storage"
    $privateReport += ""
    $privateReport += "| Drive | Size GB | Free GB | Free % | Review |"
    $privateReport += "|---|---:|---:|---:|---|"
    foreach ($disk in $storageResults) {
        $privateReport += ("| {0} | {1} | {2} | {3} | {4} |" -f $disk.Drive, $disk.SizeGB, $disk.FreeGB, $disk.FreePercent, (ConvertTo-MarkdownValue $disk.Review))
    }
    $privateReport += ""

    $publicReport += "## Storage review"
    $publicReport += ""
    $publicReport += ("- {0}" -f (ConvertTo-MarkdownValue $publicStorageSummary.Details))
    $publicReport += ""
}
catch {
    Add-ReportError -Section "Storage" -Message $_.Exception.Message
}

# Updates visible through Get-HotFix
try {
    $hotfixes = @(Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 15 HotFixID, Description, InstalledOn)
    $hotfixes | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Recent_HotFixes.csv") -NoTypeInformation -Encoding UTF8
    $privateReport += "## Recent hotfixes visible to Get-HotFix"
    $privateReport += ""
    $privateReport += ("- Records collected: {0}" -f $hotfixes.Count)
    $privateReport += "- Limitation: this is not a complete replacement for Windows Update history or compliance tooling."
    $privateReport += ""
}
catch {
    Add-ReportError -Section "Hotfixes" -Message $_.Exception.Message
}

# Automatic services currently not running (review only)
$stoppedAutomaticServices = @()
try {
    $stoppedAutomaticServices = @(Get-CimInstance -ClassName Win32_Service |
        Where-Object { $_.StartMode -eq "Auto" -and $_.State -ne "Running" } |
        Select-Object Name, DisplayName, State, StartMode, StartName)

    $stoppedAutomaticServices | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Automatic_Services_Not_Running.csv") -NoTypeInformation -Encoding UTF8
    $privateReport += "## Automatic services not currently running - review only"
    $privateReport += ""
    $privateReport += ("- Count: {0}" -f $stoppedAutomaticServices.Count)
    $privateReport += "- Important: trigger-start behavior can be normal. Do not start services without correlating them to a symptom and service documentation."
    $privateReport += ""
    $publicReport += "## Services review"
    $publicReport += ""
    $publicReport += ("- Automatic services observed not running: {0}" -f $stoppedAutomaticServices.Count)
    $publicReport += "- This count is an observation, not proof of failure; no services were changed."
    $publicReport += ""
}
catch {
    Add-ReportError -Section "Services" -Message $_.Exception.Message
}

# Recent System errors and warnings
$systemEvents = @()
try {
    $eventStart = (Get-Date).AddDays(-2)
    $systemEvents = @(Get-WinEvent -FilterHashtable @{ LogName = "System"; Level = 2, 3; StartTime = $eventStart } -MaxEvents 30 -ErrorAction Stop |
        Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, Message)

    $systemEvents | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Recent_System_Events.csv") -NoTypeInformation -Encoding UTF8
}
catch {
    if ($_.Exception.Message -match "No events were found") {
        $systemEvents = @()
    }
    else {
        Add-ReportError -Section "System events" -Message $_.Exception.Message
    }
}

$privateReport += "## Recent System errors and warnings"
$privateReport += ""
$privateReport += "- Window: last 2 days; maximum 30 events"
$privateReport += ("- Events captured: {0}" -f $systemEvents.Count)
$privateReport += "- Correlate event time and provider with a reported symptom before treating an event as root cause."
$privateReport += ""

$publicReport += "## Event-log review"
$publicReport += ""
$publicReport += "- Scope: limited sample of System errors and warnings from the last 2 days; maximum 30 events"
$publicReport += "- Raw event messages omitted from this portfolio draft"
$publicReport += ""

# Defender status
$defenderStatus = $null
try {
    $defenderStatus = Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled, BehaviorMonitorEnabled, AntivirusSignatureLastUpdated, QuickScanAge
    $defenderStatus | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Defender_Status.csv") -NoTypeInformation -Encoding UTF8

    $privateReport += "## Microsoft Defender status"
    $privateReport += ""
    $privateReport += ("- Antivirus enabled: {0}" -f $defenderStatus.AntivirusEnabled)
    $privateReport += ("- Real-time protection enabled: {0}" -f $defenderStatus.RealTimeProtectionEnabled)
    $privateReport += ("- Behavior monitor enabled: {0}" -f $defenderStatus.BehaviorMonitorEnabled)
    $privateReport += ("- Signature last updated: {0}" -f $defenderStatus.AntivirusSignatureLastUpdated)
    $privateReport += ""

    $publicReport += "## Basic security-control visibility"
    $publicReport += ""
    $publicReport += ("- Microsoft Defender antivirus enabled: {0}" -f $defenderStatus.AntivirusEnabled)
    $publicReport += ("- Real-time protection enabled: {0}" -f $defenderStatus.RealTimeProtectionEnabled)
}
catch {
    Add-ReportError -Section "Microsoft Defender" -Message $_.Exception.Message
    $publicReport += "## Basic security-control visibility"
    $publicReport += ""
    $publicReport += "- Microsoft Defender status was unavailable; a third-party product or policy may affect visibility."
}

# Firewall profiles
try {
    $firewallProfiles = @(Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction)
    $firewallProfiles | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Firewall_Profiles.csv") -NoTypeInformation -Encoding UTF8

    $privateReport += "## Windows Firewall profiles"
    $privateReport += ""
    $privateReport += "| Profile | Enabled | Default inbound | Default outbound |"
    $privateReport += "|---|---|---|---|"
    foreach ($profile in $firewallProfiles) {
        $privateReport += ("| {0} | {1} | {2} | {3} |" -f $profile.Name, $profile.Enabled, $profile.DefaultInboundAction, $profile.DefaultOutboundAction)
    }
    $privateReport += ""

    foreach ($profile in $firewallProfiles) {
        $publicReport += ("- Windows Firewall {0} profile enabled: {1}" -f $profile.Name, $profile.Enabled)
    }
    $publicReport += ""
}
catch {
    Add-ReportError -Section "Windows Firewall" -Message $_.Exception.Message
}

# Collection limitations and errors
$privateReport += "## Collection notes and limitations"
$privateReport += ""
$privateReport += "- No configuration changes or remediation actions were performed."
$privateReport += "- A failed ping does not always mean the target is down; ICMP may be blocked."
$privateReport += "- A stopped automatic service can be normal when trigger-start behavior applies."
$privateReport += "- Event-log entries require correlation with user symptoms and timestamps."
$privateReport += "- Get-HotFix does not represent every Windows servicing state."
$privateReport += ""

if ($script:CollectionErrors.Count -gt 0) {
    $script:CollectionErrors | Export-Csv -Path (Join-Path $privatePath "PRIVATE_Collection_Errors.csv") -NoTypeInformation -Encoding UTF8
    $privateReport += "## Collection errors"
    $privateReport += ""
    foreach ($item in $script:CollectionErrors) {
        $privateReport += ("- **{0}:** {1}" -f (ConvertTo-MarkdownValue $item.Section), (ConvertTo-MarkdownValue $item.Message))
    }
    $privateReport += ""
}

$publicReport += "## Conclusion template"
$publicReport += ""
$publicReport += "Replace this section with your evidence-based conclusion: what passed, what requires review, what was not tested, whether anything should be escalated, and how you validated the final state."
$publicReport += ""
$publicReport += "## Privacy statement"
$publicReport += ""
$publicReport += "Raw hostname, IP configuration, adapter identifiers, service account names and event messages were retained only in the private evidence folder."

Write-Utf8File -Path (Join-Path $privatePath "Diagnostics_Report_PRIVATE.md") -Content $privateReport
Write-Utf8File -Path (Join-Path $portfolioPath "Portfolio_Summary_DRAFT.md") -Content $publicReport

# Evidence hashes are generated after all other evidence files are written.
$hashes = Get-ChildItem -Path $runPath -Recurse -File |
    Where-Object { $_.Name -ne "Evidence_Hashes.csv" } |
    Get-FileHash -Algorithm SHA256 |
    Select-Object @{Name = "RelativePath"; Expression = { $_.Path.Substring($runPath.Length).TrimStart("\") } }, Algorithm, Hash

$hashes | Export-Csv -Path (Join-Path $privatePath "Evidence_Hashes.csv") -NoTypeInformation -Encoding UTF8

Write-Host ""
Write-Host "Diagnostic collection completed." -ForegroundColor Green
Write-Host ("Run folder: {0}" -f $runPath)
Write-Host ("Private evidence: {0}" -f $privatePath) -ForegroundColor Yellow
Write-Host ("Portfolio draft: {0}" -f $portfolioPath) -ForegroundColor Cyan
Write-Host "No configuration changes were made."

