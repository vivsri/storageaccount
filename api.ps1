Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "az-test-rg" -AccountName "apiteststorageaccount" -IpRule @()
$apiiplist = Invoke-RestMethod -Uri https://ip-ranges.amazonaws.com/ip-ranges.json
ForEach ($object in $apiiplist.prefixes[7..9]) {
#Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "az-test-rg" -AccountName "apiteststorageaccount"-IpRule (@{IPAddressOrRange= $object.ip_prefix ;Action="allow"})
Add-AzStorageAccountNetworkRule -ResourceGroupName "az-test-rg" -Name "apiteststorageaccount" -IPAddressOrRange $object.ip_prefix
}


<#$arrMyList = $arrMyList.Trim(',',' ')
#Write-Host $objapiiplist.ip_prefix
#$MyList = "@{IPAddressOrRange=`"$($objapiiplist.ip_prefix)`";Action=`"allow`"}" + ","
#Write-Host $MyList
Write-Host $arrMyList
$arrMyList.GetType()
$arrMyList  = $arrMyList.ToCharArray()
$arrMyList  = $arrMyList.
$arrMyList.GetType()
#$arrMyList += "@{IPAddressOrRange=`"$($objapiiplist.ip_prefix)`";Action=`"allow`"}"
#$arrMyList += $objapiiplist.ip_prefix
#Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "az-test-rg" -AccountName "apiteststorageaccount"-IpRule (@{IPAddressOrRange= $objapiiplist.ip_prefix ;Action="allow"})
#$MyList = "@{IPAddressOrRange=`"$($objapiiplist.ip_prefix)`";Action=`"allow`"}"
#Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "az-test-rg" -AccountName "apiteststorageaccount"-IpRule @{IPAddressOrRange= $objapiiplist.ip_prefix ;Action="allow"}
#Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "az-test-rg" -AccountName "apiteststorageaccount"-IpRule {IPAddressOrRange= ($objapiiplist.ip_prefix) ;Action="allow"}

#Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "az-test-rg" -AccountName "apiteststorageaccount"-IpRule (@{IPAddressOrRange= $objapiiplist.ip_prefix ;Action="allow"})
#Add-AzStorageAccountNetworkRule -ResourceGroupName "az-test-rg" -Name "apiteststorageaccount" -IPAddressOrRange $objapiiplist.ip_prefix
$MyList += "@{IPAddressOrRange=`"$($objapiiplist.ip_prefix)`";Action=`"allow`"}"
Update-AzStorageAccountNetworkRuleSet -ResourceGroupName "az-test-rg" -AccountName "apiteststorageaccount"-IpRule @{IPAddressOrRange= $objapiiplist.ip_prefix ;Action="allow"}
#$apiiplist.prefixes.ip_prefix  | Select-Object -First 5
#$apiiplist.prefixes.Count
#$MyList = $Null
#>
