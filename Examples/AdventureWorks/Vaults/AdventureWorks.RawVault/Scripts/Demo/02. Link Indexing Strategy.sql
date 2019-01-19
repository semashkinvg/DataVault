
/*
note:
1. Comparision of indexing (clustered) strategies
*/

SELECT count(1) FROM dbo.LinkOrderProduct lop
INNER JOIN dbo.HubOrder ho ON ho.OrderHashKey = lop.OrderHashKey
INNER JOIN dbo.HubProduct hp ON lop.ProductHashKey = hp.ProductHashKey

SELECT count(1) FROM dbo.LinkOrderProduct2 lop
INNER JOIN dbo.HubOrder ho ON ho.OrderHashKey = lop.OrderHashKey
INNER JOIN dbo.HubProduct hp ON lop.ProductHashKey = hp.ProductHashKey
