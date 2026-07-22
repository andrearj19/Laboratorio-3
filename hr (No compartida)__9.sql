--Índice para ventas por cliente y fecha--
CREATE INDEX idx_venta_cliente_fecha
ON venta(id_cliente, fecha);
--Consulta--
SELECT *
FROM venta
WHERE id_cliente = 15
AND fecha BETWEEN
    TO_DATE('01/01/2026', 'DD/MM/YYYY')
    AND TO_DATE('31/12/2026', 'DD/MM/YYYY');


--Índice para buscar detalles por producto--
CREATE INDEX idx_detalle_venta_producto
ON detalle_venta(id_producto);
--Consulta--
SELECT SUM(cantidad)
FROM detalle_venta
WHERE id_producto = 10;

--Índice para compras por proveedor y fecha--
CREATE INDEX idx_compra_proveedor_fecha
ON compra(id_proveedor, fecha);
--Consulta--
SELECT *
FROM compra
WHERE id_proveedor = 5
ORDER BY fecha;
--Índice para producción por producto y fecha--
CREATE INDEX idx_produccion_producto_fecha
ON produccion(id_producto, fecha);

EXPLAIN PLAN FOR
SELECT
    v.id_venta,
    v.fecha,
    v.total
FROM venta v
WHERE v.id_cliente = 15
AND v.fecha BETWEEN
    TO_DATE('01/01/2026', 'DD/MM/YYYY')
    AND TO_DATE('31/12/2026', 'DD/MM/YYYY');
    
    SELECT *
FROM TABLE(DBMS_XPLAN.DISPLAY);