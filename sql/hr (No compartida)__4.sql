--Procedimiento para registrar el detalle de venta--
CREATE OR REPLACE PROCEDURE sp_registrar_detalle_venta (
    p_id_detalle      IN detalle_venta.id_detalle%TYPE,
    p_id_venta        IN detalle_venta.id_venta%TYPE,
    p_id_producto     IN detalle_venta.id_producto%TYPE,
    p_cantidad        IN detalle_venta.cantidad%TYPE
)
IS
    v_precio producto.precio%TYPE;
    v_stock  producto.stock%TYPE;
BEGIN
    IF p_cantidad <= 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'La cantidad vendida debe ser mayor que cero.'
        );
    END IF;

    SELECT precio, stock
    INTO v_precio, v_stock
    FROM producto
    WHERE id_producto = p_id_producto
    FOR UPDATE NOWAIT;

    IF v_stock < p_cantidad THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Stock insuficiente. Stock disponible: ' || v_stock
        );
    END IF;

    INSERT INTO detalle_venta (
        id_detalle,
        cantidad,
        precio_unitario,
        subtotal,
        id_venta,
        id_producto
    )
    VALUES (
        p_id_detalle,
        p_cantidad,
        v_precio,
        p_cantidad * v_precio,
        p_id_venta,
        p_id_producto
    );

    UPDATE producto
    SET stock = stock - p_cantidad
    WHERE id_producto = p_id_producto;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'El producto indicado no existe.'
        );

    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'El identificador del detalle ya está registrado.'
        );

    WHEN OTHERS THEN
        IF SQLCODE = -54 THEN
            RAISE_APPLICATION_ERROR(
                -20005,
                'El producto está bloqueado por otra sesión. Cierre otras pestañas o ejecute COMMIT/ROLLBACK.'
            );
        ELSE
            RAISE;
        END IF;
END;
/

ROLLBACK;

