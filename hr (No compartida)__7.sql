--TRIGGER--
CREATE OR REPLACE TRIGGER trg_actualizar_total_venta
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    UPDATE venta
    SET total = NVL(total, 0) + :NEW.subtotal
    WHERE id_venta = :NEW.id_venta;
END;

SELECT object_name, object_type, status
FROM user_objects
WHERE object_name = 'TRG_ACTUALIZAR_TOTAL_VENTA';

SELECT *
FROM detalle_venta
WHERE id_detalle = 1001;

--Paso 1. Registrar la cabecera de la venta--
INSERT INTO venta (
    id_venta,
    fecha,
    total,
    id_cliente
)
VALUES (
    502,
    SYSDATE,
    0,
    1
);

COMMIT;
--Ejecutar el procedimiento--
BEGIN
    sp_registrar_detalle_venta(
        p_id_detalle  => 1001,
        p_id_venta    => 502,
        p_id_producto => 1,
        p_cantidad    => 5
    );
END;
/

COMMIT;

--Comprovar el detalle--
SELECT *
FROM detalle_venta
WHERE id_venta = 502;
--Comprobar el total actualizado--
SELECT id_venta, fecha, total, id_cliente
FROM venta
WHERE id_venta = 502;
--Comprobar el stock--
SELECT id_producto, nombre, precio, stock
FROM producto
WHERE id_producto = 1;
COMMIT;
