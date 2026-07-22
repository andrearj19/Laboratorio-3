-- ====================================================================
-- PASO 3: CREACIÓN DE ÍNDICES ADICIONALES PARA LLAVES FORÁNEAS (FK)
-- ====================================================================

CREATE INDEX idx_fk_prod_cat ON producto(id_categoria) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_produccion_prod ON produccion(id_producto) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_produccion_emp ON produccion(id_empleado) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_det_prod_prod ON detalle_produccion(id_produccion) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_det_prod_mat ON detalle_produccion(id_materia) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_compra_prov ON compra(id_proveedor) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_det_comp_comp ON detalle_compra(id_compra) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_det_comp_mat ON detalle_compra(id_materia) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_venta_cli ON venta(id_cliente) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_det_vent_vent ON detalle_venta(id_venta) TABLESPACE TS_ILE_INDICES;
CREATE INDEX idx_fk_det_vent_prod ON detalle_venta(id_producto) TABLESPACE TS_ILE_INDICES;

