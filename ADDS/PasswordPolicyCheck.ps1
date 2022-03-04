$domain = 'yourdomain.com'
$rootDSE = Get-ADrootDSE -Server $domain
$AccountPolicy = Get-ADObject $rootDSE.defaultNamingContext -Property lockoutDuration, lockoutObservationWindow, lockoutThreshold
$AccountPolicy | Select-Object @{n="PolicyType";e={"Account Lockout"}},`
DistinguishedName,`
@{n="lockoutDuration";e={"$($_.lockoutDuration / -600000000) minutes"}},`
@{n="lockoutObservationWindow";e={"$($_.lockoutObservationWindow / -600000000) minutes"}},`
lockoutThreshold | Format-List
$PasswordPolicy = Get-ADObject $rootDSE.defaultNamingContext -Property minPwdAge, maxPwdAge, minPwdLength, pwdHistoryLength, pwdProperties

$PasswordPolicy | Select-Object @{n="PolicyType";e={"Password"}},`
DistinguishedName,`
@{n="minPwdAge";e={"$($_.minPwdAge / -864000000000) days"}},`
@{n="maxPwdAge";e={"$($_.maxPwdAge / -864000000000) days"}},`
minPwdLength,`
pwdHistoryLength,`
@{n="pwdProperties";e={Switch ($_.pwdProperties) {
    0 {"Passwords can be simple and the administrator account cannot be locked out"}
    1 {"Passwords must be complex and the administrator account cannot be locked out"}
    8 {"Passwords can be simple, and the administrator account can be locked out"}
    9 {"Passwords must be complex, and the administrator account can be locked out"}
    Default {$_.pwdProperties}}}}
