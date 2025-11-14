CREATE TABLE [dbo].[Departamento] (
[idDepartamento] int NOT NULL IDENTITY(1,1),
[Nombre] nvarchar(200) NOT NULL,
[idPais] int NOT NULL,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idDepartamento])
);

CREATE TABLE [dbo].[usuario] (
[id_usuario] int NOT NULL IDENTITY(1,1),
[nombre] nvarchar(50),
[apellido] nvarchar(50),
[correo] nvarchar(100),
[fecha_nacimiento] date,
[numero_telefonico] nvarchar(20),
[id_plan] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_usuario])
);

CREATE TABLE [dbo].[Efectivo] (
[id_metodo_pago] int NOT NULL,
[Codigo_recibido] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_metodo_pago])
);

CREATE TABLE [dbo].[Mensual] (
[id_Plan] int NOT NULL,
[Tarifa_mensual] int,
[Renovacion_automatica] date,
[Descuentos_especiales] float(53),
[Descripcion] nvarchar(1000),
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_Plan])
);

CREATE TABLE [dbo].[Pais] (
[idPais] int NOT NULL IDENTITY(1,1),
[Nombre] nvarchar(200) NOT NULL,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idPais])
);

CREATE TABLE [dbo].[Tipo_de_bicicleta] (
[idTipo_de_Bicicleta] int NOT NULL IDENTITY(1,1),
[Nombre] nvarchar(200) NOT NULL,
[Descripcion] nvarchar(1000),
[Suspención] nvarchar(200),
[Llantas] int,
[peso] decimal(10,2),
[Tipo_de_uso] nvarchar(200),
[tipo_de_asistencia] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idTipo_de_Bicicleta])
);

CREATE TABLE [dbo].[Punto_servicio] (
[idPunto_de_servicio] int NOT NULL IDENTITY(1,1),
[idPunto_de_alquiler] int NOT NULL,
[idServicio] int NOT NULL,
[detalles] nvarchar(max),
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idPunto_de_servicio])
);

CREATE TABLE [dbo].[Punto_de_alquiler] (
[idPunto_de_alquiler] int NOT NULL IDENTITY(1,1),
[Numero_de_bicicletas] int,
[Detalles_de_servicio] nvarchar(1000),
[Horario_de_atencion] nvarchar(500),
[Persona_de_contacto] nvarchar(200),
[Numero_telefonico] nvarchar(50),
[Direccion] nvarchar(500),
[idCiudad] int NOT NULL,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idPunto_de_alquiler])
);

CREATE TABLE [dbo].[Tarjeta_credito_o_debito] (
[idMetodo_de_pago] int NOT NULL,
[Fecha_de_expiracion] date,
[Franquicia] nvarchar(200),
[Tipo] nvarchar(100),
[numero_de_enmascarado] nvarchar(50),
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idMetodo_de_pago])
);

CREATE TABLE [dbo].[Plann] (
[id_Plan] int NOT NULL IDENTITY(1,1),
[nombre] nvarchar(100) NOT NULL,
[Descripcion] nvarchar(1000),
[fecha_inicio] date,
[fecha_vigencia] date,
[estado] nvarchar(50),
[id_tipo_plan] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_Plan])
);

CREATE TABLE [dbo].[Bicicleta] (
[idBicicleta] int NOT NULL IDENTITY(1,1),
[Numero_de_serie] varchar(50) NOT NULL,
[Marca] nvarchar(200),
[Modelo] nvarchar(200),
[Año_de_fabricacion] datetime,
[Estado] nvarchar(100),
[Tarifa_base] int,
[id_Tipo_de_bicicleta] int,
[idTipo_de_Asistencia] int,
[idPunto_de_alquiler] int,
[id_Plan] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idBicicleta])
);

CREATE TABLE [dbo].[Tipo_de_metodo] (
[idTipo_de_metodo] int NOT NULL IDENTITY(1,1),
[Nombre] nvarchar(200) NOT NULL,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idTipo_de_metodo])
);

CREATE TABLE [dbo].[metodo_de_pago_del_usuario] (
[Id_metodo_de_pago_del_usuario] int NOT NULL IDENTITY(1,1),
[Id_usuario] int,
[Id_metodo_de_pago] int,
PRIMARY KEY ([Id_metodo_de_pago_del_usuario])
);

CREATE TABLE [dbo].[Combos_de_dias] (
[id_Plan] int NOT NULL,
[Numero_de_dias] int,
[Tarifa_por_combo_de_dias] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_Plan])
);

CREATE TABLE [dbo].[combo_de_detalle] (
[idcombo_detalle] int NOT NULL IDENTITY(1,1),
[id_plan] int,
[dia_semana] nvarchar(20),
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idcombo_detalle])
);

CREATE TABLE [dbo].[Anual] (
[id_Plan] int NOT NULL,
[Beneficios_exclusivos] nvarchar(1000),
[Tarifa_anual] int,
[Renovacion_automatica] date,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_Plan])
);

CREATE TABLE [dbo].[Billetera_virtual] (
[idMetodo_de_pago] int NOT NULL,
[Identificador_de_cuenta] nvarchar(200),
[Proveedor] nvarchar(200),
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idMetodo_de_pago])
);

CREATE TABLE [dbo].[metodo_de_pago] (
[id_metodo_pago] int NOT NULL IDENTITY(1,1),
[fecha_Registro] date,
[fecha_modificacion] date,
[idTipo_de_metodo] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_metodo_pago])
);

CREATE TABLE [dbo].[Tipo_de_asistencia] (
[idTipo_de_asistencia] int NOT NULL IDENTITY(1,1),
[nombre] nvarchar(100) NOT NULL,
[descripcion] nvarchar(max),
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idTipo_de_asistencia])
);

CREATE TABLE [dbo].[servicio] (
[idservicio] int NOT NULL IDENTITY(1,1),
[nombre] nvarchar(200) NOT NULL,
[descripcion] nvarchar(max),
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idservicio])
);

CREATE TABLE [dbo].[Mantenimiento] (
[idMantenimiento] int NOT NULL IDENTITY(1,1),
[Ultima_fecha_de_mantenimiento] datetime,
[Kilometros_recorridos] decimal(12,2),
[Descripcion] nvarchar(1000),
[idBicicleta] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idMantenimiento])
);

CREATE TABLE [dbo].[tipo_de_plan] (
[id_tipo_plan] int NOT NULL IDENTITY(1,1),
[nombre] nvarchar(100) NOT NULL,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_tipo_plan])
);

CREATE TABLE [dbo].[Ciudad] (
[idCiudad] int NOT NULL IDENTITY(1,1),
[Nombre] nvarchar(200) NOT NULL,
[idDepartamento] int NOT NULL,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([idCiudad])
);

CREATE TABLE [dbo].[Por_hora] (
[id_Plan] int NOT NULL,
[Descripcion] nvarchar(1000),
[Duracion_maxima] decimal(10,2),
[Duracion_minima] decimal(10,2),
[Tarifa_por_fraccion_adicional] int,
[Tarifa_por_hora] int,
[fecha_creación] datetime DEFAULT (getdate()) NOT NULL,
[creada_por] varchar(50) DEFAULT (suser_sname()) NOT NULL,
[fecha_modificación] datetime,
[modificada_por] varchar(50),
PRIMARY KEY ([id_Plan])
);


ALTER TABLE [dbo].[Departamento]
ADD CONSTRAINT [FK_Departamento_Pais]
FOREIGN KEY ([idPais]) 
REFERENCES [dbo].[Pais]([idPais])
ON DELETE NO ACTION
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[usuario]
ADD CONSTRAINT [FK_Usuario_Plan]
FOREIGN KEY ([id_plan]) 
REFERENCES [dbo].[Plann]([id_Plan])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Efectivo]
ADD CONSTRAINT [FK_Efectivo_Metodo]
FOREIGN KEY ([id_metodo_pago]) 
REFERENCES [dbo].[metodo_de_pago]([id_metodo_pago])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Mensual]
ADD CONSTRAINT [FK_Mensual_Plan]
FOREIGN KEY ([id_Plan]) 
REFERENCES [dbo].[Plann]([id_Plan])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Tipo_de_bicicleta]
ADD CONSTRAINT [FK_TipoBici_Asistencia]
FOREIGN KEY ([tipo_de_asistencia]) 
REFERENCES [dbo].[Tipo_de_asistencia]([idTipo_de_asistencia])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Punto_servicio]
ADD CONSTRAINT [FK_PuntoServ_Punto]
FOREIGN KEY ([idPunto_de_alquiler]) 
REFERENCES [dbo].[Punto_de_alquiler]([idPunto_de_alquiler])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Punto_servicio]
ADD CONSTRAINT [FK_PuntoServ_Servicio]
FOREIGN KEY ([idServicio]) 
REFERENCES [dbo].[servicio]([idservicio])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Punto_de_alquiler]
ADD CONSTRAINT [FK_Punto_Ciudad]
FOREIGN KEY ([idCiudad]) 
REFERENCES [dbo].[Ciudad]([idCiudad])
ON DELETE NO ACTION
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Tarjeta_credito_o_debito]
ADD CONSTRAINT [FK_Tarjeta_Metodo]
FOREIGN KEY ([idMetodo_de_pago]) 
REFERENCES [dbo].[metodo_de_pago]([id_metodo_pago])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Plann]
ADD CONSTRAINT [FK_Plan_Tipo]
FOREIGN KEY ([id_tipo_plan]) 
REFERENCES [dbo].[tipo_de_plan]([id_tipo_plan])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Bicicleta]
ADD CONSTRAINT [FK_Bici_Tipo]
FOREIGN KEY ([id_Tipo_de_bicicleta]) 
REFERENCES [dbo].[Tipo_de_bicicleta]([idTipo_de_Bicicleta])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Bicicleta]
ADD CONSTRAINT [FK_Bici_Punto]
FOREIGN KEY ([idPunto_de_alquiler]) 
REFERENCES [dbo].[Punto_de_alquiler]([idPunto_de_alquiler])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Bicicleta]
ADD CONSTRAINT [FK_Bici_Asistencia]
FOREIGN KEY ([idTipo_de_Asistencia]) 
REFERENCES [dbo].[Tipo_de_asistencia]([idTipo_de_asistencia])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Bicicleta]
ADD CONSTRAINT [FK_Bici_Plan]
FOREIGN KEY ([id_Plan]) 
REFERENCES [dbo].[Plann]([id_Plan])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[metodo_de_pago_del_usuario]
ADD CONSTRAINT [FK_Usuario_Metodo]
FOREIGN KEY ([Id_usuario]) 
REFERENCES [dbo].[usuario]([id_usuario])
ON DELETE CASCADE
ON UPDATE CASCADE;



ALTER TABLE [dbo].[metodo_de_pago_del_usuario]
ADD CONSTRAINT [FK_Metodo_Usuario]
FOREIGN KEY ([Id_metodo_de_pago]) 
REFERENCES [dbo].[metodo_de_pago]([id_metodo_pago])
ON DELETE CASCADE
ON UPDATE CASCADE;



ALTER TABLE [dbo].[Combos_de_dias]
ADD CONSTRAINT [FK_Combos_Plan]
FOREIGN KEY ([id_Plan]) 
REFERENCES [dbo].[Plann]([id_Plan])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[combo_de_detalle]
ADD CONSTRAINT [FK_ComboDetalle_Combos]
FOREIGN KEY ([id_plan]) 
REFERENCES [dbo].[Combos_de_dias]([id_Plan])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Anual]
ADD CONSTRAINT [FK_Anual_Plan]
FOREIGN KEY ([id_Plan]) 
REFERENCES [dbo].[Plann]([id_Plan])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Billetera_virtual]
ADD CONSTRAINT [FK_Billetera_Metodo]
FOREIGN KEY ([idMetodo_de_pago]) 
REFERENCES [dbo].[metodo_de_pago]([id_metodo_pago])
ON DELETE CASCADE
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[metodo_de_pago]
ADD CONSTRAINT [FK_Metodo_Tipo]
FOREIGN KEY ([idTipo_de_metodo]) 
REFERENCES [dbo].[Tipo_de_metodo]([idTipo_de_metodo])
ON DELETE SET NULL
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Mantenimiento]
ADD CONSTRAINT [FK_Mantenimiento_Bici]
FOREIGN KEY ([idBicicleta]) 
REFERENCES [dbo].[Bicicleta]([idBicicleta])
ON DELETE NO ACTION
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Ciudad]
ADD CONSTRAINT [FK_Ciudad_Departamento]
FOREIGN KEY ([idDepartamento]) 
REFERENCES [dbo].[Departamento]([idDepartamento])
ON DELETE NO ACTION
ON UPDATE NO ACTION;



ALTER TABLE [dbo].[Por_hora]
ADD CONSTRAINT [FK_PorHora_Plan]
FOREIGN KEY ([id_Plan]) 
REFERENCES [dbo].[Plann]([id_Plan])
ON DELETE CASCADE
ON UPDATE NO ACTION;



