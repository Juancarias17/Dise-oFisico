
/*
  Diseño lógico con validaciones inline - Versión v2
  - Se corrigió el orden de creación de tablas para evitar FKs a tablas no existentes.
  - Se añadieron tablas faltantes y se extendieron atributos de Punto_de_alquiler.
  - No se crean tablas lookup externas; los tipos se almacenan como atributos (texto).
  - No hay triggers ni columnas created_at/updated_at ni password_hash/last4/token.
  Fecha: 2025-10-12
*/

SET XACT_ABORT ON;
GO

-- Usuario
CREATE TABLE dbo.Usuario (
  idUsuario INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(150) NOT NULL,
  apellido NVARCHAR(150) NOT NULL,
  documento NVARCHAR(50) NOT NULL,
  email NVARCHAR(255) NOT NULL,
  telefono NVARCHAR(30) NULL,
  fecha_nacimiento DATE NULL,
  direccion NVARCHAR(300) NULL,
  ciudad NVARCHAR(150) NULL,
  departamento NVARCHAR(150) NULL,
  pais NVARCHAR(150) NULL,
  CONSTRAINT UX_Usuario_Email UNIQUE (email),
  CONSTRAINT CK_Usuario_EmailFormat CHECK (email LIKE '%_@_%._%'),
  CONSTRAINT CK_Usuario_Edad CHECK (fecha_nacimiento IS NULL OR DATEDIFF(year, fecha_nacimiento, GETDATE()) >= 18)
);
GO

-- Punto_de_alquiler con más atributos solicitados
CREATE TABLE dbo.Punto_de_alquiler (
  idPunto INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(200) NOT NULL,
  direccion NVARCHAR(300) NULL,
  barrio NVARCHAR(150) NULL,
  ciudad NVARCHAR(150) NULL,
  departamento NVARCHAR(150) NULL,
  pais NVARCHAR(150) NULL,
  telefono NVARCHAR(50) NULL,
  email NVARCHAR(255) NULL CHECK (email IS NULL OR email LIKE '%_@_%._%'),
  lat DECIMAL(9,6) NULL CHECK (lat BETWEEN -90 AND 90),
  lon DECIMAL(9,6) NULL CHECK (lon BETWEEN -180 AND 180),
  capacidad_total INT NULL CHECK (capacidad_total IS NULL OR capacidad_total >= 0),
  capacidad_disponible INT NULL CHECK (capacidad_disponible IS NULL OR capacidad_disponible >= 0),
  horario_texto NVARCHAR(500) NULL,
  observaciones NVARCHAR(1000) NULL,
  CONSTRAINT CK_Punto_Capacity CHECK (capacidad_disponible IS NULL OR capacidad_total IS NULL OR capacidad_disponible <= capacidad_total)
);
GO

-- Horario de atencion (relacionado con punto)
CREATE TABLE dbo.Horario_de_atencion (
  idHorario INT IDENTITY(1,1) PRIMARY KEY,
  idPunto INT NOT NULL,
  dia_semana TINYINT NOT NULL CHECK (dia_semana BETWEEN 1 AND 7),
  hora_apertura TIME NOT NULL,
  hora_cierre TIME NOT NULL,
  CONSTRAINT FK_Horario_Punto FOREIGN KEY (idPunto) REFERENCES dbo.Punto_de_alquiler(idPunto) ON DELETE CASCADE,
  CONSTRAINT CK_Horario_Horas CHECK (hora_apertura < hora_cierre)
);
GO

-- Bicicleta (definida antes de Mantenimiento para FK)
CREATE TABLE dbo.Bicicleta (
  idBicicleta INT IDENTITY(1,1) PRIMARY KEY,
  Numero_de_serie VARCHAR(50) NOT NULL,
  marca NVARCHAR(100) NULL,
  modelo NVARCHAR(100) NULL,
  Fecha_fabricacion DATE NULL CHECK (Fecha_fabricacion IS NULL OR Fecha_fabricacion <= CAST(GETDATE() AS DATE)),
  Tarifa_base DECIMAL(10,2) NULL CHECK (Tarifa_base IS NULL OR Tarifa_base > 0),
  estado NVARCHAR(50) NOT NULL CHECK (estado IN ('Disponible','En mantenimiento','Reservada','Retirada')),
  idPunto INT NULL,
  idTipo NVARCHAR(100) NULL,
  color NVARCHAR(50) NULL,
  peso_kg DECIMAL(5,2) NULL CHECK (peso_kg IS NULL OR peso_kg > 0),
  observaciones NVARCHAR(1000) NULL,
  CONSTRAINT UX_Bicicleta_NumSerie UNIQUE (Numero_de_serie),
  CONSTRAINT FK_Bicicleta_Punto FOREIGN KEY (idPunto) REFERENCES dbo.Punto_de_alquiler(idPunto) ON DELETE SET NULL
);
GO

-- Mantenimiento
CREATE TABLE dbo.Mantenimiento (
  idMantenimiento INT IDENTITY(1,1) PRIMARY KEY,
  idBicicleta INT NOT NULL,
  fecha_mantenimiento DATE NOT NULL CHECK (fecha_mantenimiento <= CAST(GETDATE() AS DATE)),
  descripcion NVARCHAR(1000) NULL,
  costo DECIMAL(10,2) NOT NULL CHECK (costo >= 0),
  tipo NVARCHAR(100) NULL,
  taller NVARCHAR(200) NULL,
  responsable NVARCHAR(200) NULL,
  CONSTRAINT FK_Mant_Bicicleta FOREIGN KEY (idBicicleta) REFERENCES dbo.Bicicleta(idBicicleta) ON DELETE NO ACTION
);
GO

-- Proveedor
CREATE TABLE dbo.Proveedor (
  idProveedor INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(200) NOT NULL,
  contacto NVARCHAR(200) NULL,
  telefono NVARCHAR(50) NULL,
  email NVARCHAR(255) NULL CHECK (email IS NULL OR email LIKE '%_@_%._%'),
  direccion NVARCHAR(300) NULL
);
GO

-- Insumo (componentes, repuestos, consumibles)
CREATE TABLE dbo.Insumo (
  idInsumo INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(200) NOT NULL,
  descripcion NVARCHAR(500) NULL,
  unidad_medida NVARCHAR(50) NULL,
  stock_minimo INT NULL CHECK (stock_minimo IS NULL OR stock_minimo >= 0),
  CONSTRAINT UX_Insumo_Nombre UNIQUE (nombre)
);
GO

-- Bodega
CREATE TABLE dbo.Bodega (
  idBodega INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(200) NOT NULL,
  direccion NVARCHAR(300) NULL,
  ciudad NVARCHAR(150) NULL,
  capacidad INT NULL CHECK (capacidad IS NULL OR capacidad >= 0)
);
GO

-- Insumo en Bodega (stock por bodega)
CREATE TABLE dbo.Insumo_Bodega (
  idInsumoBodega INT IDENTITY(1,1) PRIMARY KEY,
  idInsumo INT NOT NULL,
  idBodega INT NOT NULL,
  cantidad INT NOT NULL CHECK (cantidad >= 0),
  CONSTRAINT FK_InsumoBodega_Insumo FOREIGN KEY (idInsumo) REFERENCES dbo.Insumo(idInsumo) ON DELETE CASCADE,
  CONSTRAINT FK_InsumoBodega_Bodega FOREIGN KEY (idBodega) REFERENCES dbo.Bodega(idBodega) ON DELETE CASCADE,
  CONSTRAINT UX_InsumoBodega UNIQUE (idInsumo, idBodega)
);
GO

-- Servicio (por ejemplo: reparación, alquiler extra, transporte)
CREATE TABLE dbo.Servicio (
  idServicio INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(200) NOT NULL,
  descripcion NVARCHAR(500) NULL,
  precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0),
  CONSTRAINT UX_Servicio_Nombre UNIQUE (nombre)
);
GO

-- Relacionar servicios a puntos (qué servicios ofrece cada punto)
CREATE TABLE dbo.Punto_servicio (
  idPuntoServicio INT IDENTITY(1,1) PRIMARY KEY,
  idPunto INT NOT NULL,
  idServicio INT NOT NULL,
  precio_local DECIMAL(10,2) NULL CHECK (precio_local IS NULL OR precio_local >= 0),
  CONSTRAINT FK_PuntoServicio_Punto FOREIGN KEY (idPunto) REFERENCES dbo.Punto_de_alquiler(idPunto) ON DELETE CASCADE,
  CONSTRAINT FK_PuntoServicio_Servicio FOREIGN KEY (idServicio) REFERENCES dbo.Servicio(idServicio) ON DELETE CASCADE,
  CONSTRAINT UX_Punto_Servicio UNIQUE (idPunto, idServicio)
);
GO

-- Plan y Por_hora
CREATE TABLE dbo.Plan (
  idPlan INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(150) NOT NULL,
  descripcion NVARCHAR(500) NULL,
  precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
  duracion_dias INT NULL CHECK (duracion_dias IS NULL OR duracion_dias > 0),
  CONSTRAINT UX_Plan_Nombre UNIQUE (nombre)
);
GO

CREATE TABLE dbo.Por_hora (
  idPorHora INT IDENTITY(1,1) PRIMARY KEY,
  idPlan INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
  CONSTRAINT FK_PorHora_Plan FOREIGN KEY (idPlan) REFERENCES dbo.Plan(idPlan) ON DELETE NO ACTION
);
GO

-- Reserva (usuario reserva una bicicleta en un punto por un periodo)
CREATE TABLE dbo.Reserva (
  idReserva INT IDENTITY(1,1) PRIMARY KEY,
  idUsuario INT NOT NULL,
  idBicicleta INT NULL,
  idPunto INT NOT NULL,
  fecha_reserva DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  fecha_inicio DATETIME2 NOT NULL,
  fecha_fin DATETIME2 NOT NULL,
  estado_reserva NVARCHAR(50) NOT NULL CHECK (estado_reserva IN ('Activa','Cancelada','Completada')),
  CONSTRAINT FK_Reserva_Usuario FOREIGN KEY (idUsuario) REFERENCES dbo.Usuario(idUsuario) ON DELETE CASCADE,
  CONSTRAINT FK_Reserva_Bicicleta FOREIGN KEY (idBicicleta) REFERENCES dbo.Bicicleta(idBicicleta) ON DELETE SET NULL,
  CONSTRAINT FK_Reserva_Punto FOREIGN KEY (idPunto) REFERENCES dbo.Punto_de_alquiler(idPunto) ON DELETE NO ACTION,
  CONSTRAINT CK_Reserva_Fechas CHECK (fecha_inicio < fecha_fin)
);
GO

-- Alquiler (transacción de uso)
CREATE TABLE dbo.Alquiler (
  idAlquiler INT IDENTITY(1,1) PRIMARY KEY,
  idUsuario INT NOT NULL,
  idBicicleta INT NOT NULL,
  idPunto_inicio INT NULL,
  idPunto_fin INT NULL,
  fecha_inicio DATETIME2 NOT NULL,
  fecha_fin DATETIME2 NULL,
  precio DECIMAL(12,2) NOT NULL CHECK (precio >= 0),
  estado_alquiler NVARCHAR(50) NOT NULL CHECK (estado_alquiler IN ('Activo','Finalizado','Cancelado')),
  CONSTRAINT FK_Alq_Usuario FOREIGN KEY (idUsuario) REFERENCES dbo.Usuario(idUsuario) ON DELETE CASCADE,
  CONSTRAINT FK_Alq_Bicicleta FOREIGN KEY (idBicicleta) REFERENCES dbo.Bicicleta(idBicicleta) ON DELETE NO ACTION,
  CONSTRAINT FK_Alq_PuntoInicio FOREIGN KEY (idPunto_inicio) REFERENCES dbo.Punto_de_alquiler(idPunto) ON DELETE SET NULL,
  CONSTRAINT FK_Alq_PuntoFin FOREIGN KEY (idPunto_fin) REFERENCES dbo.Punto_de_alquiler(idPunto) ON DELETE SET NULL,
  CONSTRAINT CK_Alq_Fechas CHECK (fecha_fin IS NULL OR fecha_inicio < fecha_fin)
);
GO

-- Venta y detalle de venta
CREATE TABLE dbo.Venta (
  idVenta INT IDENTITY(1,1) PRIMARY KEY,
  idUsuario INT NULL,
  fecha_venta DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
  precio_total DECIMAL(12,2) NOT NULL CHECK (precio_total >= 0),
  CONSTRAINT FK_Venta_Usuario FOREIGN KEY (idUsuario) REFERENCES dbo.Usuario(idUsuario) ON DELETE SET NULL
);
GO

CREATE TABLE dbo.DetalleVenta (
  idDetalle INT IDENTITY(1,1) PRIMARY KEY,
  idVenta INT NOT NULL,
  idBicicleta INT NULL,
  cantidad INT NOT NULL CHECK (cantidad > 0),
  precio_unitario DECIMAL(12,2) NOT NULL CHECK (precio_unitario >= 0),
  CONSTRAINT FK_DetV_Venta FOREIGN KEY (idVenta) REFERENCES dbo.Venta(idVenta) ON DELETE CASCADE,
  CONSTRAINT FK_DetV_Bicicleta FOREIGN KEY (idBicicleta) REFERENCES dbo.Bicicleta(idBicicleta) ON DELETE SET NULL
);
GO

-- Metodo de pago, Tarjeta y Billetera
CREATE TABLE dbo.Metodo_de_pago (
  idMetodo INT IDENTITY(1,1) PRIMARY KEY,
  idUsuario INT NOT NULL,
  tipo NVARCHAR(50) NOT NULL,
  descripcion NVARCHAR(250) NULL,
  CONSTRAINT FK_Metodo_Usuario FOREIGN KEY (idUsuario) REFERENCES dbo.Usuario(idUsuario) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Tarjeta_credito_o_debito (
  idTarjeta INT IDENTITY(1,1) PRIMARY KEY,
  idUsuario INT NOT NULL,
  numero_tarjeta VARCHAR(25) NOT NULL CHECK (LEN(REPLACE(numero_tarjeta,' ','')) BETWEEN 13 AND 19),
  titular NVARCHAR(200) NOT NULL,
  fecha_expiracion DATE NOT NULL CHECK (fecha_expiracion > CAST(GETDATE() AS DATE)),
  CONSTRAINT FK_Tarjeta_Usuario FOREIGN KEY (idUsuario) REFERENCES dbo.Usuario(idUsuario) ON DELETE CASCADE
);
GO

CREATE TABLE dbo.Billetera_virtual (
  idBilletera INT IDENTITY(1,1) PRIMARY KEY,
  idUsuario INT NOT NULL,
  saldo DECIMAL(12,2) NOT NULL CHECK (saldo >= 0),
  CONSTRAINT FK_Billetera_Usuario FOREIGN KEY (idUsuario) REFERENCES dbo.Usuario(idUsuario) ON DELETE CASCADE
);
GO

-- Combo y detalle (paquetes)
CREATE TABLE dbo.Combo (
  idCombo INT IDENTITY(1,1) PRIMARY KEY,
  nombre NVARCHAR(200) NOT NULL,
  descripcion NVARCHAR(500) NULL,
  precio_total DECIMAL(12,2) NOT NULL CHECK (precio_total >= 0),
  CONSTRAINT UX_Combo_Nombre UNIQUE (nombre)
);
GO

CREATE TABLE dbo.ComboDetalle (
  idComboDetalle INT IDENTITY(1,1) PRIMARY KEY,
  idCombo INT NOT NULL,
  idPlan INT NULL,
  idPorHora INT NULL,
  cantidad INT NOT NULL CHECK (cantidad > 0),
  CONSTRAINT FK_ComboDetalle_Combo FOREIGN KEY (idCombo) REFERENCES dbo.Combo(idCombo) ON DELETE CASCADE,
  CONSTRAINT FK_ComboDetalle_Plan FOREIGN KEY (idPlan) REFERENCES dbo.Plan(idPlan) ON DELETE SET NULL,
  CONSTRAINT FK_ComboDetalle_PorHora FOREIGN KEY (idPorHora) REFERENCES dbo.Por_hora(idPorHora) ON DELETE SET NULL
);
GO

-- Índices recomendados
CREATE NONCLUSTERED INDEX IX_Mantenimiento_idBicicleta ON dbo.Mantenimiento(idBicicleta);
CREATE NONCLUSTERED INDEX IX_Usuario_documento ON dbo.Usuario(documento);
CREATE NONCLUSTERED INDEX IX_InsumoBodega_Insumo ON dbo.Insumo_Bodega(idInsumo);
GO

PRINT 'Versión v2 del script con tablas y atributos ampliados creada correctamente.';
