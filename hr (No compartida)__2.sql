--Productos vendidos por encima del promedio--
SELECT
    p.id_producto,
    p.nombre,
    SUM(dv.cantidad) AS total_unidades_vendidas
FROM producto p
JOIN detalle_venta dv
    ON p.id_producto = dv.id_producto
GROUP BY
    p.id_producto,
    p.nombre
HAVING SUM(dv.cantidad) > (
    SELECT AVG(total_producto)
    FROM (
        SELECT SUM(cantidad) AS total_producto
        FROM detalle_venta
        GROUP BY id_producto
    )
)
ORDER BY total_unidades_vendidas DESC;

--Agrupamiento total de ventas por cliente--
SELECT
    c.id_cliente,
    c.nombres || ' ' || c.apellidos AS cliente,
    COUNT(v.id_venta) AS cantidad_ventas,
    SUM(v.total) AS total_comprado,
    ROUND(AVG(v.total), 2) AS promedio_por_venta
FROM cliente c
JOIN venta v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nombres,
    c.apellidos
ORDER BY total_comprado DESC;

--clasificación de clientes por volumen de compra--
SELECT
    c.id_cliente,
    c.nombres || ' ' || c.apellidos AS cliente,
    NVL(SUM(v.total), 0) AS total_comprado,

    CASE
        WHEN NVL(SUM(v.total), 0) >= 5000 THEN 'CLIENTE PREMIUM'
        WHEN NVL(SUM(v.total), 0) >= 2000 THEN 'CLIENTE FRECUENTE'
        WHEN NVL(SUM(v.total), 0) > 0 THEN 'CLIENTE OCASIONAL'
        ELSE 'SIN COMPRAS'
    END AS clasificacion

FROM cliente c
LEFT JOIN venta v
    ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente,
    c.nombres,
    c.apellidos
ORDER BY total_comprado DESC;

-- estado del inventario de productos--
SELECT
    id_producto,
    nombre,
    stock,

    DECODE(
        SIGN(stock),
        -1, 'STOCK INCORRECTO',
         0, 'AGOTADO',
            'DISPONIBLE'
    ) AS estado_general

FROM producto
ORDER BY stock ASC;

--CASE para una clasificación más detallada del stock--
SELECT
    id_producto,
    nombre,
    stock,

    CASE
        WHEN stock = 0 THEN 'AGOTADO'
        WHEN stock BETWEEN 1 AND 20 THEN 'STOCK CRÍTICO'
        WHEN stock BETWEEN 21 AND 50 THEN 'STOCK BAJO'
        ELSE 'STOCK SUFICIENTE'
    END AS estado_stock

FROM producto
ORDER BY stock;

--Subconsulta correlacionada: última venta de cada cliente--
SELECT
    c.id_cliente,
    c.nombres || ' ' || c.apellidos AS cliente,
    (
        SELECT MAX(v.fecha)
        FROM venta v
        WHERE v.id_cliente = c.id_cliente
    ) AS ultima_fecha_compra
FROM cliente c
ORDER BY ultima_fecha_compra DESC NULLS LAST;

--Agrupamiento por mes: ingresos mensuales--
SELECT
    TO_CHAR(fecha, 'YYYY-MM') AS periodo,
    COUNT(id_venta) AS numero_ventas,
    SUM(total) AS ingreso_total,
    ROUND(AVG(total), 2) AS promedio_venta
FROM venta
GROUP BY TO_CHAR(fecha, 'YYYY-MM')
ORDER BY periodo;

--Productos mas vendidos utilizando subconsulta--
SELECT
    p.id_producto,
    p.nombre,
    SUM(dv.cantidad) AS unidades_vendidas
FROM producto p
JOIN detalle_venta dv
    ON p.id_producto = dv.id_producto
GROUP BY
    p.id_producto,
    p.nombre
HAVING SUM(dv.cantidad) = (
    SELECT MAX(total_vendido)
    FROM (
        SELECT SUM(cantidad) AS total_vendido
        FROM detalle_venta
        GROUP BY id_producto
    )
);

-- Clasificación de proveedores con CASE--
SELECT
    pr.id_proveedor,
    pr.nombre_company AS nombre_proveedor,
    COUNT(c.id_compra) AS numero_compras,
    NVL(SUM(c.total), 0) AS monto_comprado,

    CASE
        WHEN NVL(SUM(c.total), 0) >= 10000
            THEN 'PROVEEDOR ESTRATÉGICO'

        WHEN NVL(SUM(c.total), 0) >= 5000
            THEN 'PROVEEDOR FRECUENTE'

        WHEN NVL(SUM(c.total), 0) > 0
            THEN 'PROVEEDOR OCASIONAL'

        ELSE 'SIN COMPRAS'
    END AS tipo_proveedor

FROM proveedor pr

LEFT JOIN compra c
    ON pr.id_proveedor = c.id_proveedor

GROUP BY
    pr.id_proveedor,
    pr.nombre_company

ORDER BY monto_comprado DESC;

--Consulta de produccion por periodo y empleado--
SELECT
    e.id_empleado,
    e.nombre AS empleado,
    e.cargo,
    COUNT(pr.id_produccion) AS lotes_realizados,
    SUM(pr.cantidad_producida) AS unidades_producidas,
    ROUND(AVG(pr.cantidad_producida), 2) AS promedio_por_lote
FROM empleado e
JOIN produccion pr
    ON e.id_empleado = pr.id_empleado
WHERE pr.fecha BETWEEN
      TO_DATE('01/01/2026', 'DD/MM/YYYY')
      AND
      TO_DATE('31/12/2026', 'DD/MM/YYYY')
GROUP BY
    e.id_empleado,
    e.nombre,
    e.cargo
ORDER BY unidades_producidas DESC;

ROLLBACK;