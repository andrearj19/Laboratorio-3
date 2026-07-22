--Categoria--
INSERT INTO categoria (
    id_categoria,
    nombre_categoria
)
VALUES (
    1,
    'Especias molidas'
);

INSERT INTO categoria (
    id_categoria,
    nombre_categoria
)
VALUES (
    2,
    'Hierbas aromáticas'
);

INSERT INTO categoria (
    id_categoria,
    nombre_categoria
)
VALUES (
    3,
    'Condimentos'
);

INSERT INTO categoria (
    id_categoria,
    nombre_categoria
)
VALUES (
    4,
    'Salsas'
);
--Producto--
INSERT INTO producto (
    id_producto,
    nombre,
    descripcion,
    precio,
    stock,
    id_categoria
)
VALUES (
    1,
    'Orégano molido ILE 50g',
    'Orégano seco molido en presentación de 50 gramos',
    1.25,
    500,
    1
);

INSERT INTO producto (
    id_producto,
    nombre,
    descripcion,
    precio,
    stock,
    id_categoria
)
VALUES (
    2,
    'Comino molido ILE 50g',
    'Comino molido en presentación de 50 gramos',
    1.50,
    350,
    1
);

INSERT INTO producto (
    id_producto,
    nombre,
    descripcion,
    precio,
    stock,
    id_categoria
)
VALUES (
    3,
    'Pimienta negra molida 60g',
    'Pimienta negra molida en presentación de 60 gramos',
    1.80,
    300,
    1
);

INSERT INTO producto (
    id_producto,
    nombre,
    descripcion,
    precio,
    stock,
    id_categoria
)
VALUES (
    4,
    'Ajo en polvo ILE 80g',
    'Ajo deshidratado en polvo',
    2.00,
    250,
    3
);

INSERT INTO producto (
    id_producto,
    nombre,
    descripcion,
    precio,
    stock,
    id_categoria
)
VALUES (
    5,
    'Canela molida 50g',
    'Canela molida en presentación de 50 gramos',
    2.25,
    200,
    1
);

INSERT INTO producto (
    id_producto,
    nombre,
    descripcion,
    precio,
    stock,
    id_categoria
)
VALUES (
    6,
    'Salsa de ají ILE',
    'Salsa picante elaborada con ají seleccionado',
    2.50,
    150,
    4
);
--Cliente--
INSERT INTO cliente (
    id_cliente,
    nombres,
    apellidos,
    cedula,
    direccion,
    telefono
)
VALUES (
    1,
    'Ana',
    'Gómez',
    '1104594064',
    'Loja, sector El Valle',
    '0991111111'
);

INSERT INTO cliente (
    id_cliente,
    nombres,
    apellidos,
    cedula,
    direccion,
    telefono
)
VALUES (
    2,
    'Luis',
    'Maldonado',
    '1101277915',
    'Loja, avenida Universitaria',
    '0992222222'
);

INSERT INTO cliente (
    id_cliente,
    nombres,
    apellidos,
    cedula,
    direccion,
    telefono
)
VALUES (
    3,
    'María',
    'Pérez',
    '1102080313',
    'Catamayo, zona central',
    '0993333333'
);

INSERT INTO cliente (
    id_cliente,
    nombres,
    apellidos,
    cedula,
    direccion,
    telefono
)
VALUES (
    4,
    'Carlos',
    'Torres',
    '1103456789',
    'Loja, sector La Tebaida',
    '0994444444'
);

INSERT INTO cliente (
    id_cliente,
    nombres,
    apellidos,
    cedula,
    direccion,
    telefono
)
VALUES (
    5,
    'Diana',
    'Espinoza',
    '1104567890',
    'Loja, sector San Sebastián',
    '0995555555'
);

--Proveedores--
INSERT INTO proveedor (
    id_proveedor,
    nombre_company,
    ruc,
    telefono
)
VALUES (
    1,
    'Agrícola del Austro S.A.',
    '1104567890001',
    '072570001'
);

INSERT INTO proveedor (
    id_proveedor,
    nombre_company,
    ruc,
    telefono
)
VALUES (
    2,
    'Especias Andinas Cía. Ltda.',
    '1105678901001',
    '072570002'
);

INSERT INTO proveedor (
    id_proveedor,
    nombre_company,
    ruc,
    telefono
)
VALUES (
    3,
    'Productos Naturales Loja',
    '1106789012001',
    '072570003'
);

COMMIT;

--Materias Prima--
INSERT INTO materia_prima (
    id_materia,
    nombre,
    unidad_medida,
    stock
)
VALUES (
    1,
    'Orégano seco en hojas',
    'Kilogramos',
    1200.50
);

INSERT INTO materia_prima (
    id_materia,
    nombre,
    unidad_medida,
    stock
)
VALUES (
    2,
    'Comino en grano',
    'Kilogramos',
    950.75
);

INSERT INTO materia_prima (
    id_materia,
    nombre,
    unidad_medida,
    stock
)
VALUES (
    3,
    'Pimienta negra en grano',
    'Kilogramos',
    700.25
);

INSERT INTO materia_prima (
    id_materia,
    nombre,
    unidad_medida,
    stock
)
VALUES (
    4,
    'Ajo deshidratado',
    'Kilogramos',
    850.00
);

INSERT INTO materia_prima (
    id_materia,
    nombre,
    unidad_medida,
    stock
)
VALUES (
    5,
    'Canela en rama',
    'Kilogramos',
    600.50
);

--Empleado--
INSERT INTO empleado (
    id_empleado,
    nombre,
    cargo
)
VALUES (
    1,
    'Carlos Armijos',
    'Operador de Producción A'
);

INSERT INTO empleado (
    id_empleado,
    nombre,
    cargo
)
VALUES (
    2,
    'Diana Espinoza',
    'Operador de Producción B'
);

INSERT INTO empleado (
    id_empleado,
    nombre,
    cargo
)
VALUES (
    3,
    'Mateo Castillo',
    'Supervisor de Planta'
);

INSERT INTO empleado (
    id_empleado,
    nombre,
    cargo
)
VALUES (
    4,
    'Andrea Jaramillo',
    'Jefe de Producción'
);

--Compras--
INSERT INTO compra (
    id_compra,
    fecha,
    total,
    id_proveedor
)
VALUES (
    1,
    DATE '2026-01-10',
    1825.00,
    1
);

INSERT INTO compra (
    id_compra,
    fecha,
    total,
    id_proveedor
)
VALUES (
    2,
    DATE '2026-02-15',
    1550.00,
    2
);

INSERT INTO compra (
    id_compra,
    fecha,
    total,
    id_proveedor
)
VALUES (
    3,
    DATE '2026-03-20',
    1200.00,
    3
);

--DETALLES DE COMPRAS--
--Compra 1--
INSERT INTO detalle_compra (
    id_detalle_compra,
    cantidad,
    precio_unitario,
    subtotal,
    id_compra,
    id_materia
)
VALUES (
    1,
    500,
    2.00,
    1000.00,
    1,
    1
);

INSERT INTO detalle_compra (
    id_detalle_compra,
    cantidad,
    precio_unitario,
    subtotal,
    id_compra,
    id_materia
)
VALUES (
    2,
    300,
    2.75,
    825.00,
    1,
    2
);
--Compra 2--
INSERT INTO detalle_compra (
    id_detalle_compra,
    cantidad,
    precio_unitario,
    subtotal,
    id_compra,
    id_materia
)
VALUES (
    3,
    250,
    3.20,
    800.00,
    2,
    3
);

INSERT INTO detalle_compra (
    id_detalle_compra,
    cantidad,
    precio_unitario,
    subtotal,
    id_compra,
    id_materia
)
VALUES (
    4,
    300,
    2.50,
    750.00,
    2,
    4
);
--Compra3--
INSERT INTO detalle_compra (
    id_detalle_compra,
    cantidad,
    precio_unitario,
    subtotal,
    id_compra,
    id_materia
)
VALUES (
    5,
    400,
    3.00,
    1200.00,
    3,
    5
);

--Registro Produccion--
INSERT INTO produccion (
    id_produccion,
    fecha,
    cantidad_producida,
    id_producto,
    id_empleado
)
VALUES (
    1,
    DATE '2026-01-20',
    500,
    1,
    1
);

INSERT INTO produccion (
    id_produccion,
    fecha,
    cantidad_producida,
    id_producto,
    id_empleado
)
VALUES (
    2,
    DATE '2026-02-20',
    400,
    2,
    2
);

INSERT INTO produccion (
    id_produccion,
    fecha,
    cantidad_producida,
    id_producto,
    id_empleado
)
VALUES (
    3,
    DATE '2026-03-25',
    350,
    3,
    1
);

INSERT INTO produccion (
    id_produccion,
    fecha,
    cantidad_producida,
    id_producto,
    id_empleado
)
VALUES (
    4,
    DATE '2026-04-10',
    300,
    4,
    2
);

INSERT INTO produccion (
    id_produccion,
    fecha,
    cantidad_producida,
    id_producto,
    id_empleado
)
VALUES (
    5,
    DATE '2026-05-15',
    250,
    5,
    1
);

--Detalles produccion--
INSERT INTO detalle_produccion (
    id_detalle_produccion,
    cantidad_utilizada,
    id_produccion,
    id_materia
)
VALUES (
    1,
    25.50,
    1,
    1
);

INSERT INTO detalle_produccion (
    id_detalle_produccion,
    cantidad_utilizada,
    id_produccion,
    id_materia
)
VALUES (
    2,
    20.75,
    2,
    2
);

INSERT INTO detalle_produccion (
    id_detalle_produccion,
    cantidad_utilizada,
    id_produccion,
    id_materia
)
VALUES (
    3,
    22.25,
    3,
    3
);

INSERT INTO detalle_produccion (
    id_detalle_produccion,
    cantidad_utilizada,
    id_produccion,
    id_materia
)
VALUES (
    4,
    30.00,
    4,
    4
);

INSERT INTO detalle_produccion (
    id_detalle_produccion,
    cantidad_utilizada,
    id_produccion,
    id_materia
)
VALUES (
    5,
    18.50,
    5,
    5
);

--Ventas--
INSERT INTO venta (
    id_venta,
    fecha,
    total,
    id_cliente
)
VALUES (
    1,
    DATE '2026-01-25',
    18.50,
    1
);

INSERT INTO venta (
    id_venta,
    fecha,
    total,
    id_cliente
)
VALUES (
    2,
    DATE '2026-02-28',
    15.40,
    2
);

INSERT INTO venta (
    id_venta,
    fecha,
    total,
    id_cliente
)
VALUES (
    3,
    DATE '2026-03-15',
    20.25,
    3
);

INSERT INTO venta (
    id_venta,
    fecha,
    total,
    id_cliente
)
VALUES (
    4,
    DATE '2026-04-22',
    19.20,
    1
);

INSERT INTO venta (
    id_venta,
    fecha,
    total,
    id_cliente
)
VALUES (
    5,
    DATE '2026-05-30',
    16.50,
    4
);

--DETALLES VENTAS--
--VENTA 1--
INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    1,
    10,
    1.25,
    12.50,
    1,
    1
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    2,
    4,
    1.50,
    6.00,
    1,
    2
);
--VENTA 2--
INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    3,
    8,
    1.25,
    10.00,
    2,
    1
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    4,
    3,
    1.80,
    5.40,
    2,
    3
);
--VENTA 3--
INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    5,
    7,
    1.25,
    8.75,
    3,
    1
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    6,
    5,
    1.50,
    7.50,
    3,
    2
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    7,
    2,
    2.00,
    4.00,
    3,
    4
);
--Venta 4--
INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    8,
    6,
    1.25,
    7.50,
    4,
    1
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    9,
    3,
    1.50,
    4.50,
    4,
    2
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    10,
    4,
    1.80,
    7.20,
    4,
    3
);
--Venta 5--
INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    11,
    4,
    1.25,
    5.00,
    5,
    1
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    12,
    2,
    1.50,
    3.00,
    5,
    2
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    13,
    2,
    2.00,
    4.00,
    5,
    4
);

INSERT INTO detalle_venta (
    id_detalle,
    cantidad,
    precio_unitario,
    subtotal,
    id_venta,
    id_producto
)
VALUES (
    14,
    2,
    2.25,
    4.50,
    5,
    5
);
COMMIT;

ROLLBACK;