

function Get-libStorageVolumes
{
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    #[OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,Position = 1)]$libstoragehost,
        [Parameter(Mandatory=$false)]$libstorageport = 7980
		#[Parameter(Mandatory=$false)][ValidateSet('Get','Delete','Put','Post','Patch')]$Method = 'Get',
		#[Parameter(Mandatory=$false)]$ContentType = 'application/json;charset=utf-8', 
		#[Parameter(Mandatory=$false)]$Body
    )
$Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
$uri = "https://$($libstoragehost):$($libstorageport)/$myself"
invoke-libStorageRequest -uri $uri 
}
function Get-libStorageExecutors
{
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    #[OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,Position = 1)]$libstoragehost,
        [Parameter(Mandatory=$false)]$libstorageport = 7980
		#[Parameter(Mandatory=$false)][ValidateSet('Get','Delete','Put','Post','Patch')]$Method = 'Get',
		#[Parameter(Mandatory=$false)]$ContentType = 'application/json;charset=utf-8', 
		#[Parameter(Mandatory=$false)]$Body
    )
$Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
$uri = "https://$($libstoragehost):$($libstorageport)/$myself"
invoke-libStorageRequest -uri $uri 
}
function Get-libStorageTasks
{
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    #[OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,Position = 1)]$libstoragehost,
        [Parameter(Mandatory=$false)]$libstorageport = 7980
		#[Parameter(Mandatory=$false)][ValidateSet('Get','Delete','Put','Post','Patch')]$Method = 'Get',
		#[Parameter(Mandatory=$false)]$ContentType = 'application/json;charset=utf-8', 
		#[Parameter(Mandatory=$false)]$Body
    )
$Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
$uri = "https://$($libstoragehost):$($libstorageport)/$myself"
invoke-libStorageRequest -uri $uri 
}

function Get-libStorageServices
{
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    #[OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,Position = 1)]$libstoragehost,
        [Parameter(Mandatory=$false)]$libstorageport = 7980
		#[Parameter(Mandatory=$false)][ValidateSet('Get','Delete','Put','Post','Patch')]$Method = 'Get',
		#[Parameter(Mandatory=$false)]$ContentType = 'application/json;charset=utf-8', 
		#[Parameter(Mandatory=$false)]$Body
    )
$Myself = ($MyInvocation.MyCommand.Name.Substring(14)).ToLower()
$uri = "https://$($libstoragehost):$($libstorageport)/$myself"
invoke-libStorageRequest -uri $uri 
}
function Get-libStorageFunctions
{
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    #[OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,Position = 1)]$libstoragehost,
        [Parameter(Mandatory=$false)]$libstorageport = 7980
		#[Parameter(Mandatory=$false)][ValidateSet('Get','Delete','Put','Post','Patch')]$Method = 'Get',
		#[Parameter(Mandatory=$false)]$ContentType = 'application/json;charset=utf-8', 
		#[Parameter(Mandatory=$false)]$Body
    )
$uri = "https://$($libstoragehost):$($libstorageport)"
invoke-libStorageRequest -uri $uri 
}  

function invoke-libStorageRequest
{
    [CmdletBinding(HelpUri = "http://pslibstorage.readthedocs.io/en/latest")]
    #[OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true)]$uri,
		[Parameter(Mandatory=$false)][ValidateSet('Get','Delete','Put','Post','Patch')]$Method = 'Get',
		[Parameter(Mandatory=$false)]$ContentType = 'application/json;charset=utf-8', 
		[Parameter(Mandatory=$false)]$Body
    )

$response = Invoke-RestMethod -Uri $uri -Method $Method  -SkipCertificateCheck -ContentType $ContentType


if ($names = $response |Get-Member -MemberType NoteProperty | where Definition -match "System.Management.Automation.PSCustomObject")
    {
        expand-libstorageproperty -prop_names $names -prop_elements $response
    }
else
    {
        Write-Output $response
    }
}


function expand-libstorageproperty
{
Param(
$prop_names,
$prop_elements)


$output_element = @()
    foreach ($prop_name in $prop_names.name) {
        $elements = $prop_elements.("$prop_name")
        if ($elements_names = $elements | Get-Member -MemberType NoteProperty | where Definition -Match "System.Management.Automation.PSCustomObject")
            {
                expand-libstorageproperty -prop_name $elements_names -prop_elements $elements
            }
       else
        {
            $output_element += $elements
        }      

    }
Write-Output $output_element    
}