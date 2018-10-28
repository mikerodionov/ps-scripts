DECLARE @VersionWhereEscalationWasDeleted INT;
DECLARE @ProcessWhichWillExpire NVARCHAR(MAX);

SET @VersionWhereEscalationWasDeleted = 7; -- (SAMPLE VALUE)
SET @ProcessWhichWillExpire = N'ProjectName\ProcessName'; -- (SAMPLE VALUE)

DELETE [AS] FROM [Server].[Async] AS [AS]
       WHERE [AS].[Type] = 5
         AND [AS].[ProcInstID] IN (
              SELECT [PI].[ID] FROM [Server].[ProcInst] AS [PI]
                     INNER JOIN [Server].[Proc] AS [EP] ON [PI].[ExecutingProcID] = [EP].[ID] -- Executing
                     INNER JOIN [Server].[Proc] AS [OP] ON [PI].[ProcID] = [OP].[ID] -- Original
                     INNER JOIN [Server].[ProcSet] AS [EPS] ON [EP].[ProcSetID] = [EPS].[ID]
                     INNER JOIN [Server].[ProcSet] AS [OPS] ON [OP].[ProcSetID] = [OPS].[ID]
                     WHERE [OPS].[FullName] = @ProcessWhichWillExpire
                       AND [OP].[Ver] < @VersionWhereEscalationWasDeleted
                       AND [EP].[Ver] >= @VersionWhereEscalationWasDeleted
         );
