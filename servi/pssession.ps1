cls
$pw = convertto-securestring -AsPlainText -Force -String "cegth67VTUF"
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist "servi7\Administrador",$pw
#$cred = Get-Credential
$wsman = new-pssession -computername "servi7" -authentication default -credential $cred
#enter-pssession -session $wsman
Invoke-Command -Session $wsman {
 hostname
}
#exit-pssession
remove-pssession -session $wsman

winrm set winrm/config/client `@`{TrustedHosts=`"`*`"`}