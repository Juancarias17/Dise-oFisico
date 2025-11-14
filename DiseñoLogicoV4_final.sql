
CREATE TABLE [Pais] (
	[id_pais] int IDENTITY(1,1) NOT NULL,
	[Nombre_Pais] nvarchar(100) NOT NULL,
	PRIMARY KEY ([id_pais])
);

CREATE TABLE [Departamento] (
	[id_departamento] int IDENTITY(1,1) NOT NULL,
	[Nombre_Departamento] nvarchar(100) NOT NULL,
	[id_pais] int NOT NULL,
	PRIMARY KEY ([id_departamento]),
	CONSTRAINT [FK_Departamento_Pais] FOREIGN KEY ([id_pais]) REFERENCES [Pais]([id_pais])
);

CREATE TABLE [Ciudad] (
	[id_ciudad] int IDENTITY(1,1) NOT NULL,
	[Nombre_Ciudad] nvarchar(100) NOT NULL,
	[id_departamento] int NOT NULL,
	PRIMARY KEY ([id_ciudad]),
	CONSTRAINT [FK_Ciudad_Departamento] FOREIGN KEY ([id_departamento]) REFERENCES [Departamento]([id_departamento])
);



CREATE TABLE [Plan] (
	[id_plan] int IDENTITY(1,1) NOT NULL,
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
	PRIMARY KEY ([id_plan]),
	CONSTRAINT [CK_Plan_Estado] CHECK ([estado_del_plan] IN ('Activo', 'Inactivo'))
);

CREATE TABLE [Punto_de_alquiler] (
	[id_punto_de_alquiler] int IDENTITY(1,1) NOT NULL,
	[Capacidad_total_de_bicicletas] int NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Foto] nvarchar(max) NOT NULL, 
	[Direccion] nvarchar(max) NOT NULL,
	[Coordenadas_geograficas] nvarchar(max) NOT NULL,
	[Numero_de_bicicletas_almacenadas] int NOT NULL,
	[id_ciudad] int NOT NULL,
	PRIMARY KEY ([id_punto_de_alquiler]),
	CONSTRAINT [FK_PuntoAlquiler_Ciudad] FOREIGN KEY ([id_ciudad]) REFERENCES [Ciudad]([id_ciudad]),	
	CONSTRAINT [CK_PuntoAlquiler_Capacidad] CHECK ([Numero_de_bicicletas_almacenadas] <= [Capacidad_total_de_bicicletas])
);


CREATE TABLE [Tipo_de_persona] (
	[id_tipo_de_persona] int IDENTITY(1,1) NOT NULL,
	[Nombre_tipo] nvarchar(50) NOT NULL CHECK ([Nombre_tipo] IN ('Usuario', 'Prestador de servicio')),
	PRIMARY KEY ([id_tipo_de_persona])
);

CREATE TABLE [Persona] (
	[id_persona] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(50) NOT NULL,
	[apellido] nvarchar(50) NOT NULL,
	[fecha_nacimiento] date NOT NULL,
	[Sexo] nvarchar(20) NOT NULL,
	[id_Tipo_de_persona] int NOT NULL,
	PRIMARY KEY ([id_persona]),
	CONSTRAINT [FK_Persona_Tipo] FOREIGN KEY ([id_Tipo_de_persona]) REFERENCES [Tipo_de_persona]([id_tipo_de_persona]),
	CONSTRAINT [CK_Persona_Sexo] CHECK ([Sexo] IN ('Masculino', 'Femenino')),
	CONSTRAINT [CK_Persona_Edad] CHECK (DATEDIFF(year, [fecha_nacimiento], GETDATE()) >= 18)
);

CREATE TABLE [Contacto] (
	[id_contacto] int IDENTITY(1,1) NOT NULL,
	[Numero_telefonico] nvarchar(20) NOT NULL UNIQUE,
	[id_persona] int NOT NULL,
	PRIMARY KEY ([id_contacto]),
	CONSTRAINT [FK_Contacto_Persona] FOREIGN KEY ([id_persona]) REFERENCES [Persona]([id_persona])
);

CREATE TABLE [Usuario] (
	[id_persona] int NOT NULL,
	[correo] nvarchar(100) NOT NULL UNIQUE,
	[Contraseña] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_persona]),
	CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY ([id_persona]) REFERENCES [Persona]([id_persona]),
);

CREATE TABLE [Horario_de_atencion] (
	[id_horario] int IDENTITY(1,1) NOT NULL,
	[dia_semana] nvarchar(20) NOT NULL,
	[hora_apertura] time(7) NOT NULL,
	[hora_cierre] time(7) NOT NULL,
	PRIMARY KEY ([id_horario])	
);

CREATE TABLE [Horario_punto] (
	[id_horario_punto] int IDENTITY(1,1) NOT NULL,
	[id_horario] int NOT NULL,
	[id_punto_de_alquiler] int NOT NULL,
	PRIMARY KEY([id_horario_punto]),
	CONSTRAINT [FK_Horario_PuntoAlquiler] FOREIGN KEY ([id_punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([id_punto_de_alquiler]),
	CONSTRAINT [FK_HorarioPunto_Horario] FOREIGN KEY ([id_horario]) REFERENCES [Horario_de_atencion]([id_horario])
);

CREATE TABLE [Ruta_turistica] (
	[id_ruta] int IDENTITY(1,1) NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Nivel_de_dificultad] nvarchar(10) NOT NULL, 
	[Distancia_total] int NOT NULL, 
	[Descripcion] nvarchar(100) NOT NULL, 
	PRIMARY KEY ([id_ruta]),
	CONSTRAINT [CK_Rutas_Dificultad] CHECK ([Nivel_de_dificultad] IN ('Fácil', 'Moderado', 'Difícil'))
);



CREATE TABLE [Punto_de_interes] (
	[id_punto_de_interes] int IDENTITY(1,1) NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Orden_secuencial_en_la_ruta] int NOT NULL,
	[coordenadas_geograficas] nvarchar(max) NOT NULL,
	[Descripción] nvarchar(100) NOT NULL, 
	PRIMARY KEY ([id_punto_de_interes])
);

CREATE TABLE [Recorrido_de_ruta] (
	[id_recorrido_de_ruta] int NOT NULL,
	[id_ruta] int NOT NULL,
	[id_punto_de_interes] int NOT NULL,
	PRIMARY KEY ([id_recorrido_de_ruta]),
	CONSTRAINT [FK_Recorrido_Ruta] FOREIGN KEY ([id_ruta]) REFERENCES [Ruta_turistica]([id_ruta]),
	CONSTRAINT [FK_Recorrido_Punto] FOREIGN KEY ([id_punto_de_interes]) REFERENCES [Punto_de_interes]([id_punto_de_interes])
);

CREATE TABLE [Prestador_de_servicio] (
	[id_persona] int NOT NULL, 
	[Tipo_de_servicio] nvarchar(max) NOT NULL, 
	[id_Punto_de_alquiler] int NULL,
	[id_ruta] int NULL,
	PRIMARY KEY ([id_persona]),
	CONSTRAINT [FK_Prestador_Ruta] FOREIGN KEY ([id_ruta]) REFERENCES [Ruta_turistica]([id_ruta]),
	CONSTRAINT [FK_Prestador_Persona] FOREIGN KEY ([id_persona]) REFERENCES [Persona]([id_persona]),
	CONSTRAINT [FK_Prestador_Punto_Alquiler] FOREIGN KEY ([id_Punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([id_punto_de_alquiler])
	ON DELETE SET NULL
);


CREATE TABLE [Seguro] (
	[id_seguro] int IDENTITY(1,1) NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Monto_maximo_de_indemnización] decimal(10, 2) NOT NULL, 
	[Precio_del_plan] decimal(10, 2) NOT NULL,
	[Descripción] nvarchar(max) NOT NULL, 
	[Periodo_de_vigencia] datetime NOT NULL, 
	[Descripción_de_daños_cubiertos] nvarchar(max) NOT NULL,
	[Terminos_y_condiciones] nvarchar(max) NOT NULL, 
	PRIMARY KEY ([id_seguro]),
	CONSTRAINT [CK_Seguro_Monto] CHECK ([Monto_maximo_de_indemnización] > 0)
);

CREATE TABLE [Tipo_de_bicicleta] (
	[id_tipo_de_bicicleta] int IDENTITY(1,1) NOT NULL,
	[Tipo_de_uso] nvarchar(max) NOT NULL,
	[Tipo_de_asistencia] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_tipo_de_bicicleta])
);

CREATE TABLE [Tarifa_base] (
	[id_tarifa_base] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Precio_base] int NOT NULL,
	[id_tipo_de_bicicleta] int NOT NULL,
	PRIMARY KEY ([id_tarifa_base]),
	CONSTRAINT [FK_Tarifa_Tipo] FOREIGN KEY ([id_tipo_de_bicicleta]) REFERENCES [Tipo_de_bicicleta]([id_tipo_de_bicicleta])
);


CREATE TABLE [Regla_operativa] (
	[id_regla_operativa] int IDENTITY(1,1) NOT NULL UNIQUE,
	[porcentaje_de_recargo_retraso] float(53) NOT NULL,
	[porcentaje_de_recargo_por_punto_diferente] float(53) NOT NULL,
	[duración_máxima_de_alquiler_continuo] int NOT NULL,
	[disponibilidad_para_alquiler_de_largo_plazo] nvarchar(max) NOT NULL,
	[estado_de_la_configuración] nvarchar(max) NOT NULL,
	[restricciones_especiales_de_uso] nvarchar(max),
	PRIMARY KEY ([id_regla_operativa])
);

CREATE TABLE [Bicicleta] (
	[id_bicicleta] int IDENTITY(1,1) NOT NULL,
	[Numero_de_serie] int NOT NULL UNIQUE, 
	[Marca] nvarchar(max) NOT NULL,
	[Modelo] nvarchar(max) NOT NULL,
	[Año_de_fabricacion] datetime NOT NULL,
	[foto] nvarchar(max) NOT NULL, 
	[suspensión] nvarchar(100) NOT NULL, 
	[tipo_de_llantas] nvarchar(100) NOT NULL, 
	[peso] decimal(5, 2) NOT NULL,
	[id_tipo_de_bicicleta] int NOT NULL, 
	[id_punto_de_alquiler] int NOT NULL, 
	[id_Seguro] int NULL, 
	[id_tarifa_base] int NOT NULL,
	[id_regla_operativa] int NOT NULL, 
	PRIMARY KEY ([id_bicicleta]),
	CONSTRAINT [FK_Bicicleta_Tipo] FOREIGN KEY ([id_tipo_de_bicicleta]) REFERENCES [Tipo_de_bicicleta]([id_tipo_de_bicicleta]),
	CONSTRAINT [FK_Bicicleta_Punto_Alquiler] FOREIGN KEY ([id_punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([id_punto_de_alquiler]),
	CONSTRAINT [FK_Bicicleta_Seguro] FOREIGN KEY ([id_Seguro]) REFERENCES [Seguro]([id_seguro]),
	CONSTRAINT [FK_Bicicleta_Tarifa] FOREIGN KEY ([id_tarifa_base]) REFERENCES [Tarifa_base]([id_tarifa_base]),
	CONSTRAINT [FK_Bicicleta_Regla] FOREIGN KEY ([id_regla_operativa]) REFERENCES [Regla_operativa]([id_regla_operativa])
);

CREATE TABLE [Reserva] (
	[id_reserva] int IDENTITY(1,1) NOT NULL UNIQUE,
	[fecha_de_inicio_de_reserva] date NOT NULL,
	[fecha_de_hora_de_reserva] date NOT NULL,
	[fecha_de_fin_esperada] date NOT NULL,
	[estado_de_la_reserva] nvarchar(max) NOT NULL,
	[hora_de_devolución_real] datetime NOT NULL,
	[fecha_de_devolución_real] date NOT NULL,
	[hora_de_fin_esperada] datetime NOT NULL,
	[costo_total_reserva_caluclado] int NOT NULL,
	[id_plan] int NOT NULL,
	[id_usuario] int NOT NULL,
	[id_bicicleta] int NOT NULL,
	[id_punto_de_alquiler] int NOT NULL,
	[id_ruta] int NOT NULL,
	PRIMARY KEY ([id_reserva]),
	CONSTRAINT [FK_Reserva_Plan] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_plan]),
	CONSTRAINT [FK_Reserva_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [Usuario]([id_persona]),
	CONSTRAINT [FK_Reserva_Bicicleta] FOREIGN KEY ([id_bicicleta]) REFERENCES [Bicicleta]([id_bicicleta]),
	CONSTRAINT [FK_Reserva_Punto] FOREIGN KEY ([id_punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([id_punto_de_alquiler]),
	CONSTRAINT [FK_Reserva_Ruta] FOREIGN KEY ([id_ruta]) REFERENCES [Ruta_turistica]([id_ruta])
);

CREATE TABLE [Mantenimiento] (
	[id_mantenimiento] int IDENTITY(1,1) NOT NULL,
	[Fecha_de_mantenimiento] datetime NOT NULL, 
	[Kilometraje_recorrido] decimal(18,0) NOT NULL, 
	[Tipo_de_mantenimiento] nvarchar(20) NOT NULL,
	[Descripcion] nvarchar(40) NOT NULL,
	[id_bicicleta] int NOT NULL, 
	PRIMARY KEY ([id_mantenimiento]),
	CONSTRAINT [FK_Mantenimiento_Bicicleta] FOREIGN KEY ([id_bicicleta]) REFERENCES [Bicicleta]([id_bicicleta])
	ON DELETE CASCADE,
	CONSTRAINT [CK_Mantenimiento_Tipo] CHECK ([Tipo_de_mantenimiento] IN ('Preventivo', 'Correctivo'))
);

CREATE TABLE [Tipo_de_metodo] (
	[id_tipo_de_metodo] int IDENTITY(1,1) NOT NULL,
	[Nombre] nvarchar(20) NOT NULL,
	PRIMARY KEY ([id_tipo_de_metodo]),	
	CONSTRAINT [CK_tipo_Metodo_Nombre] CHECK ([Nombre] IN ('Tarjeta', 'Billetera virtual', 'Efectivo'))
);

CREATE TABLE [Metodo_de_pago] (
	[id_metodo_pago] int IDENTITY(1,1) NOT NULL,
	[fecha_Registro] date NOT NULL, 
	[fecha_modificacion] date NOT NULL, 
	[id_tipo_de_metodo] int NOT NULL,
	PRIMARY KEY ([id_metodo_pago]),
	CONSTRAINT [FK_Metodo_Pago_Tipo] FOREIGN KEY ([id_tipo_de_metodo]) REFERENCES [Tipo_de_metodo]([id_tipo_de_metodo])
);

CREATE TABLE [Efectivo] (
	[id_metodo_pago] int NOT NULL,
	[Codigo_recibo] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_metodo_pago]),
	CONSTRAINT [FK_Efectivo_Metodo_Pago] FOREIGN KEY ([id_metodo_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago])
	ON DELETE CASCADE
);

CREATE TABLE [Tarjeta] (
	[id_metodo_de_pago] int NOT NULL,
	[Franquicia] nvarchar(20) NOT NULL, 
	[Tipo] nvarchar(10) NOT NULL, 
	[numero_de_enmascarado] nvarchar(20) NOT NULL, 
	[Titular] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_metodo_de_pago]),
	CONSTRAINT [FK_Tarjeta_MetodoPago] FOREIGN KEY ([id_metodo_de_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago])
	ON DELETE CASCADE,
	CONSTRAINT [CK_Tarjeta_Franquicia] CHECK ([Franquicia] IN ('Visa', 'MasterCard', 'American Express')),
	CONSTRAINT [CK_Tarjeta_Tipo] CHECK ([Tipo] IN ('Crédito', 'Débito'))
);

CREATE TABLE [Billetera_virtual] (
	[id_metodo_de_pago] int NOT NULL,
	[Identificador_de_cuenta] nvarchar(100) NOT NULL UNIQUE, 
	[Proveedor] nvarchar(20) NOT NULL, 
	PRIMARY KEY ([id_metodo_de_pago]),
	CONSTRAINT [FK_Billetera_MetodoPago] FOREIGN KEY ([id_metodo_de_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago])
	ON DELETE CASCADE,
	CONSTRAINT [CK_Billetera_Proveedor] CHECK ([Proveedor] = 'PayPal')
);

CREATE TABLE [Métodos_de_pago_del_usuario] (
	[id_metodo_pago_del_usuario] int IDENTITY(1,1) NOT NULL,
	[id_usuario] int NOT NULL,	
	[id_metodo_pago] int NOT NULL UNIQUE,
	PRIMARY KEY ([id_metodo_pago_del_usuario]),
	CONSTRAINT [FK_MetodoUsuario_Persona] FOREIGN KEY ([id_usuario]) REFERENCES [Usuario]([id_persona])
	ON DELETE CASCADE,
	CONSTRAINT [FK_MetodoUsuario_MetodoPago] FOREIGN KEY ([id_metodo_pago]) REFERENCES [Metodo_de_pago]([id_metodo_pago])
	ON DELETE CASCADE
);
CREATE TABLE [Objeto_reseñable] (
	[id_objeto_reseñable] int IDENTITY(1,1) NOT NULL,
	[id_bicicleta] int NULL,
	[id_persona] int NULL,
	[id_ruta] int NULL,
	PRIMARY KEY ([id_objeto_reseñable]),
	CONSTRAINT [FK_Objeto_Bicicleta] FOREIGN KEY ([id_bicicleta]) REFERENCES [Bicicleta]([id_bicicleta]),
	CONSTRAINT [FK_Objeto_Prestador] FOREIGN KEY ([id_persona]) REFERENCES [Prestador_de_servicio]([id_persona]),
	CONSTRAINT [FK_Objeto_Ruta] FOREIGN KEY ([id_ruta]) REFERENCES [Ruta_turistica]([id_ruta])
);

CREATE TABLE [Multimedia] (
	[id_multimedia] int IDENTITY(1,1) NOT NULL,
	[Estado_de_revision] nvarchar(10) NOT NULL, 
	[Tamaño] bigint NOT NULL, 
	[Formato_de_archivo] nvarchar(5) NOT NULL, 
	[Fecha_de_subida] date NOT NULL,
	[Foto_o_video] nvarchar(max) NOT NULL,  
	PRIMARY KEY ([id_multimedia]),
	CONSTRAINT [CK_Multimedia_Estado] CHECK ([Estado_de_revision] IN ('Pendiente', 'Aprobado', 'Rechazado')),
	CONSTRAINT [CK_Multimedia_Tamaño] CHECK ([Tamaño] <= 60000000), 
	CONSTRAINT [CK_Multimedia_Formato] CHECK ([Formato_de_archivo] IN ('JPG', 'JPEG', 'PNG', 'WEBP', 'MP4'))
);	

CREATE TABLE [Reseña] (
	[id_reseña] int IDENTITY(1,1) NOT NULL,
	[Calificación] decimal(2, 1) NULL, 
	[Fecha_de_publicación] date NOT NULL,
	[Texto_de_comentario] nvarchar(max) NOT NULL,
	[Estado_de_revisión] nvarchar(10) NOT NULL,
	[id_usuario] int NOT NULL,
	[id_multimedia] int NULL,
	[id_objeto_reseñable] int NOT NULL,
	PRIMARY KEY ([id_reseña]),
	CONSTRAINT [CK_Reseña_Calificacion] CHECK ([Calificación] >= 1.0 AND [Calificación] <= 5.0),
	CONSTRAINT [CK_Reseña_Estado] CHECK ([Estado_de_revisión] IN ('Pendiente', 'Aprobada', 'Rechazada')),
	CONSTRAINT [FK_Reseña_Usuario] FOREIGN KEY ([id_usuario]) REFERENCES [Usuario]([id_persona]),
	CONSTRAINT [FK_Reseña_Multimedia] FOREIGN KEY ([id_multimedia]) REFERENCES [Multimedia]([id_multimedia]),
	CONSTRAINT [FK_Reseña_Objeto] FOREIGN KEY ([id_objeto_reseñable]) REFERENCES [Objeto_reseñable]([id_objeto_reseñable])
);


CREATE TABLE [Incidente] (
	[id_incidente] int IDENTITY(1,1) NOT NULL,
	[tipo_de_incidente] nvarchar(max) NOT NULL,
	[descripción] nvarchar(max) NOT NULL,
	[ubicación_donde_ocurrio] nvarchar(max) NOT NULL,
	[fecha_de_incidente] date NOT NULL,
	[foto] varbinary(max),
	[prioridad] nvarchar(max) NOT NULL,
	[estado_de_incidente] nvarchar(max) NOT NULL,
	[hora_de_incidente] datetime NOT NULL,
	[id_persona] int NOT NULL,
	[id_reserva] int NOT NULL,
	PRIMARY KEY ([id_incidente]),
	CONSTRAINT [FK_Incidente_Servicio] FOREIGN KEY ([id_persona]) REFERENCES [Prestador_de_servicio]([id_persona]),
	CONSTRAINT [FK_Incidente_Reserva] FOREIGN KEY ([id_reserva]) REFERENCES [Reserva]([id_reserva])
);

CREATE TABLE [Transaccion] (
	[id_transaccion] int IDENTITY(1,1) NOT NULL,
	[monto_total_cobrado] int NOT NULL,
	[tipo_de_transacción] nvarchar(max) NOT NULL,
	[observaciones_adicionales] nvarchar(max) NOT NULL,
	[fecha_de_transacción] date NOT NULL,
	[hora_de_transacción] datetime NOT NULL,
	[estado_de_transacción] nvarchar(max) NOT NULL,
	[referencia_de_pago] nvarchar(max) NOT NULL,
	[id_reserva] int NOT NULL,
	PRIMARY KEY ([id_transaccion]),
	CONSTRAINT [FK_Transaccion_Reserva] FOREIGN KEY ([id_reserva]) REFERENCES [Reserva]([id_reserva])
);
