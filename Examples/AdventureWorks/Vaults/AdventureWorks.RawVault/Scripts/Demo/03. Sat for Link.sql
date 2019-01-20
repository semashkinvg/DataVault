
/*
note:
1. Comparision of indexing (clustered) strategies of link by joining its satelite
*/

SELECT count(1) FROM dbo.LinkOrderProduct lop
INNER JOIN dbo.SatLinkOrderProduct slop ON slop.LinkOrderProductHashKey = lop.LinkOrderProductHashKey
--INNER JOIN dbo.HubOrder ho ON ho.OrderHashKey = lop.OrderHashKey
--INNER JOIN dbo.HubProduct hp ON lop.ProductHashKey = hp.ProductHashKey

SELECT count(1) FROM dbo.LinkOrderProduct2 lop
INNER JOIN dbo.SatLinkOrderProduct slop ON slop.LinkOrderProductHashKey = lop.LinkOrderProductHashKey
--INNER JOIN dbo.HubOrder ho ON ho.OrderHashKey = lop.OrderHashKey
--INNER JOIN dbo.HubProduct hp ON lop.ProductHashKey = hp.ProductHashKey


SELECT * FROM dbo.LinkOrderProduct lop
INNER JOIN dbo.SatLinkOrderProduct slop ON slop.LinkOrderProductHashKey = lop.LinkOrderProductHashKey AND slop.LoadDate = lop.LastSeenDate
INNER JOIN dbo.HubOrder ho ON ho.OrderHashKey = lop.OrderHashKey
INNER JOIN dbo.HubProduct hp ON lop.ProductHashKey = hp.ProductHashKey
 WHERE ho.OrderNumber = 'SO66065'