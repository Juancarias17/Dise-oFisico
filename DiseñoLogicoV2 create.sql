CREATE TABLE [Bicicleta] (
	[idBicicleta] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Numero_de_serie] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Marca] nvarchar(max) NOT NULL,
	[Modelo] nvarchar(max) NOT NULL,
	[Año_de_fabricacion] datetime NOT NULL,
	[Estado] nvarchar(max) NOT NULL,
	[Tarifa_base] int NOT NULL,
	[id_Tipo_de_bicicleta] int NOT NULL,
	[idTipo_de_Asistencia] int NOT NULL,
	[idPunto_de_alquiler] int NOT NULL,
	[id_Plan] int NOT NULL,
	PRIMARY KEY ([idBicicleta])
);

CREATE TABLE [Mantenimiento] (
	[idMantenimiento] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Ultima_fecha_de_mantenimiento] datetime NOT NULL,
	[Kilometros_recorridos] decimal(18,0) NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	[idBicicleta] int NOT NULL,
	PRIMARY KEY ([idMantenimiento])
);

CREATE TABLE [Ciudad] (
	[idCiudad] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	[idDepartamento] int NOT NULL,
	PRIMARY KEY ([idCiudad])
);

CREATE TABLE [Departamento] (
	[idDepartamento] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	[idPais] int NOT NULL,
	PRIMARY KEY ([idDepartamento])
);

CREATE TABLE [Pais] (
	[idPais] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idPais])
);

CREATE TABLE [Tipo_de_bicicleta] (
	[idTipo_de_Bicicleta] int IDENTITY(1,1) NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	[Suspención] nvarchar(max) NOT NULL,
	[Llantas] int NOT NULL,
	[peso] decimal(18,0) NOT NULL,
	[Tipo_de_uso] nvarchar(max) NOT NULL,
	[tipo_de_asistencia] int NOT NULL,
	PRIMARY KEY ([idTipo_de_Bicicleta])
);

CREATE TABLE [usuario] (
	[id_usuario] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(50) NOT NULL,
	[apellido] nvarchar(50) NOT NULL,
	[correo] nvarchar(100) NOT NULL UNIQUE,
	[fecha_nacimiento] date NOT NULL,
	[numero_telefonico] nvarchar(20) NOT NULL UNIQUE,
	[id_plan] int NOT NULL,
	[id_metodo_pago] int NOT NULL,
	PRIMARY KEY ([id_usuario])
);

CREATE TABLE [metodo_de_pago] (
	[id_metodo_pago] int IDENTITY(1,1) NOT NULL,
	[fecha_Registro] date NOT NULL,
	[fecha_modificacion] date NOT NULL,
	[idTipo_de_metodo] int NOT NULL,
	PRIMARY KEY ([id_metodo_pago])
);

CREATE TABLE [tipo_de_plan] (
	[id_tipo_plan] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(50) NOT NULL,
	PRIMARY KEY ([id_tipo_plan])
);

CREATE TABLE [Plan] (
	[id_Plan] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(50) NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	[fecha_inicio] date NOT NULL,
	[fecha_vigencia] date NOT NULL,
	[estado] nvarchar(50) NOT NULL,
	[id_tipo_plan] int NOT NULL,
	PRIMARY KEY ([id_Plan])
);

CREATE TABLE [Tipo_de_metodo] (
	[idTipo_de_metodo] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Nombre] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idTipo_de_metodo])
);

CREATE TABLE [Efectivo] (
	[id_metodo_pago] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Codigo_recibido] int NOT NULL,
	PRIMARY KEY ([id_metodo_pago])
);

CREATE TABLE [Tarjeta_credito_o_debito] (
	[idMetodo_de_pago] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Fecha_de_expiracion] date NOT NULL,
	[Franquicia] nvarchar(max) NOT NULL,
	[Tipo] nvarchar(max) NOT NULL,
	[numero_de_enmascarado] int NOT NULL,
	PRIMARY KEY ([idMetodo_de_pago])
);

CREATE TABLE [Billetera_virtual] (
	[idMetodo_de_pago] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Identificador_de_cuenta] int NOT NULL UNIQUE,
	[Proveedor] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idMetodo_de_pago])
);

CREATE TABLE [Por_hora] (
	[id_Plan] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Descripcion] nvarchar(max) NOT NULL,
	[Duracion_maxima] decimal(18,0) NOT NULL,
	[Duracion_minima] decimal(18,0) NOT NULL,
	[Tarifa_por_fraccion_adicional] int NOT NULL,
	[Tarifa_por_hora] int NOT NULL,
	PRIMARY KEY ([id_Plan])
);

CREATE TABLE [Combos_de_dias] (
	[id_Plan] int NOT NULL,
	[Numero_de_dias] int NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	[Tarifa_por_combo_de_dias] int NOT NULL,
	PRIMARY KEY ([id_Plan])
);

CREATE TABLE [Mensual] (
	[id_Plan] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Tarifa_mensual] int NOT NULL,
	[Renovacion_automatica] date NOT NULL,
	[Descuentos_especiales] float(53) NOT NULL,
	[Descripcion] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_Plan])
);

CREATE TABLE [Anual] (
	[id_Plan] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Descripcion] nvarchar(max) NOT NULL,
	[Beneficios_exclusivos] nvarchar(max) NOT NULL,
	[Tarifa_anual] int NOT NULL,
	[Renovacion_automatica] date NOT NULL,
	PRIMARY KEY ([id_Plan])
);

CREATE TABLE [Punto_de_alquiler] (
	[idPunto_de_alquiler] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Numero_de_bicicletas] int NOT NULL,
	[Detalles_de_servicio] nvarchar(max) NOT NULL,
	[Horario_de_atencion] nvarchar(max) NOT NULL,
	[Persona_de_contacto] nvarchar(max) NOT NULL,
	[Numero_telefonico] nvarchar(max) NOT NULL,
	[Direccion] nvarchar(max) NOT NULL,
	[idCiudad] int NOT NULL,
	PRIMARY KEY ([idPunto_de_alquiler])
);

CREATE TABLE [Horario_de_atencion] (
	[idhorario] int IDENTITY(1,1) NOT NULL,
	[idPunto_de_alquiler] int NOT NULL,
	[dia_semana] nvarchar(20) NOT NULL,
	[hora_apertura] time(7) NOT NULL,
	[hora_cierre] time(7) NOT NULL,
	[descripcion] nvarchar(250) NOT NULL,
	PRIMARY KEY ([idhorario])
);

CREATE TABLE [Punto_servicio] (
	[idPunto_de_servicio] int IDENTITY(1,1) NOT NULL,
	[idPunto_de_alquiler] int NOT NULL,
	[idServicio] int NOT NULL,
	[detalles] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idPunto_de_servicio])
);

CREATE TABLE [Tipo_de_asistencia] (
	[idTipo_de_asistencia] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(100) NOT NULL,
	[descripcion] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idTipo_de_asistencia])
);

CREATE TABLE [combo_de_detalle] (
	[idcombo_detalle] int IDENTITY(1,1) NOT NULL,
	[id_plan] int NOT NULL,
	[dia_semana] nvarchar(20) NOT NULL,
	PRIMARY KEY ([idcombo_detalle])
);

CREATE TABLE [servicio] (
	[idservicio] int NOT NULL,
	[nombre] nvarchar(max) NOT NULL,
	[descripcion] nvarchar(max) NOT NULL,
	PRIMARY KEY ([idservicio])
);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk7] FOREIGN KEY ([id_Tipo_de_bicicleta]) REFERENCES [Tipo_de_bicicleta]([idTipo_de_Bicicleta]);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk8] FOREIGN KEY ([idTipo_de_Asistencia]) REFERENCES [Tipo_De_Asistencia]([idTipo_de_Asistencia]);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk9] FOREIGN KEY ([idPunto_de_alquiler]) REFERENCES [Punto_de_alquiler]([idPunto_de_alquiler]);

ALTER TABLE [Bicicleta] ADD CONSTRAINT [Bicicleta_fk10] FOREIGN KEY ([id_Plan]) REFERENCES [Plan]([id_Plan]);
ALTER TABLE [Mantenimiento] ADD CONSTRAINT [Mantenimiento_fk4] FOREIGN KEY ([idBicicleta]) REFERENCES [Bicicleta]([idBicicleta]);
ALTER TABLE [Ciudad] ADD CONSTRAINT [Ciudad_fk2] FOREIGN KEY ([idDepartamento]) REFERENCES [Departamento]([idDepartamento]);
ALTER TABLE [Departamento] ADD CONSTRAINT [Departamento_fk2] FOREIGN KEY ([idPais]) REFERENCES [Pais]([idPais]);

ALTER TABLE [Tipo_de_bicicleta] ADD CONSTRAINT [Tipo_de_bicicleta_fk7] FOREIGN KEY ([tipo_de_asistencia]) REFERENCES [Tipo_de_asistencia]([idTipo_de_asistencia]);
ALTER TABLE [usuario] ADD CONSTRAINT [usuario_fk6] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_Plan]);

ALTER TABLE [usuario] ADD CONSTRAINT [usuario_fk7] FOREIGN KEY ([id_metodo_pago]) REFERENCES [metodo_de_pago]([id_metodo_pago]);
ALTER TABLE [metodo_de_pago] ADD CONSTRAINT [metodo_de_pago_fk3] FOREIGN KEY ([idTipo_de_metodo]) REFERENCES [Tipo_de_metodo]([idTipo_de_metodo]);

ALTER TABLE [Plan] ADD CONSTRAINT [Plan_fk6] FOREIGN KEY ([id_tipo_plan]) REFERENCES [tipo_de_plan]([id_tipo_plan]);

ALTER TABLE [Efectivo] ADD CONSTRAINT [Efectivo_fk0] FOREIGN KEY ([id_metodo_pago]) REFERENCES [metodo_de_pago]([id_metodo_pago]);
ALTER TABLE [Tarjeta_credito_o_debito] ADD CONSTRAINT [Tarjeta_credito_o_debito_fk0] FOREIGN KEY ([idMetodo_de_pago]) REFERENCES [metodo_de_pago]([id_metodo_pago]);
ALTER TABLE [Billetera_virtual] ADD CONSTRAINT [Billetera_virtual_fk0] FOREIGN KEY ([idMetodo_de_pago]) REFERENCES [metodo_de_pago]([id_metodo_pago]);
ALTER TABLE [Por_hora] ADD CONSTRAINT [Por_hora_fk0] FOREIGN KEY ([id_Plan]) REFERENCES [Plan]([id_Plan]);
ALTER TABLE [Combos_de_dias] ADD CONSTRAINT [Combos_de_dias_fk0] FOREIGN KEY ([id_Plan]) REFERENCES [Plan]([id_Plan]);
ALTER TABLE [Mensual] ADD CONSTRAINT [Mensual_fk0] FOREIGN KEY ([id_Plan]) REFERENCES [Plan]([id_Plan]);
ALTER TABLE [Anual] ADD CONSTRAINT [Anual_fk0] FOREIGN KEY ([id_Plan]) REFERENCES [Plan]([id_Plan]);
ALTER TABLE [Punto_de_alquiler] ADD CONSTRAINT [Punto_de_alquiler_fk0] FOREIGN KEY ([idPunto_de_alquiler]) REFERENCES [Ciudad]([idPunto_alquiler]);

ALTER TABLE [Punto_de_alquiler] ADD CONSTRAINT [Punto_de_alquiler_fk7] FOREIGN KEY ([idCiudad]) REFERENCES [Ciudad]([idCiudad]);
ALTER TABLE [Horario_de_atencion] ADD CONSTRAINT [Horario_de_atencion_fk1] FOREIGN KEY ([idPunto_de_alquiler]) REFERENCES [Punto_de_alquiler]([idPunto_de_alquiler]);
ALTER TABLE [Punto_servicio] ADD CONSTRAINT [Punto_servicio_fk1] FOREIGN KEY ([idPunto_de_alquiler]) REFERENCES [Punto_de_alquiler]([idPunto_de_alquiler]);

ALTER TABLE [Punto_servicio] ADD CONSTRAINT [Punto_servicio_fk2] FOREIGN KEY ([idServicio]) REFERENCES [servicio]([idservicio]);

ALTER TABLE [combo_de_detalle] ADD CONSTRAINT [combo_de_detalle_fk1] FOREIGN KEY ([id_plan]) REFERENCES [Combos_de_dias]([id_Plan]);
