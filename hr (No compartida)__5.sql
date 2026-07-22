--Funcion para calcular el total de una venta--
CREATE OR REPLACE FUNCTION fn_total_venta (
    p_id_venta IN venta.id_venta%TYPE
)
RETURN NUMBER
IS
    v_total NUMBER(12,2);
BEGIN
    SELECT NVL(SUM(subtotal), 0)
    INTO v_total
    FROM detalle_venta
    WHERE id_venta = p_id_venta;

    RETURN v_total;
END;
/
SELECT
    id_venta,
    fn_total_venta(id_venta) AS total_calculado
FROM venta;
ROLLBACK;