
CREATE TABLE dbo.Pais (
  idPais INT IDENTITY(1,1) PRIMARY KEY,
  Nombre NVARCHAR(200) NOT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
);
GO

CREATE TABLE dbo.Departamento (
  idDepartamento INT IDENTITY(1,1) PRIMARY KEY,
  Nombre NVARCHAR(200) NOT NULL,
  idPais INT NOT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Departamento_Pais FOREIGN KEY (idPais) REFERENCES dbo.Pais(idPais) ON DELETE NO ACTION
);
GO

CREATE TABLE dbo.Ciudad (
  idCiudad INT IDENTITY(1,1) PRIMARY KEY,
  Nombre NVARCHAR(200) NOT NULL,
  idDepartamento INT NOT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Ciudad_Departamento FOREIGN KEY (idDepartamento) REFERENCES dbo.Departamento(idDepartamento) ON DELETE NO ACTION
);
GO

CREATE TABLE dbo.Punto_de_alquiler (
  idPunto_de_alquiler INT IDENTITY(1,1) PRIMARY KEY,
  Numero_de_bicicletas INT NULL CHECK (Numero_de_bicicletas IS NULL OR Numero_de_bicicletas >= 0),
  Detalles_de_servicio NVARCHAR(1000) NULL,
  Horario_de_atencion NVARCHAR(500) NULL,
  Persona_de_contacto NVARCHAR(200) NULL,
  Numero_telefonico NVARCHAR(50) NULL,
  Direccion NVARCHAR(500) NULL,
  idCiudad INT NOT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Punto_Ciudad FOREIGN KEY (idCiudad) REFERENCES dbo.Ciudad(idCiudad) ON DELETE NO ACTION
);
GO

CREATE TABLE dbo.Horario_de_atencion (
  idhorario INT IDENTITY(1,1) PRIMARY KEY,
  idPunto_de_alquiler INT NOT NULL,
  dia_semana NVARCHAR(20) NULL CHECK (dia_semana BETWEEN 1 AND 7),
  hora_apertura TIME NULL,
  hora_cierre TIME NULL,
  descripcion NVARCHAR(250) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Horario_Punto FOREIGN KEY (idPunto_de_alquiler) REFERENCES dbo.Punto_de_alquiler(idPunto_de_alquiler) ON DELETE CASCADE,
  CONSTRAINT CK_Horario_Horas CHECK (hora_apertura IS NULL OR hora_cierre IS NULL OR hora_apertura < hora_cierre)
);
GO

CREATE TABLE dbo.Tipo_de_asistencia (
  idTipo_de_asistencia INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL,
  descripcion NVARCHAR(MAX) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
);
GO

CREATE TABLE dbo.Tipo_de_bicicleta (
  idTipo_de_Bicicleta INT IDENTITY(1,1) PRIMARY KEY,
  Nombre NVARCHAR(200) NOT NULL,
  Descripcion NVARCHAR(1000) NULL,
  Suspención NVARCHAR(200) NULL,
  Llantas INT NULL CHECK (Llantas IS NULL OR Llantas >= 0),
  peso DECIMAL(10,2) NULL CHECK (peso IS NULL OR peso > 0),
  Tipo_de_uso NVARCHAR(200) NULL,
  tipo_de_asistencia INT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_TipoBici_Asistencia FOREIGN KEY (tipo_de_asistencia) REFERENCES dbo.Tipo_de_asistencia(idTipo_de_asistencia) ON DELETE SET NULL
);
GO

CREATE TABLE dbo.servicio (
  idservicio INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(200) NOT NULL,
  descripcion NVARCHAR(MAX) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
);
GO

CREATE TABLE dbo.Punto_servicio (
  idPunto_de_servicio INT IDENTITY(1,1) PRIMARY KEY,
  idPunto_de_alquiler INT NOT NULL,
  idServicio INT NOT NULL,
  detalles NVARCHAR(MAX) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_PuntoServ_Punto FOREIGN KEY (idPunto_de_alquiler) REFERENCES dbo.Punto_de_alquiler(idPunto_de_alquiler) ON DELETE CASCADE,
  CONSTRAINT FK_PuntoServ_Servicio FOREIGN KEY (idServicio) REFERENCES dbo.servicio(idservicio) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.tipo_de_plan (
  id_tipo_plan INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
);
GO

CREATE TABLE dbo.Plann (
  id_Plan INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL,
  Descripcion NVARCHAR(1000) NULL,
  fecha_inicio DATE NULL,
  fecha_vigencia DATE NULL,
  estado NVARCHAR(50) NULL,
  id_tipo_plan INT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Plan_Tipo FOREIGN KEY (id_tipo_plan) REFERENCES dbo.tipo_de_plan(id_tipo_plan) ON DELETE SET NULL
);
GO

CREATE TABLE dbo.Por_hora (
  id_Plan INT PRIMARY KEY, 
  Descripcion NVARCHAR(1000) NULL,
  Duracion_maxima DECIMAL(10,2) NULL,
  Duracion_minima DECIMAL(10,2) NULL,
  Tarifa_por_fraccion_adicional INT NULL CHECK (Tarifa_por_fraccion_adicional IS NULL OR Tarifa_por_fraccion_adicional >= 0),
  Tarifa_por_hora INT NULL CHECK (Tarifa_por_hora IS NULL OR Tarifa_por_hora >= 0),
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_PorHora_Plan FOREIGN KEY (id_Plan) REFERENCES dbo.Plann(id_Plan) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Combos_de_dias (
  id_Plan INT PRIMARY KEY,
  Numero_de_dias INT NULL CHECK (Numero_de_dias IS NULL OR Numero_de_dias > 0),
  Tarifa_por_combo_de_dias INT NULL CHECK (Tarifa_por_combo_de_dias IS NULL OR Tarifa_por_combo_de_dias >= 0),
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Combos_Plan FOREIGN KEY (id_Plan) REFERENCES dbo.Plann(id_Plan) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Mensual (
  id_Plan INT PRIMARY KEY,
  Tarifa_mensual INT NULL CHECK (Tarifa_mensual IS NULL OR Tarifa_mensual >= 0),
  Renovacion_automatica DATE NULL,
  Descuentos_especiales FLOAT NULL,
  Descripcion NVARCHAR(1000) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Mensual_Plan FOREIGN KEY (id_Plan) REFERENCES dbo.Plann(id_Plan) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Anual (
  id_Plan INT PRIMARY KEY,
  Beneficios_exclusivos NVARCHAR(1000) NULL,
  Tarifa_anual INT NULL CHECK (Tarifa_anual IS NULL OR Tarifa_anual >= 0),
  Renovacion_automatica DATE NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Anual_Plan FOREIGN KEY (id_Plan) REFERENCES dbo.Plann(id_Plan) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Tipo_de_metodo (
  idTipo_de_metodo INT IDENTITY(1,1) PRIMARY KEY,
  Nombre NVARCHAR(200) NOT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
);
GO

CREATE TABLE dbo.metodo_de_pago (
  id_metodo_pago INT IDENTITY(1,1) PRIMARY KEY,
  fecha_Registro DATE NULL,
  fecha_modificacion DATE NULL,
  idTipo_de_metodo INT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Metodo_Tipo FOREIGN KEY (idTipo_de_metodo) REFERENCES dbo.Tipo_de_metodo(idTipo_de_metodo) ON DELETE SET NULL
);
GO



CREATE TABLE dbo.Efectivo (
  id_metodo_pago INT PRIMARY KEY,
  Codigo_recibido INT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Efectivo_Metodo FOREIGN KEY (id_metodo_pago) REFERENCES dbo.metodo_de_pago(id_metodo_pago) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Tarjeta_credito_o_debito (
  idMetodo_de_pago INT PRIMARY KEY,
  Fecha_de_expiracion DATE NULL CHECK (Fecha_de_expiracion IS NULL OR Fecha_de_expiracion > CAST(GETDATE() AS DATE)),
  Franquicia NVARCHAR(200) NULL,
  Tipo NVARCHAR(100) NULL,
  numero_de_enmascarado NVARCHAR(50) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Tarjeta_Metodo FOREIGN KEY (idMetodo_de_pago) REFERENCES dbo.metodo_de_pago(id_metodo_pago) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Billetera_virtual (
  idMetodo_de_pago INT PRIMARY KEY,
  Identificador_de_cuenta NVARCHAR(200) NULL UNIQUE,
  Proveedor NVARCHAR(200) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Billetera_Metodo FOREIGN KEY (idMetodo_de_pago) REFERENCES dbo.metodo_de_pago(id_metodo_pago) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.usuario (
  id_usuario INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(50) NULL,
  apellido NVARCHAR(50) NULL,
  correo NVARCHAR(100) NULL UNIQUE CHECK (correo LIKE '%_@_%._%'),
  fecha_nacimiento DATE NULL,
  numero_telefonico NVARCHAR(20) NULL UNIQUE,
  id_plan INT NULL,
  id_metodo_pago INT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Usuario_Plan FOREIGN KEY (id_plan) REFERENCES dbo.Plann(id_Plan) ON DELETE SET NULL,
  CONSTRAINT FK_Usuario_Metodo FOREIGN KEY (id_metodo_pago) REFERENCES dbo.metodo_de_pago(id_metodo_pago) ON DELETE SET NULL
);
GO

CREATE TABLE dbo.Bicicleta (
  idBicicleta INT IDENTITY(1,1) PRIMARY KEY,
  Numero_de_serie VARCHAR(50) NOT NULL UNIQUE,
  Marca NVARCHAR(200) NULL,
  Modelo NVARCHAR(200) NULL,
  Año_de_fabricacion DATETIME NULL CHECK (Año_de_fabricacion IS NULL OR Año_de_fabricacion <= CAST(GETDATE() AS DATE)),
  Estado NVARCHAR(100) NULL,
  Tarifa_base INT NULL CHECK (Tarifa_base IS NULL OR Tarifa_base >= 0),
  id_Tipo_de_bicicleta INT NULL,
  idTipo_de_Asistencia INT NULL,
  idPunto_de_alquiler INT NULL,
  id_Plan INT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Bici_Tipo FOREIGN KEY (id_Tipo_de_bicicleta) REFERENCES dbo.Tipo_de_bicicleta(idTipo_de_Bicicleta) ON DELETE SET NULL,
  CONSTRAINT FK_Bici_Asistencia FOREIGN KEY (idTipo_de_Asistencia) REFERENCES dbo.Tipo_de_asistencia(idTipo_de_asistencia) ON DELETE SET NULL,
  CONSTRAINT FK_Bici_Punto FOREIGN KEY (idPunto_de_alquiler) REFERENCES dbo.Punto_de_alquiler(idPunto_de_alquiler) ON DELETE SET NULL,
  CONSTRAINT FK_Bici_Plan FOREIGN KEY (id_Plan) REFERENCES dbo.Plann(id_Plan) ON DELETE SET NULL
);
GO

CREATE TABLE dbo.Mantenimiento (
  idMantenimiento INT IDENTITY(1,1) PRIMARY KEY,
  Ultima_fecha_de_mantenimiento DATETIME NULL CHECK (Ultima_fecha_de_mantenimiento IS NULL OR Ultima_fecha_de_mantenimiento <= CAST(GETDATE() AS DATE)),
  Kilometros_recorridos DECIMAL(12,2) NULL CHECK (Kilometros_recorridos IS NULL OR Kilometros_recorridos >= 0),
  Descripcion NVARCHAR(1000) NULL,
  idBicicleta INT NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_Mantenimiento_Bici FOREIGN KEY (idBicicleta) REFERENCES dbo.Bicicleta(idBicicleta) ON DELETE NO ACTION
);
GO

CREATE TABLE dbo.combo_de_detalle (
  idcombo_detalle INT IDENTITY(1,1) PRIMARY KEY,
  id_plan INT NULL,
  dia_semana NVARCHAR(20) NULL,
  fecha_creación DATETIME NOT NULL DEFAULT GETDATE(),
  creada_por VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
  fecha_modificación DATETIME,
  modificada_por VARCHAR(50)
  CONSTRAINT FK_ComboDetalle_Combos FOREIGN KEY (id_plan) REFERENCES dbo.Combos_de_dias(id_Plan) ON DELETE SET NULL
);
GO


