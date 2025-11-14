CREATE TABLE [Bicicleta] (
	[idBicicleta] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Numero_de_serie] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Marca] nvarchar(max) NOT NULL,
	[Modelo] nvarchar(max) NOT NULL,
	[Año_de_fabricacion] datetime NOT NULL,
	[foto] nvarchar(max) NOT NULL,
	[suspensión] int NOT NULL,
	[tipo_de_llantas] int NOT NULL,
	[idPunto_de_alquiler] int NOT NULL,
	[id_Seguro] int NOT NULL,
	[idRegla_operativa] int NOT NULL,
	[idTipo_de_bicicleta] int NOT NULL,
	PRIMARY KEY ([idBicicleta])
);

CREATE TABLE [Mantenimiento] (
	[idMantenimiento] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Fecha_de_mantenimiento] datetime NOT NULL,
	[Kilometraje_recorrido] decimal(18,0) NOT NULL,
	[Tipo_de_manteniemiento] nvarchar(max) NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	[idBicicleta] int NOT NULL,
	PRIMARY KEY ([idMantenimiento])
);

CREATE TABLE [Ciudad] (
	[idCiudad] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre_Ciudad] nvarchar(max) NOT NULL,
	[idDepartamento] int NOT NULL,
	PRIMARY KEY ([idCiudad])
);

CREATE TABLE [Pais] (
	[idPais] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre_Pais] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idPais])
);

CREATE TABLE [Persona] (
	[id_Persona] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(50) NOT NULL,
	[apellido] nvarchar(50) NOT NULL,
	[fecha_nacimiento] date NOT NULL,
	[Sexo] nvarchar(20) NOT NULL UNIQUE,
	[id_Tipo_de_persona] int NOT NULL,
	PRIMARY KEY ([id_Persona])
);

CREATE TABLE [Metodo_de_pago] (
	[id_metodo_pago] int IDENTITY(1,1) NOT NULL,
	[fecha_Registro] date NOT NULL,
	[fecha_modificacion] date NOT NULL,
	[idTipo_de_metodo] int NOT NULL,
	PRIMARY KEY ([id_metodo_pago])
);

CREATE TABLE [Plan] (
	[id_Plan] int IDENTITY(1,1) NOT NULL,
	[nombre_comercial_del_plan] nvarchar(max) NOT NULL,
	[descuentos_aplicables] float(53) NOT NULL,
	[indicador_si_incluye_seguro] nvarchar(max) NOT NULL,
	[categoria_de_bicicletas_incluidas] nvarchar(max) NOT NULL,
	[duración_incluida] datetime NOT NULL,
	[tipo_de_plan] nvarchar(max) NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	[estado_del_plan] nvarchar(50) NOT NULL,
	[precio_del_paquete] int NOT NULL,
	[beneficios_adicionales] nvarchar(max) NOT NULL,
	[restricciones_de_uso] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_Plan])
);

CREATE TABLE [Tipo_de_metodo] (
	[idTipo_de_metodo] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idTipo_de_metodo])
);

CREATE TABLE [Efectivo] (
	[id_metodo_pago] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Codigo_recibo] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_metodo_pago])
);

CREATE TABLE [Tarjeta] (
	[idMetodo_de_pago] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Franquicia] nvarchar(max) NOT NULL,
	[Tipo] nvarchar(max) NOT NULL,
	[numero_de_enmascarado] int NOT NULL,
	[Titular] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idMetodo_de_pago])
);

CREATE TABLE [Billetera_virtual] (
	[idMetodo_de_pago] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Identificador_de_cuenta] int NOT NULL UNIQUE,
	[Proveedor] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idMetodo_de_pago])
);

CREATE TABLE [Punto_de_alquiler] (
	[idPunto_de_alquiler] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Capacidad_total_de_bicicletas] int NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Foto] nvarchar(max) NOT NULL,
	[Direccion] nvarchar(max) NOT NULL,
	[Coordenadas_geograficas] nvarchar(max) NOT NULL,
	[Numero_de_bicicletas_almacenadas] int NOT NULL,
	[idCiudad] int NOT NULL,
	PRIMARY KEY ([idPunto_de_alquiler])
);

CREATE TABLE [Departamento] (
	[idDepartamento] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre_Departamento] nvarchar(max) NOT NULL,
	[idPais] int NOT NULL,
	PRIMARY KEY ([idDepartamento])
);

CREATE TABLE [Horario_de_atencion] (
	[idhorario] int IDENTITY(1,1) NOT NULL,
	[idPunto_de_alquiler] int NOT NULL,
	[dia_semana] nvarchar(20) NOT NULL,
	[rango_de_hora_de_atencion] time(7) NOT NULL,
	PRIMARY KEY ([idhorario])
);

CREATE TABLE [Métodos_de_pago_del_usuario] (
	[id_usuario] int NOT NULL,
	[id_metodo_de_pago_del_usuario] int IDENTITY(1,1) NOT NULL UNIQUE,
	[id_metodo_pago] int NOT NULL,
	PRIMARY KEY ([id_metodo_de_pago_del_usuario])
);

CREATE TABLE [Seguro] (
	[idSeguro] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	[Monto_maximo_de_indemnización] int NOT NULL,
	[Precio_del_plan] int NOT NULL,
	[Descripción] int NOT NULL,
	[Periodo_de_vigencia] datetime NOT NULL,
	[Descripción_de_daños_cubiertos] nvarchar(max) NOT NULL,
	[Terminos_y_condiciones] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idSeguro])
);

CREATE TABLE [Tarifa_base] (
	[idTarifa] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Precio_base] int NOT NULL,
	[idTipo_de_bicicleta] int NOT NULL,
	PRIMARY KEY ([idTarifa])
);

CREATE TABLE [Tipo_de_persona] (
	[id_tipo_de_persona] int IDENTITY(1,1) NOT NULL UNIQUE,
	PRIMARY KEY ([id_tipo_de_persona])
);

CREATE TABLE [Contacto] (
	[idContacto] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Numero_telefonico] int NOT NULL,
	[idPersona] int NOT NULL,
	PRIMARY KEY ([idContacto])
);

CREATE TABLE [Usuario] (
	[idPersona] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Correo] int NOT NULL UNIQUE,
	[Constraseña] int NOT NULL,
	PRIMARY KEY ([idPersona])
);

CREATE TABLE [Prestador_de_servicio] (
	[idPersona] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Tipo_de_servicio] nvarchar(max) NOT NULL,
	[id_Punto_de_alquiler] int NOT NULL,
	[id_Rutas_turisticas] int NOT NULL,
	PRIMARY KEY ([idPersona])
);

CREATE TABLE [Rutas_turisticas] (
	[idRuta_turistica] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	[Nivel_de_dificultad] int NOT NULL,
	[Distancia_total] int NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idRuta_turistica])
);

CREATE TABLE [Punto_de_interés] (
	[idPunto_de_interés] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	[Orden_secuencial_en_la_ruta] nvarchar(max) NOT NULL,
	[coordenadas_geograficas] nvarchar(max) NOT NULL,
	[Descripción] int NOT NULL,
	PRIMARY KEY ([idPunto_de_interés])
);

CREATE TABLE [Reseñable] (
	[idReseña] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Calificación] decimal(18,0) NOT NULL,
	[Fecha_de_publicación] date NOT NULL,
	[Texto_de_comentario] nvarchar(max) NOT NULL,
	[Estado_de_revisión] int NOT NULL,
	[id_Usuario] int NOT NULL,
	PRIMARY KEY ([idReseña])
);

CREATE TABLE [Multimedia] (
	[idMultimedia] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Estado_de_revision] nvarchar(max) NOT NULL,
	[Tamaño] int NOT NULL,
	[Formato_de_archivo] nvarchar(max) NOT NULL,
	[Fecha_de_subida] date NOT NULL,
	[Foto_o_video] nvarchar(max) NOT NULL,
	[idReseñable] int NOT NULL,
	PRIMARY KEY ([idMultimedia])
);

CREATE TABLE [Reglas_operativas] (
	[idReglaOperativa] int IDENTITY(1,1) NOT NULL UNIQUE,
	[porcentaje_de_recargo_retraso] float(53) NOT NULL,
	[porcentaje_de_recargo_por_punto_diferente] float(53) NOT NULL,
	[duración_máxima_de_alquiler_continuo] int NOT NULL,
	[disponibilidad_para_alquiler_de_largo_plazo] nvarchar(max) NOT NULL,
	[estado_de_la_configuración] nvarchar(max) NOT NULL,
	[restricciones_especiales_de_uso] nvarchar(max),
	PRIMARY KEY ([idReglaOperativa])
);

CREATE TABLE [Bicicleta_Reseña] (
	[idReselable] int IDENTITY(1,1) NOT NULL UNIQUE,
	[idBicicleta] int NOT NULL,
	PRIMARY KEY ([idReselable])
);

CREATE TABLE [Ruta_reseña] (
	[idReseñable] int IDENTITY(1,1) NOT NULL UNIQUE,
	PRIMARY KEY ([idReseñable])
);

CREATE TABLE [Prestador_de_servicio_reseña] (
	[idReseñable] int IDENTITY(1,1) NOT NULL UNIQUE,
	[idPrestador_de_servicio] int NOT NULL,
	PRIMARY KEY ([idReseñable])
);

CREATE TABLE [Recorrido_de_ruta] (
	[idRecorrido_de_ruta] int NOT NULL,
	[idRutas_turisticas] int IDENTITY(1,1) NOT NULL UNIQUE,
	[idPunto_de_interes] int NOT NULL,
	PRIMARY KEY ([idRecorrido_de_ruta])
);

CREATE TABLE [Reserva] (
	[idReserva] int IDENTITY(1,1) NOT NULL UNIQUE,
	[fecha_de_inicio_de_reserva] date NOT NULL,
	[fecha_de_hora_de_reserva] date NOT NULL,
	[fecha_de_fin_esperada] date NOT NULL,
	[estado_de_la_reserva] nvarchar(max) NOT NULL,
	[hora_de_devolución_real] datetime NOT NULL,
	[fecha_de_devolución_real] date NOT NULL,
	[hora_de_fin_esperada] datetime NOT NULL,
	[costo_total_reserva_caluclado] int NOT NULL,
	[idPlan] int NOT NULL,
	[idUsuario] int NOT NULL,
	[idBicicleta] int NOT NULL,
	[idPunto_de_alquiller] int NOT NULL,
	[idRuta_turistica] int NOT NULL,
	PRIMARY KEY ([idReserva])
);

CREATE TABLE [Tipo_de_bicicleta] (
	[idTipo_de_bicicleta] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Tipo_de_uso] nvarchar(max) NOT NULL,
	[Tipo_de_asistencia] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idTipo_de_bicicleta])
);

CREATE TABLE [Incidentes] (
	[idIncidentes] int IDENTITY(1,1) NOT NULL UNIQUE,
	[tipo_de_incidente] nvarchar(max) NOT NULL,
	[descripción] nvarchar(max) NOT NULL,
	[ubicación_donde_ocurrio] nvarchar(max) NOT NULL,
	[fecha_de_incidente] date NOT NULL,
	[foto] varbinary(max),
	[prioridad] nvarchar(max) NOT NULL,
	[estado_de_incidente] nvarchar(max) NOT NULL,
	[hora_de_incidente] datetime NOT NULL,
	[idPrestador_de_servicio] int NOT NULL,
	[idReserva] int NOT NULL,
	PRIMARY KEY ([idIncidentes])
);

CREATE TABLE [Transacción] (
	[idTransaccion] int IDENTITY(1,1) NOT NULL UNIQUE,
	[monto_total_cobrado] int NOT NULL,
	[tipo_de_transacción] nvarchar(max) NOT NULL,
	[observaciones_adicionales] nvarchar(max) NOT NULL,
	[fecha_de_transacción] date NOT NULL,
	[hora_de_transacción] datetime NOT NULL,
	[estado_de_transacción] nvarchar(max) NOT NULL,
	[referencia_de_pago] nvarchar(max) NOT NULL,
	[idReserva] int NOT NULL,
	PRIMARY KEY ([idTransaccion])
);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk8] FOREIGN KEY ([idPunto_de_alquiler]) REFERENCES [Punto_de_alquiler]([idPunto_de_alquiler]);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk9] FOREIGN KEY ([id_Seguro]) REFERENCES [Seguro]([idSeguro]);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk10] FOREIGN KEY ([idRegla_operativa]) REFERENCES [Reglas_operativas]([idReglaOperativa]);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk11] FOREIGN KEY ([idTipo_de_bicicleta]) REFERENCES [Tipo_de_bicicleta]([idTipo_de_bicicleta]);
ALTER TABLE [Mantenimiento] ADD CONSTRAINT [Mantenimiento_fk5] FOREIGN KEY ([idBicicleta]) REFERENCES [Bicicleta]([idBicicleta]);
ALTER TABLE [Ciudad] ADD CONSTRAINT [Ciudad_fk2] FOREIGN KEY ([idDepartamento]) REFERENCES [Departamento]([idDepartamento]);

ALTER TABLE [Persona] ADD CONSTRAINT [Persona_fk5] FOREIGN KEY ([id_Tipo_de_persona]) REFERENCES [Tipo_de_persona]([id_tipo_de_persona]);
ALTER TABLE [Metodo_de_pago] ADD CONSTRAINT [Metodo_de_pago_fk3] FOREIGN KEY ([idTipo_de_metodo]) REFERENCES [Tipo_de_metodo]([idTipo_de_metodo]);


ALTER TABLE [Efectivo] ADD CONSTRAINT [Efectivo_fk0] FOREIGN KEY ([id_metodo_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago]);
ALTER TABLE [Tarjeta] ADD CONSTRAINT [Tarjeta_fk0] FOREIGN KEY ([idMetodo_de_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago]);
ALTER TABLE [Billetera_virtual] ADD CONSTRAINT [Billetera_virtual_fk0] FOREIGN KEY ([idMetodo_de_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago]);
ALTER TABLE [Punto_de_alquiler] ADD CONSTRAINT [Punto_de_alquiler_fk0] FOREIGN KEY ([idPunto_de_alquiler]) REFERENCES [Ciudad]([idPunto_alquiler]);

ALTER TABLE [Punto_de_alquiler] ADD CONSTRAINT [Punto_de_alquiler_fk7] FOREIGN KEY ([idCiudad]) REFERENCES [Ciudad]([idCiudad]);
ALTER TABLE [Departamento] ADD CONSTRAINT [Departamento_fk2] FOREIGN KEY ([idPais]) REFERENCES [Pais]([idPais]);
ALTER TABLE [Horario_de_atencion] ADD CONSTRAINT [Horario_de_atencion_fk1] FOREIGN KEY ([idPunto_de_alquiler]) REFERENCES [Punto_de_alquiler]([idPunto_de_alquiler]);
ALTER TABLE [Métodos_de_pago_del_usuario] ADD CONSTRAINT [Métodos_de_pago_del_usuario_fk0] FOREIGN KEY ([id_usuario]) REFERENCES [Usuario]([idPersona]);

ALTER TABLE [Métodos_de_pago_del_usuario] ADD CONSTRAINT [Métodos_de_pago_del_usuario_fk2] FOREIGN KEY ([id_metodo_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago]);

ALTER TABLE [Tarifa_base] ADD CONSTRAINT [Tarifa_base_fk2] FOREIGN KEY ([idTipo_de_bicicleta]) REFERENCES [Tipo_de_bicicleta]([idTipo_de_bicicleta]);

ALTER TABLE [Contacto] ADD CONSTRAINT [Contacto_fk2] FOREIGN KEY ([idPersona]) REFERENCES [Persona]([id_Persona]);
ALTER TABLE [Usuario] ADD CONSTRAINT [Usuario_fk0] FOREIGN KEY ([idPersona]) REFERENCES [Persona]([id_Persona]);
ALTER TABLE [Prestador_de_servicio] ADD CONSTRAINT [Prestador_de_servicio_fk0] FOREIGN KEY ([idPersona]) REFERENCES [Persona]([id_Persona]);

ALTER TABLE [Prestador_de_servicio] ADD CONSTRAINT [Prestador_de_servicio_fk2] FOREIGN KEY ([id_Punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([idPunto_de_alquiler]);

ALTER TABLE [Prestador_de_servicio] ADD CONSTRAINT [Prestador_de_servicio_fk3] FOREIGN KEY ([id_Rutas_turisticas]) REFERENCES [Rutas_turisticas]([idRuta_turistica]);


ALTER TABLE [Reseñable] ADD CONSTRAINT [Reseñable_fk5] FOREIGN KEY ([id_Usuario]) REFERENCES [Usuario]([idPersona]);
ALTER TABLE [Multimedia] ADD CONSTRAINT [Multimedia_fk6] FOREIGN KEY ([idReseñable]) REFERENCES [Reseñable]([idReseña]);

ALTER TABLE [Bicicleta_Reseña] ADD CONSTRAINT [Bicicleta_Reseña_fk0] FOREIGN KEY ([idReselable]) REFERENCES [Reseñable]([idReseña]);

ALTER TABLE [Bicicleta_Reseña] ADD CONSTRAINT [Bicicleta_Reseña_fk1] FOREIGN KEY ([idBicicleta]) REFERENCES [Bicicleta]([idBicicleta]);
ALTER TABLE [Ruta_reseña] ADD CONSTRAINT [Ruta_reseña_fk0] FOREIGN KEY ([idReseñable]) REFERENCES [Reseñable]([idReseña]);
ALTER TABLE [Prestador_de_servicio_reseña] ADD CONSTRAINT [Prestador_de_servicio_reseña_fk0] FOREIGN KEY ([idReseñable]) REFERENCES [Reseñable]([idReseña]);

ALTER TABLE [Prestador_de_servicio_reseña] ADD CONSTRAINT [Prestador_de_servicio_reseña_fk1] FOREIGN KEY ([idPrestador_de_servicio]) REFERENCES [Prestador_de_servicio]([idPersona]);
ALTER TABLE [Recorrido_de_ruta] ADD CONSTRAINT [Recorrido_de_ruta_fk1] FOREIGN KEY ([idRutas_turisticas]) REFERENCES [Rutas_turisticas]([idRuta_turistica]);

ALTER TABLE [Recorrido_de_ruta] ADD CONSTRAINT [Recorrido_de_ruta_fk2] FOREIGN KEY ([idPunto_de_interes]) REFERENCES [Punto_de_interés]([idPunto_de_interés]);
ALTER TABLE [Reserva] ADD CONSTRAINT [Reserva_fk9] FOREIGN KEY ([idPlan]) REFERENCES [Plan]([id_Plan]);

ALTER TABLE [Reserva] ADD CONSTRAINT [Reserva_fk10] FOREIGN KEY ([idUsuario]) REFERENCES [Usuario]([idPersona]);

ALTER TABLE [Reserva] ADD CONSTRAINT [Reserva_fk11] FOREIGN KEY ([idBicicleta]) REFERENCES [Bicicleta]([idBicicleta]);

ALTER TABLE [Reserva] ADD CONSTRAINT [Reserva_fk12] FOREIGN KEY ([idPunto_de_alquiller]) REFERENCES [Punto_de_alquiler]([idPunto_de_alquiler]);

ALTER TABLE [Reserva] ADD CONSTRAINT [Reserva_fk13] FOREIGN KEY ([idRuta_turistica]) REFERENCES [Rutas_turisticas]([idRuta_turistica]);


ALTER TABLE [Incidentes] ADD CONSTRAINT [Incidentes_fk9] FOREIGN KEY ([idPrestador_de_servicio]) REFERENCES [Prestador_de_servicio]([idPersona]);

ALTER TABLE [Incidentes] ADD CONSTRAINT [Incidentes_fk10] FOREIGN KEY ([idReserva]) REFERENCES [Reserva]([idReserva]);
ALTER TABLE [Transacción] ADD CONSTRAINT [Transacción_fk8] FOREIGN KEY ([idReserva]) REFERENCES [Reserva]([idReserva]);