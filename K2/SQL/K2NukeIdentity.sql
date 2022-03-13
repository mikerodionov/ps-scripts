SELECT * FROM [Identity].[Identity];

DISABLE TRIGGER [Identity].[TG_Identity_PreventDeletion] ON [Identity].[Identity];

DELETE a FROM [Identity].[IdentityMember] a
JOIN [Identity].[Identity] b ON ID=MemberID
WHERE FQN NOT IN 
  ('Everyone', 'K2SQL:System', 'Security Administrators', 'OAuth Notifications', 'Package and Deployment', 'Data Administrators')
  AND Type=1; 

DELETE FROM [Identity].[Identity]
WHERE FQN NOT IN
  ('Everyone', 'K2SQL:System', 'Security Administrators', 'OAuth Notifications', 'Package and Deployment', 'Data Administrators')
  AND Type=1;

ENABLE TRIGGER [Identity].[TG_Identity_PreventDeletion] ON [Identity].[Identity];

SELECT * FROM [Identity].[Identity];