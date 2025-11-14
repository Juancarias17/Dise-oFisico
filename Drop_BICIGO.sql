-- Borrar tablas que tienen claves foráneas a otras
-- Se listan en orden inverso de sus dependencias para evitar errores de restricción.
DROP TABLE [Transaccion];
DROP TABLE [Incidente];
DROP TABLE [Reseña];
DROP TABLE [Multimedia];
DROP TABLE [Objeto_reseñable];

-- Métodos de pago y sus subtipos
DROP TABLE [Métodos_de_pago_del_usuario];
DROP TABLE [Billetera_virtual];
DROP TABLE [Tarjeta];
DROP TABLE [Efectivo];
DROP TABLE [Metodo_de_pago];
DROP TABLE [Tipo_de_metodo];

-- Bicicletas, Reservas y sus dependencias
DROP TABLE [Mantenimiento];
DROP TABLE [Reserva];
DROP TABLE [Bicicleta];
DROP TABLE [Regla_operativa];
DROP TABLE [Tarifa_base];
DROP TABLE [Tipo_de_bicicleta];
DROP TABLE [Seguro];
DROP TABLE [Plan];

-- Rutas y Puntos de Interés
DROP TABLE [Recorrido_de_ruta];
DROP TABLE [Punto_de_interes];

-- Personas y sus subtipos
DROP TABLE [Prestador_de_servicio];
DROP TABLE [Usuario];
DROP TABLE [Contacto];
DROP TABLE [Persona];
DROP TABLE [Tipo_de_persona];

-- Puntos de Alquiler y Horarios
DROP TABLE [Horario_punto];
DROP TABLE [Horario_de_atencion];
DROP TABLE [Ruta_turistica];
DROP TABLE [Punto_de_alquiler];
-- Estructura Geográfica (País, Departamento, Ciudad)
DROP TABLE [Ciudad];
DROP TABLE [Departamento];
DROP TABLE [Pais];