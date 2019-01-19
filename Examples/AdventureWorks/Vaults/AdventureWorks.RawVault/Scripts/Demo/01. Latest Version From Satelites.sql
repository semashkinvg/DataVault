
/*
note:
1. engine uses merge join
2. LastSeenDate is used to get latest version of the satelite
*/
SELECT * FROM dbo.HubProduct hp
INNER JOIN  dbo.SatProductAttributes spa ON hp.ProductHashKey = spa.ProductHashKey AND hp.LastSeenDate = spa.LoadDate
SELECT * FROM dbo.HubProduct hp
INNER JOIN dbo.SatProductDelivery spd ON hp.ProductHashKey = spd.ProductHashKey AND hp.LastSeenDate = spd.LoadDate
SELECT * FROM dbo.HubProduct hp
INNER JOIN dbo.SatProductFinance sof ON hp.ProductHashKey = sof.ProductHashKey AND hp.LastSeenDate = sof.LoadDate