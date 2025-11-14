-- Eliminar tablas en orden inverso de dependencia para evitar conflictos de FK

-- Tablas de Reseñas y Multimedia
DROP TABLE IF EXISTS [Multimedia];
DROP TABLE IF EXISTS [Reseña];

-- Tablas de Métodos de Pago
DROP TABLE IF EXISTS [Métodos_de_pago_del_usuario];
DROP TABLE IF EXISTS [Billetera_virtual];
DROP TABLE IF EXISTS [Tarjeta];
DROP TABLE IF EXISTS [Efectivo];
DROP TABLE IF EXISTS [Metodo_de_pago];
DROP TABLE IF EXISTS [Tipo_de_metodo];

-- Tablas de Mantenimiento y Bicicleta
DROP TABLE IF EXISTS [Mantenimiento];
DROP TABLE IF EXISTS [Bicicleta];
DROP TABLE IF EXISTS [Tarifa_base];
DROP TABLE IF EXISTS [Seguro];

-- Tablas de Planes (especializaciones)
DROP TABLE IF EXISTS [Semanal];
DROP TABLE IF EXISTS [Anual];
DROP TABLE IF EXISTS [Mensual];
DROP TABLE IF EXISTS [Por_dia];
DROP TABLE IF EXISTS [Por_hora];

-- Tablas de Rutas
DROP TABLE IF EXISTS [Punto_de_interés];
DROP TABLE IF EXISTS [Ruta_Prestador];
DROP TABLE IF EXISTS [Rutas];

-- Tablas de Personas (Usuario, Prestador y relacionadas)
DROP TABLE IF EXISTS [Horario_de_atencion];
DROP TABLE IF EXISTS [Prestador_de_servicio];
DROP TABLE IF EXISTS [Usuario];
DROP TABLE IF EXISTS [Contacto];
DROP TABLE IF EXISTS [Persona];
DROP TABLE IF EXISTS [Tipo_de_persona];

-- Tablas de Alquiler y Planes (generales)
DROP TABLE IF EXISTS [Punto_de_alquiler];
DROP TABLE IF EXISTS [Plan];
DROP TABLE IF EXISTS [Tipo_de_plan];

-- Tablas de Ubicación (base)
DROP TABLE IF EXISTS [Ciudad];
DROP TABLE IF EXISTS [Departamento];
DROP TABLE IF EXISTS [Pais];
