--10.1. Restricción para asegurar valores correctos--
ALTER TABLE detalle_venta
ADD CONSTRAINT ck_detalle_venta_cantidad
CHECK (cantidad > 0);

ALTER TABLE detalle_venta
ADD CONSTRAINT ck_detalle_venta_precio
CHECK (precio_unitario >= 0);

ALTER TABLE detalle_venta
ADD CONSTRAINT ck_detalle_venta_subtotal
CHECK (subtotal >= 0);

--10.2. Trigger para calcular automáticamente el subtotal--
CREATE OR REPLACE TRIGGER trg_calcular_subtotal_venta
BEFORE INSERT OR UPDATE OF cantidad, precio_unitario
ON detalle_venta
FOR EACH ROW
BEGIN
    IF :NEW.cantidad <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20010,
            'La cantidad debe ser mayor que cero.'
        );
    END IF;

    IF :NEW.precio_unitario < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20011,
            'El precio unitario no puede ser negativo.'
        );
    END IF;

    :NEW.subtotal := :NEW.cantidad * :NEW.precio_unitario;
END;    
/

--10. Redundancia controlada en compras--
CREATE OR REPLACE TRIGGER trg_calcular_subtotal_compra
BEFORE INSERT OR UPDATE OF cantidad, precio_unitario
ON detalle_compra
FOR EACH ROW
BEGIN
    IF :NEW.cantidad <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20020,
            'La cantidad comprada debe ser mayor que cero.'
        );
    END IF;

    IF :NEW.precio_unitario < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20021,
            'El precio unitario no puede ser negativo.'
        );
    END IF;

    :NEW.subtotal := :NEW.cantidad * :NEW.precio_unitario;
END;
/
--Función para calcular el total de una compra--
CREATE OR REPLACE FUNCTION fn_total_compra (
    p_id_compra IN compra.id_compra%TYPE
)
RETURN NUMBER
IS
    v_total NUMBER(12,2);
BEGIN
    SELECT NVL(SUM(subtotal), 0)
    INTO v_total
    FROM detalle_compra
    WHERE id_compra = p_id_compra;

    RETURN v_total;
END;
/
COMMIT;