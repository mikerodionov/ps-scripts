USE K2
BEGIN TRANSACTION
-- DECLARATIONS - Update as needed
DECLARE @OAuthProviderName NVARCHAR(20)='AAD'
DECLARE @SecurityLabelName NVARCHAR(20)='AAD'; -- the label value that will be prepended to users and groups for the user manager
DECLARE @ResourceID uniqueidentifier
SELECT @ResourceID = ResourceID FROM [Authorization].OAuthResource WHERE Name = @SecurityLabelName
DECLARE @XmlConfig XML=
'<AuthInit>
</AuthInit>'
DECLARE @RoleXmlConfig XML=
'<RoleInit>
<OAuthResourceID>' + CAST(@ResourceID AS varchar(50)) + '</OAuthResourceID>
</RoleInit>'
DECLARE @SecurityLabelID UNIQUEIDENTIFIER ='e02d4aa0-f87a-4b5d-90f3-f03ce6c7af55'; -- GUID of SecurityLabel for user manager
DECLARE @AuthSecurityProviderID UNIQUEIDENTIFIER =(SELECT SecurityProviderID FROM [HostServer].[SecurityProvider] WHERE ProviderClassName= 'SourceCode.Security.Providers.AzureActiveDirectory.SecurityProvider');
-- GUID of SecurityProvider for Authentication Services(IAuthenticationProvider)
DECLARE @AuthInit XML= @XmlConfig-- XML initialization data for the Authentication Provider
DECLARE @RoleSecurityProviderID UNIQUEIDENTIFIER =(SELECT SecurityProviderID FROM [HostServer].[SecurityProvider] WHERE ProviderClassName= 'SourceCode.Security.Providers.AzureActiveDirectory.SecurityProvider');
-- GUID of the SecurityProvider for User and Group Listing services (IRoleProvider)
DECLARE @RoleInit XML= @RoleXmlConfig-- XML initialization data for the Role Provider
DECLARE @DefaultLabel BIT= 0;--1 = true, NULL and 0 = false
DECLARE @ProviderClassName NVARCHAR(200)= 'SourceCode.Security.Providers.AzureActiveDirectory'; -- the full .NET name of the Security Provider class
-- UPDATE TABLES
DELETE FROM [SecurityLabels] WHERE SecurityLabelName= @SecurityLabelName;
INSERT INTO [SecurityLabels] VALUES (@SecurityLabelID,@SecurityLabelName,@AuthSecurityProviderID,@AuthInit,@RoleSecurityProviderID,@RoleInit,@DefaultLabel)

-- If script completed with no errors, and you double-checked Provider/Label name variables etc.
-- uncomment and execute line below to commit transaction
--COMMIT TRANSACTION
