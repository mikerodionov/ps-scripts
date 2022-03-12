# This scripts shows specific group membership information according to current state of K2 identity cache
SELECT i.ID, i.FQN, i.ContainersResolved, i.MembersResolved from [Identity].[Identity] as i
JOIN [Identity].IdentityMember as m on i.id = m.MemberID 
WHERE m.ContainerID = 1026 -- Specify group ID from [identity].[identity]
UNION 
SELECT [ID], [FQN], [ContainersResolved], [MembersResolved] from [identity].[identity]
WHERE [ID] = 1026 -- Specify group ID from [identity].[identity]
