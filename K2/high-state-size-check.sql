# Shows processes with State size higher than 1 Mb
SELECT TOP 200 
	ID,
	DATALENGTH(State)/1048576.0 AS StateSize,
	Version,
	StartDate,
	Originator, 
	Folio,
	Status
FROM Server.ProcInst WITH(NOLOCK)
WHERE Status IN (1, 2) AND DATALENGTH(State)/1048576.0 >= 1
ORDER BY DATALENGTH(State) DESC
