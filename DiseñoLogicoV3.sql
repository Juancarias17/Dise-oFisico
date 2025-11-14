
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

CREATE TABLE [Tipo_de_plan] (
	[id_tipo_plan] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(50) NOT NULL,
	PRIMARY KEY ([id_tipo_plan]),
	CONSTRAINT [CK_Tipo_Plan_Nombre] CHECK ([nombre] IN ('Por hora', 'Por día', 'Semanal', 'Mensual', 'Anual'))
);

CREATE TABLE [Plan] (
	[id_plan] int IDENTITY(1,1) NOT NULL,
	[Descripcion] nvarchar(200) NULL, 
	[estado] nvarchar(10) NOT NULL, 
	[tarifa] decimal(10, 2) NOT NULL, 
	[Politicas_de_reembolso] nvarchar(max) NULL, 
	[id_tipo_plan] int NOT NULL,
	PRIMARY KEY ([id_plan]),
	CONSTRAINT [FK_Plan_TipoPlan] FOREIGN KEY ([id_tipo_plan]) REFERENCES [Tipo_de_plan]([id_tipo_plan]),
	CONSTRAINT [CK_Plan_Estado] CHECK ([estado] IN ('Activo', 'Inactivo'))
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
	[Nombre] nvarchar(50) NOT NULL CHECK ([Nombre] IN ('Usuario', 'Prestador de servicio')),
	PRIMARY KEY ([id_tipo_de_persona])
);

CREATE TABLE [Persona] (
	[id_persona] int IDENTITY(1,1) NOT NULL,
	[nombre] nvarchar(50) NOT NULL,
	[apellido] nvarchar(50) NOT NULL,
	[correo] nvarchar(100) NOT NULL UNIQUE,
	[fecha_nacimiento] date NOT NULL,
	[Sexo] nvarchar(20) NOT NULL,
	[id_Tipo_de_persona] int NOT NULL,
	[Acepta_terminos] bit NULL, 
	PRIMARY KEY ([id_persona]),
	CONSTRAINT [FK_Persona_Tipo] FOREIGN KEY ([id_Tipo_de_persona]) REFERENCES [Tipo_de_persona]([id_tipo_de_persona]),
	CONSTRAINT [CK_Persona_Sexo] CHECK ([Sexo] IN ('Masculino', 'Femenino')),
	CONSTRAINT [CK_Persona_Edad] CHECK (DATEDIFF(year, [fecha_nacimiento], GETDATE()) >= 18),
	CONSTRAINT [CK_Persona_Terminos] CHECK ([Acepta_terminos] = 1 OR [Acepta_terminos] IS NULL)
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
	[Contraseña] nvarchar(max) NOT NULL,
	[id_plan] int NOT NULL,
	PRIMARY KEY ([id_persona]),
	CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY ([id_persona]) REFERENCES [Persona]([id_persona]),
	CONSTRAINT [FK_Usuario_Plan] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_plan])
);

CREATE TABLE [Prestador_de_servicio] (
	[id_persona] int NOT NULL, 
	[Tipo_de_servicio] nvarchar(max) NOT NULL, 
	[id_Punto_de_alquiler] int NULL, 
	PRIMARY KEY ([id_persona]),
	CONSTRAINT [FK_Prestador_Persona] FOREIGN KEY ([id_persona]) REFERENCES [Persona]([id_persona]),
	CONSTRAINT [FK_Prestador_Punto_Alquiler] FOREIGN KEY ([id_Punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([id_punto_de_alquiler])
	ON DELETE SET NULL
);

CREATE TABLE [Horario_de_atencion] (
	[id_horario] int IDENTITY(1,1) NOT NULL,
	[id_punto_de_alquiler] int NOT NULL,
	[dia_semana] nvarchar(20) NOT NULL,
	[hora_apertura] time(7) NOT NULL,
	[hora_cierre] time(7) NOT NULL,
	PRIMARY KEY ([id_horario]),
	CONSTRAINT [FK_Horario_PuntoAlquiler] FOREIGN KEY ([id_punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([id_punto_de_alquiler])
	ON DELETE CASCADE
);

CREATE TABLE [Rutas] (
	[id_ruta] int IDENTITY(1,1) NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Nivel_de_dificultad] nvarchar(10) NOT NULL, 
	[Distancia_total] int NOT NULL, 
	[Descripcion] nvarchar(100) NOT NULL, 
	PRIMARY KEY ([id_ruta]),
	CONSTRAINT [CK_Rutas_Dificultad] CHECK ([Nivel_de_dificultad] IN ('Fácil', 'Moderado', 'Difícil'))
);

CREATE TABLE [Ruta_Prestador] (
    [id_ruta] int NOT NULL,
    [id_prestador] int NOT NULL,
    PRIMARY KEY ([id_ruta], [id_prestador]),
    CONSTRAINT [FK_RutaPrestador_Ruta] FOREIGN KEY ([id_ruta]) REFERENCES [Rutas]([id_ruta]),
    CONSTRAINT [FK_RutaPrestador_Prestador] FOREIGN KEY ([id_prestador]) REFERENCES [Prestador_de_servicio]([id_persona])
);

CREATE TABLE [Punto_de_interés] (
	[id_punto_de_interés] int IDENTITY(1,1) NOT NULL,
	[Nombre] nvarchar(max) NOT NULL,
	[Orden_secuencial_en_la_ruta] int NOT NULL,
	[coordenadas_geograficas] nvarchar(max) NOT NULL,
	[Descripción] nvarchar(100) NOT NULL, 
	[id_Ruta] int NOT NULL,
	PRIMARY KEY ([id_punto_de_interés]),
	CONSTRAINT [FK_PuntoInteres_Ruta] FOREIGN KEY ([id_Ruta]) REFERENCES [Rutas]([id_ruta])
);

CREATE TABLE [Por_hora] (
	[id_plan] int NOT NULL,
	[Duracion_maxima] decimal(18,0) NOT NULL,
	[Duracion_minima] decimal(18,0) NOT NULL,
	[Tarifa_por_fraccion_adicional] int NOT NULL,
	PRIMARY KEY ([id_plan]),
	CONSTRAINT [FK_Por_Hora_Plan] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_plan])
);

CREATE TABLE [Por_dia] (
	[id_plan] int NOT NULL,
	[Costo_extra_por_extender_al_dia_siguiente] int NOT NULL,
	[Hora_limite_de_devolución] time(7) NOT NULL,
	PRIMARY KEY ([id_plan]),
	CONSTRAINT [FK_Por_Dia_Plan] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_plan])
);

CREATE TABLE [Mensual] (
	[id_plan] int NOT NULL,
	[Confirmación_de_reenovación_automatica] nvarchar(2) NOT NULL, 
	[Descuento_especial] float(53) NOT NULL,
	PRIMARY KEY ([id_plan]),
	CONSTRAINT [FK_Mensual_Plan] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_plan]),
	CONSTRAINT [CK_Mensual_Renovacion] CHECK ([Confirmación_de_reenovación_automatica] IN ('Si', 'No'))
);

CREATE TABLE [Anual] (
	[id_plan] int NOT NULL,
	[Confirmación_de_reenovación_automatica] nvarchar(2) NOT NULL, 
	[Descuento_especial] float(53) NOT NULL,
	PRIMARY KEY ([id_plan]),
	CONSTRAINT [FK_Anual_Plan] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_plan]),
	CONSTRAINT [CK_Anual_Renovacion] CHECK ([Confirmación_de_reenovación_automatica] IN ('Si', 'No'))
);

CREATE TABLE [Semanal] (
	[id_plan] int NOT NULL,
	[Número_de_semanas_inlcluidas] int NOT NULL,
	[Días_especificos_en_que_aplica] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_plan]),
	CONSTRAINT [FK_Semanal_Plan] FOREIGN KEY ([id_plan]) REFERENCES [Plan]([id_plan])
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

CREATE TABLE [Tarifa_base] (
	[id_tarifa_base] int IDENTITY(1,1) NOT NULL,
	[Tipo_de_uso] nvarchar(10) NOT NULL, 
	[Tipo_de_asistencia] nvarchar(15) NOT NULL, 
	[Precio_base] decimal(10, 2) NOT NULL, 
	PRIMARY KEY ([id_tarifa_base]),
	CONSTRAINT [CK_Tarifa_Uso] CHECK ([Tipo_de_uso] IN ('montaña', 'urbana', 'de ruta')),
	CONSTRAINT [CK_Tarifa_Asistencia] CHECK ([Tipo_de_asistencia] IN ('Eléctrica', 'Convencional')),
	CONSTRAINT [CK_Tarifa_Precios] CHECK (
        ([Tipo_de_asistencia] = 'Convencional' AND [Tipo_de_uso] = 'montaña' AND [Precio_base] = 60000) OR
        ([Tipo_de_asistencia] = 'Convencional' AND [Tipo_de_uso] = 'urbana' AND [Precio_base] = 45000) OR
        ([Tipo_de_asistencia] = 'Convencional' AND [Tipo_de_uso] = 'de ruta' AND [Precio_base] = 70000) OR
        ([Tipo_de_asistencia] = 'Eléctrica' AND [Tipo_de_uso] = 'montaña' AND [Precio_base] = 120000) OR
        ([Tipo_de_asistencia] = 'Eléctrica' AND [Tipo_de_uso] = 'urbana' AND [Precio_base] = 90000) OR
        ([Tipo_de_asistencia] = 'Eléctrica' AND [Tipo_de_uso] = 'de ruta' AND [Precio_base] = 140000)
    )
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

CREATE TABLE [Tipo_de_bicicleta] (
	[id_tipo_de_bicicleta] int IDENTITY(1,1) NOT NULL,
	[Tipo_de_uso] nvarchar(max) NOT NULL,
	[Tipo_de_asistencia] nvarchar(max) NOT NULL,
	PRIMARY KEY ([id_tipo_de_bicicleta])
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
	PRIMARY KEY ([id_bicicleta]),
	CONSTRAINT [FK_Bicicleta_Tipo] FOREIGN KEY ([id_tipo_de_bicicleta]) REFERENCES [Tipo_de_bicicleta]([id_tipo_de_bicicleta]),
	CONSTRAINT [FK_Bicicleta_Punto_Alquiler] FOREIGN KEY ([id_punto_de_alquiler]) REFERENCES [Punto_de_alquiler]([id_punto_de_alquiler]),
	CONSTRAINT [FK_Bicicleta_Seguro] FOREIGN KEY ([id_Seguro]) REFERENCES [Seguro]([id_seguro]),
	CONSTRAINT [FK_Bicicleta_Tarifa] FOREIGN KEY ([id_tarifa_base]) REFERENCES [Tarifa_base]([id_tarifa_base])
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

CREATE TABLE [Reseña] (
	[id_reseña] int IDENTITY(1,1) NOT NULL,
	[Calificación] decimal(2, 1) NULL, 
	[Fecha_de_publicación] date NOT NULL,
	[Texto_de_comentario] nvarchar(max) NOT NULL,
	[Estado_de_revisión] nvarchar(10) NOT NULL, 
	[id_Usuario] int NOT NULL, 
	[id_Prestador_de_servicio] int NULL,
	[id_Ruta] int NULL,
	[id_Bicicleta] int NULL,
	PRIMARY KEY ([id_reseña]),
	CONSTRAINT [CK_Reseña_Calificacion] CHECK ([Calificación] >= 1.0 AND [Calificación] <= 5.0),
	CONSTRAINT [CK_Reseña_Estado] CHECK ([Estado_de_revisión] IN ('Pendiente', 'Aprobada', 'Rechazada')),
	CONSTRAINT [CK_Reseña_Target] CHECK (
        [id_Prestador_de_servicio] IS NOT NULL OR 
        [id_Ruta] IS NOT NULL OR 
        [id_Bicicleta] IS NOT NULL
    ),
	CONSTRAINT [FK_Reseña_Usuario] FOREIGN KEY ([id_Usuario]) REFERENCES [Usuario]([id_persona])
	ON DELETE CASCADE,
	CONSTRAINT [FK_Reseña_Prestador] FOREIGN KEY ([id_Prestador_de_servicio]) REFERENCES [Prestador_de_servicio]([id_persona])
	ON DELETE CASCADE,
	CONSTRAINT [FK_Reseña_Ruta] FOREIGN KEY ([id_Ruta]) REFERENCES [Rutas]([id_ruta])
	ON DELETE CASCADE,
	CONSTRAINT [FK_Reseña_Bicicleta] FOREIGN KEY ([id_Bicicleta]) REFERENCES [Bicicleta]([id_bicicleta])
	ON DELETE CASCADE
);

CREATE TABLE [Multimedia] (
	[id_multimedia] int IDENTITY(1,1) NOT NULL,
	[Estado_de_revision] nvarchar(10) NOT NULL, 
	[Tamaño] bigint NOT NULL, 
	[Formato_de_archivo] nvarchar(5) NOT NULL, 
	[Fecha_de_subida] date NOT NULL,
	[Foto_o_video] nvarchar(max) NOT NULL, 
	[idReseña] int NOT NULL, 
	PRIMARY KEY ([id_multimedia]),
	CONSTRAINT [FK_Multimedia_Reseña] FOREIGN KEY ([idReseña]) REFERENCES [Reseña]([id_reseña])
	ON DELETE CASCADE,
	CONSTRAINT [CK_Multimedia_Estado] CHECK ([Estado_de_revision] IN ('Pendiente', 'Aprobado', 'Rechazado')),
	CONSTRAINT [CK_Multimedia_Tamaño] CHECK ([Tamaño] <= 60000000), 
	CONSTRAINT [CK_Multimedia_Formato] CHECK ([Formato_de_archivo] IN ('JPG', 'JPEG', 'PNG', 'WEBP', 'MP4'))
);	