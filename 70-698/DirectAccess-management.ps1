#  To perform client side DirectAccess configuration:
#  (Modifies the configuration of the specified DirectAccess client user experience)
Set-DAClientExperienceConfiguration

# Use -UserInterface option to enable/disable use of Networking icon in Notifications area to connect using DirectAccess:
Set-DAClientExperienceConfiguration –PolicyStore “Contoso\GPO1” –UserInterface “False”
