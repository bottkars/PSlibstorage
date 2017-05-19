
function Get-libStorageVersion {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
    $uri = "https://$($libstoragehost):$($libstorageport)/help/$myself"
    invoke-libStorageRequest -uri $uri 
}
function Get-libStorageSnapshots {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
    $uri = "https://$($libstoragehost):$($libstorageport)/help/$myself"
    invoke-libStorageRequest -uri $uri 
}


function Get-libStorageVolumes {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
    $uri = "https://$($libstoragehost):$($libstorageport)/$myself"
    invoke-libStorageRequest -uri $uri 
}
function Get-libStorageExecutors {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
    $uri = "https://$($libstoragehost):$($libstorageport)/$myself"
    invoke-libStorageRequest -uri $uri 
}
function Get-libStorageTasks {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
    $uri = "https://$($libstoragehost):$($libstorageport)/$myself"
    invoke-libStorageRequest -uri $uri 
}

function Get-libStorageServices {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    #[OutputType([int])]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
    $uri = "https://$($libstoragehost):$($libstorageport)/$myself"
    invoke-libStorageRequest -uri $uri 
}
function Get-libStorageFunctions {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $uri = "https://$($libstoragehost):$($libstorageport)"
    invoke-libStorageRequest -uri $uri 
}  

function invoke-libStorageRequest {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true)]$uri,
        [Parameter(Mandatory = $false)][ValidateSet('Get', 'Delete', 'Put', 'Post', 'Patch')]$Method = 'Get',
        [Parameter(Mandatory = $false)]$ContentType = 'application/json', 
        [Parameter(Mandatory = $false)]$Body
    )
switch ($Method)
    {
        default
        {
        $response = Invoke-RestMethod -Uri $uri -Method $Method  -SkipCertificateCheck -ContentType $ContentType
        }
        'Post'
        {
        $response = Invoke-RestMethod -Uri $uri -Method $Method  -SkipCertificateCheck -ContentType $ContentType -Body $Body
        }

    }


    if ($names = $response |Get-Member -MemberType NoteProperty | Where-Object Definition -match "System.Management.Automation.PSCustomObject") {
        expand-libstorageproperty -prop_names $names -prop_elements $response
    }
    else {
        Write-Output $response
    }
}


function expand-libstorageproperty {
    Param(
        $prop_names,
        $prop_elements)


    $output_element = @()
    foreach ($prop_name in $prop_names.name) {
        $elements = $prop_elements.("$prop_name")
        if ($elements_names = $elements | Get-Member -MemberType NoteProperty | Where-Object Definition -Match "System.Management.Automation.PSCustomObject") {
            expand-libstorageproperty -prop_name $elements_names -prop_elements $elements
        }
        else {
            $output_element += $elements
        }      
    }
    Write-Output $output_element    
}

function New-libStorageVolume {
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    Param
    (
        [Parameter(Mandatory = $true, Position = 1)]$libstoragehost,
        [Parameter(Mandatory = $true, Position = 2)][string]$VolumeName,
        [Parameter(Mandatory = $true, Position = 3)][uint32]$SizeGB,
        [Parameter(Mandatory = $true, Position = 4)]$service,
        [Parameter(Mandatory = $false)][string]$availabilityZone,
        [Parameter(Mandatory = $false)]$libstorageport = 7980
    )
    $Jsonbody = @{"name" = $VolumeName;"size" = $SizeGB;"availabilityZone"= $availabilityZone} |ConvertTo-Json
    Write-Verbose $Jsonbody
    $Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
    $uri = "https://$($libstoragehost):$($libstorageport)/$($myself)s/$service"
    invoke-libStorageRequest -uri $uri -Method Post -Body $Jsonbody
}
