-- =============================================
-- INSERCIONES PARA SISTEMA DE ALQUILER DE BICICLETAS
-- =============================================

-- TABLAS DE UBICACIÓN GEOGRÁFICA
-- =============================================

-- País
INSERT INTO [Pais] ([Nombre_Pais]) VALUES ('Colombia');
INSERT INTO [Pais] ([Nombre_Pais]) VALUES ('Ecuador');
INSERT INTO [Pais] ([Nombre_Pais]) VALUES ('Perú');

-- Departamento
INSERT INTO [Departamento] ([Nombre_Departamento], [id_pais]) VALUES ('Magdalena', 1);
INSERT INTO [Departamento] ([Nombre_Departamento], [id_pais]) VALUES ('Atlántico', 1);
INSERT INTO [Departamento] ([Nombre_Departamento], [id_pais]) VALUES ('Bolívar', 1);

-- Ciudad
INSERT INTO [Ciudad] ([Nombre_Ciudad], [id_departamento]) VALUES ('Santa Marta', 1);
INSERT INTO [Ciudad] ([Nombre_Ciudad], [id_departamento]) VALUES ('Barranquilla', 2);
INSERT INTO [Ciudad] ([Nombre_Ciudad], [id_departamento]) VALUES ('Cartagena', 3);

-- PUNTOS DE ALQUILER
-- =============================================

INSERT INTO [Punto_de_alquiler] ([Capacidad_total_de_bicicletas], [Nombre], [Foto], [Direccion], [Coordenadas_geograficas], [Numero_de_bicicletas_almacenadas], [id_ciudad]) 
VALUES (50, 'Estación Rodadero', 'rodadero.jpg', 'Calle 11 # 1-20, El Rodadero', '11.2094,-74.2286', 35, 1);

INSERT INTO [Punto_de_alquiler] ([Capacidad_total_de_bicicletas], [Nombre], [Foto], [Direccion], [Coordenadas_geograficas], [Numero_de_bicicletas_almacenadas], [id_ciudad]) 
VALUES (40, 'Estación Parque Tayrona', 'tayrona.jpg', 'Entrada Principal Parque Tayrona', '11.3058,-74.0614', 28, 1);

INSERT INTO [Punto_de_alquiler] ([Capacidad_total_de_bicicletas], [Nombre], [Foto], [Direccion], [Coordenadas_geograficas], [Numero_de_bicicletas_almacenadas], [id_ciudad]) 
VALUES (60, 'Estación Centro Histórico', 'centro.jpg', 'Calle 17 # 3-45, Centro', '11.2404,-74.2120', 42, 1);

-- HORARIOS DE ATENCIÓN
-- =============================================

-- Horarios regulares (Lunes a Viernes)
INSERT INTO [Horario_de_atencion] ([dia_semana], [hora_apertura], [hora_cierre]) VALUES ('Lunes', '06:00:00', '20:00:00');
INSERT INTO [Horario_de_atencion] ([dia_semana], [hora_apertura], [hora_cierre]) VALUES ('Martes', '06:00:00', '20:00:00');
INSERT INTO [Horario_de_atencion] ([dia_semana], [hora_apertura], [hora_cierre]) VALUES ('Miércoles', '06:00:00', '20:00:00');
INSERT INTO [Horario_de_atencion] ([dia_semana], [hora_apertura], [hora_cierre]) VALUES ('Jueves', '06:00:00', '20:00:00');
INSERT INTO [Horario_de_atencion] ([dia_semana], [hora_apertura], [hora_cierre]) VALUES ('Viernes', '06:00:00', '20:00:00');

-- Horarios fin de semana
INSERT INTO [Horario_de_atencion] ([dia_semana], [hora_apertura], [hora_cierre]) VALUES ('Sábado', '07:00:00', '21:00:00');
INSERT INTO [Horario_de_atencion] ([dia_semana], [hora_apertura], [hora_cierre]) VALUES ('Domingo', '08:00:00', '19:00:00');

-- Horario_punto (Asignar horarios a puntos)
-- Estación Rodadero (7 días)
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (1, 1);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (2, 1);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (3, 1);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (4, 1);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (5, 1);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (6, 1);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (7, 1);

-- Estación Tayrona (7 días)
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (1, 2);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (2, 2);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (3, 2);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (4, 2);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (5, 2);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (6, 2);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (7, 2);

-- Estación Centro (7 días)
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (1, 3);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (2, 3);
INSERT INTO [Horario_punto] ([id_horario], [id_punto_de_alquiler]) VALUES (3, 3);

-- RUTAS TURÍSTICAS
-- =============================================

INSERT INTO [Ruta_turistica] ([Nombre], [Nivel_de_dificultad], [Distancia_total], [Descripcion]) 
VALUES ('Ruta Playa y Mar', 'Fácil', 8, 'Recorrido costero por las principales playas de Santa Marta');

INSERT INTO [Ruta_turistica] ([Nombre], [Nivel_de_dificultad], [Distancia_total], [Descripcion]) 
VALUES ('Ruta Sierra Nevada', 'Difícil', 25, 'Ascenso desafiante hacia las estribaciones de la Sierra Nevada');

INSERT INTO [Ruta_turistica] ([Nombre], [Nivel_de_dificultad], [Distancia_total], [Descripcion]) 
VALUES ('Ruta Centro Histórico', 'Fácil', 5, 'Tour cultural por el centro histórico y monumentos principales');

-- PUNTOS DE INTERÉS
-- =============================================

-- Puntos de interés Ruta Playa y Mar
INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Playa El Rodadero', 1, '11.2094,-74.2286', 'Playa principal de Santa Marta');

INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Acuario y Museo del Mar', 2, '11.2112,-74.2275', 'Centro de conservación marina');

INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Bahía de Santa Marta', 3, '11.2436,-74.2186', 'Vista panorámica de la bahía');

-- Puntos de interés Ruta Sierra Nevada
INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Minca Pueblo', 1, '11.1492,-74.1186', 'Pueblo cafetero en la sierra');

INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Cascada Marinka', 2, '11.1456,-74.1123', 'Cascada de 60 metros de altura');

INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Mirador Los Pinos', 3, '11.1389,-74.1045', 'Vista panorámica de Santa Marta');

-- Puntos de interés Ruta Centro Histórico
INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Catedral Basílica', 1, '11.2444,-74.2120', 'Iglesia más antigua de Colombia');

INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Casa de la Aduana', 2, '11.2450,-74.2115', 'Museo arqueológico Tayrona');

INSERT INTO [Punto_de_interes] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción]) 
VALUES ('Parque Simón Bolívar', 3, '11.2441,-74.2108', 'Plaza principal del centro histórico');

-- RECORRIDO DE RUTA (Relación Ruta-Puntos de Interés)
-- =============================================

-- Ruta Playa y Mar
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (1, 1, 1);
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (2, 1, 2);
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (3, 1, 3);

-- Ruta Sierra Nevada
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (4, 2, 4);
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (5, 2, 5);
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (6, 2, 6);

-- Ruta Centro Histórico
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (7, 3, 7);
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (8, 3, 8);
INSERT INTO [Recorrido_de_ruta] ([id_recorrido_de_ruta], [id_ruta], [id_punto_de_interes]) VALUES (9, 3, 9);

-- TIPOS DE PERSONA
-- =============================================

INSERT INTO [Tipo_de_persona] ([Nombre_tipo]) VALUES ('Usuario');
INSERT INTO [Tipo_de_persona] ([Nombre_tipo]) VALUES ('Prestador de servicio');

-- PERSONAS
-- =============================================

-- Usuarios (tipo 1)
INSERT INTO [Persona] ([nombre], [apellido], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona]) 
VALUES ('Carlos', 'Rodríguez', '1990-05-15', 'Masculino', 1);

INSERT INTO [Persona] ([nombre], [apellido], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona]) 
VALUES ('María', 'González', '1985-08-22', 'Femenino', 1);

INSERT INTO [Persona] ([nombre], [apellido], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona]) 
VALUES ('Andrés', 'Martínez', '1995-03-10', 'Masculino', 1);

-- Prestadores de servicio (tipo 2)
INSERT INTO [Persona] ([nombre], [apellido], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona]) 
VALUES ('Laura', 'Sánchez', '1988-11-30', 'Femenino', 2);

INSERT INTO [Persona] ([nombre], [apellido], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona]) 
VALUES ('Pedro', 'Ramírez', '1982-07-18', 'Masculino', 2);

INSERT INTO [Persona] ([nombre], [apellido], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona]) 
VALUES ('Sofia', 'Torres', '1991-12-05', 'Femenino', 2);

-- CONTACTOS
-- =============================================

INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 301 2345678', 1);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 312 9876543', 2);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 320 5551234', 3);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 315 7778888', 4);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 300 4445555', 5);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 311 2223333', 6);

-- USUARIOS
-- =============================================

INSERT INTO [Usuario] ([id_persona], [correo], [Contraseña]) 
VALUES (1, 'carlos.rodriguez@email.com', 'Pass123$Carlos');

INSERT INTO [Usuario] ([id_persona], [correo], [Contraseña]) 
VALUES (2, 'maria.gonzalez@email.com', 'MariaSecure456!');

INSERT INTO [Usuario] ([id_persona], [correo], [Contraseña]) 
VALUES (3, 'andres.martinez@email.com', 'AndresPass789#');

-- PRESTADORES DE SERVICIO
-- =============================================

INSERT INTO [Prestador_de_servicio] ([id_persona], [Tipo_de_servicio], [id_Punto_de_alquiler], [id_ruta]) 
VALUES (4, 'Encargado de Estación', 1, NULL);

INSERT INTO [Prestador_de_servicio] ([id_persona], [Tipo_de_servicio], [id_Punto_de_alquiler], [id_ruta]) 
VALUES (5, 'Guía Turístico', NULL, 2);

INSERT INTO [Prestador_de_servicio] ([id_persona], [Tipo_de_servicio], [id_Punto_de_alquiler], [id_ruta]) 
VALUES (6, 'Técnico de Mantenimiento', 3, NULL);

-- PLANES
-- =============================================

INSERT INTO [Plan] ([nombre_comercial_del_plan], [descuentos_aplicables], [indicador_si_incluye_seguro], [categoria_de_bicicletas_incluidas], [duración_incluida], [tipo_de_plan], [Descripcion], [estado_del_plan], [precio_del_paquete], [beneficios_adicionales], [restricciones_de_uso]) 
VALUES ('Plan Básico', 0, 'No', 'Urbana', 'Una hora', 'Por Horas', 'Plan ideal para recorridos cortos en la ciudad', 'Activo', 15000, 'Mapa de rutas incluido', 'Máximo 3 horas continuas');

INSERT INTO [Plan] ([nombre_comercial_del_plan], [descuentos_aplicables], [indicador_si_incluye_seguro], [categoria_de_bicicletas_incluidas], [duración_incluida], [tipo_de_plan], [Descripcion], [estado_del_plan], [precio_del_paquete], [beneficios_adicionales], [restricciones_de_uso]) 
VALUES ('Plan Aventurero', 15, 'Sí', 'Montaña', 'Un día', 'Día Completo', 'Plan perfecto para rutas de montaña con seguro incluido', 'Activo', 80000, 'Seguro contra daños, guía turístico disponible, kit de herramientas', 'Retorno el mismo día');

INSERT INTO [Plan] ([nombre_comercial_del_plan], [descuentos_aplicables], [indicador_si_incluye_seguro], [categoria_de_bicicletas_incluidas], [duración_incluida], [tipo_de_plan], [Descripcion], [estado_del_plan], [precio_del_paquete], [beneficios_adicionales], [restricciones_de_uso]) 
VALUES ('Plan Premium', 20, 'Sí', 'Todas', 'Una semana', 'Semanal', 'Plan completo con acceso a todas las bicicletas', 'Activo', 250000, 'Seguro premium, 2 cambios de bicicleta sin costo, mantenimiento incluido', 'Sin restricciones');

-- SEGUROS
-- =============================================

INSERT INTO [Seguro] ([Nombre], [Monto_maximo_de_indemnización], [Precio_del_plan], [Descripción], [Periodo_de_vigencia], [Descripción_de_daños_cubiertos], [Terminos_y_condiciones]) 
VALUES ('Seguro Básico', 500000.00, 10000.00, 'Cobertura básica contra daños', '2025-01-01 00:00:00', 'Daños menores a componentes', 'Aplica deducible del 20%');

INSERT INTO [Seguro] ([Nombre], [Monto_maximo_de_indemnización], [Precio_del_plan], [Descripción], [Periodo_de_vigencia], [Descripción_de_daños_cubiertos], [Terminos_y_condiciones]) 
VALUES ('Seguro Completo', 2000000.00, 35000.00, 'Cobertura total contra daños y robo', '2025-01-01 00:00:00', 'Robo, daños mayores, accidentes personales', 'Sin deducible para daños, cobertura 100%');

INSERT INTO [Seguro] ([Nombre], [Monto_maximo_de_indemnización], [Precio_del_plan], [Descripción], [Periodo_de_vigencia], [Descripción_de_daños_cubiertos], [Terminos_y_condiciones]) 
VALUES ('Seguro Premium', 5000000.00, 60000.00, 'Máxima cobertura con asistencia 24/7', '2025-01-01 00:00:00', 'Todas las eventualidades, asistencia médica', 'Cobertura internacional, asistencia inmediata');

-- TIPO DE BICICLETA
-- =============================================

INSERT INTO [Tipo_de_bicicleta] ([Tipo_de_uso], [Tipo_de_asistencia]) 
VALUES ('Urbana', 'Manual');

INSERT INTO [Tipo_de_bicicleta] ([Tipo_de_uso], [Tipo_de_asistencia]) 
VALUES ('Montaña', 'Manual');

INSERT INTO [Tipo_de_bicicleta] ([Tipo_de_uso], [Tipo_de_asistencia]) 
VALUES ('Eléctrica', 'Asistida');

-- TARIFA BASE
-- =============================================

INSERT INTO [Tarifa_base] ([Precio_base], [id_tipo_de_bicicleta]) VALUES (5000, 1);
INSERT INTO [Tarifa_base] ([Precio_base], [id_tipo_de_bicicleta]) VALUES (8000, 2);
INSERT INTO [Tarifa_base] ([Precio_base], [id_tipo_de_bicicleta]) VALUES (12000, 3);

-- REGLA OPERATIVA
-- =============================================

INSERT INTO [Regla_operativa] ([porcentaje_de_recargo_retraso], [porcentaje_de_recargo_por_punto_diferente], [duración_máxima_de_alquiler_continuo], [disponibilidad_para_alquiler_de_largo_plazo], [estado_de_la_configuración], [restricciones_especiales_de_uso]) 
VALUES (10, 15, 12, 'Sí', 'Activa', 'Usuarios mayores de 18 años');

INSERT INTO [Regla_operativa] ([porcentaje_de_recargo_retraso], [porcentaje_de_recargo_por_punto_diferente], [duración_máxima_de_alquiler_continuo], [disponibilidad_para_alquiler_de_largo_plazo], [estado_de_la_configuración], [restricciones_especiales_de_uso]) 
VALUES (15, 20, 24, 'Sí', 'Activa', 'Requiere licencia de conducción para bicicletas eléctricas');

INSERT INTO [Regla_operativa] ([porcentaje_de_recargo_retraso], [porcentaje_de_recargo_por_punto_diferente], [duración_máxima_de_alquiler_continuo], [disponibilidad_para_alquiler_de_largo_plazo], [estado_de_la_configuración], [restricciones_especiales_de_uso]) 
VALUES (20, 25, 8, 'No', 'Activa', 'Solo para uso en rutas autorizadas');

-- BICICLETAS
-- =============================================

-- Bicicletas Urbanas en Estación Rodadero
INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (1001, 'Trek', 'FX 2', '2023-01-01', 'trek_fx2.jpg', 'Delantera', 'Híbridas 700c', 12.50, 1, 1, 1, 1, 1);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (1002, 'Giant', 'Escape 3', '2023-01-01', 'giant_escape3.jpg', 'Sin suspensión', 'Híbridas 700c', 11.80, 1, 1, 1, 1, 1);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (1003, 'Specialized', 'Sirrus', '2023-01-01', 'specialized_sirrus.jpg', 'Delantera', 'Urbanas 700c', 13.20, 1, 1, NULL, 1, 1);

-- Bicicletas de Montaña en Estación Tayrona
INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (2001, 'Scott', 'Aspect 950', '2023-01-01', 'scott_aspect950.jpg', 'Doble', 'MTB 29"', 14.50, 2, 2, 2, 2, 2);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (2002, 'Cannondale', 'Trail 7', '2023-01-01', 'cannondale_trail7.jpg', 'Doble', 'MTB 27.5"', 13.90, 2, 2, 2, 2, 2);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (2003, 'Trek', 'Marlin 6', '2023-01-01', 'trek_marlin6.jpg', 'Delantera', 'MTB 29"', 13.70, 2, 2, NULL, 2, 2);

-- Bicicletas Eléctricas en Estación Centro
INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (3001, 'Rad Power', 'RadCity 5', '2024-01-01', 'rad_city5.jpg', 'Delantera', 'Híbridas 700c', 29.50, 3, 3, 3, 3, 2);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (3002, 'Specialized', 'Turbo Vado', '2024-01-01', 'specialized_vado.jpg', 'Delantera', 'Urbanas 700c', 26.80, 3, 3, 3, 3, 2);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_tipo_de_bicicleta], [id_punto_de_alquiler], [id_Seguro], [id_tarifa_base], [id_regla_operativa]) 
VALUES (3003, 'Giant', 'Explore E+', '2024-01-01', 'giant_explore.jpg', 'Delantera', 'Híbridas 700c', 27.30, 3, 3, NULL, 3, 2);

-- RESERVAS
-- =============================================

INSERT INTO [Reserva] ([fecha_de_inicio_de_reserva], [fecha_de_hora_de_reserva], [fecha_de_fin_esperada], [estado_de_la_reserva], [hora_de_devolución_real], [fecha_de_devolución_real], [hora_de_fin_esperada], [costo_total_reserva_caluclado], [id_plan], [id_usuario], [id_bicicleta], [id_punto_de_alquiler], [id_ruta]) 
VALUES ('2024-11-01', '2024-11-01', '2024-11-01', 'Completada', '2024-11-01 12:00:00', '2024-11-01', '2024-11-01 11:00:00', 15000, 1, 1, 1, 1, 1);

INSERT INTO [Reserva] ([fecha_de_inicio_de_reserva], [fecha_de_hora_de_reserva], [fecha_de_fin_esperada], [estado_de_la_reserva], [hora_de_devolución_real], [fecha_de_devolución_real], [hora_de_fin_esperada], [costo_total_reserva_caluclado], [id_plan], [id_usuario], [id_bicicleta], [id_punto_de_alquiler], [id_ruta]) 
VALUES ('2024-11-05', '2024-11-05', '2024-11-05', 'Completada', '2024-11-05 18:30:00', '2024-11-05', '2024-11-05 18:00:00', 80000, 2, 2, 2, 2, 2);

INSERT INTO [Reserva] ([fecha_de_inicio_de_reserva], [fecha_de_hora_de_reserva], [fecha_de_fin_esperada], [estado_de_la_reserva], [hora_de_devolución_real], [fecha_de_devolución_real], [hora_de_fin_esperada], [costo_total_reserva_caluclado], [id_plan], [id_usuario], [id_bicicleta], [id_punto_de_alquiler], [id_ruta]) 
VALUES ('2024-11-10', '2024-11-10', '2024-11-17', 'Activa', '2024-11-17 20:00:00', '2024-11-17', '2024-11-17 20:00:00', 250000, 3, 3, 3, 3, 3);

-- MANTENIMIENTO
-- =============================================

INSERT INTO [Mantenimiento] ([Fecha_de_mantenimiento], [Kilometraje_recorrido], [Tipo_de_mantenimiento], [Descripcion], [id_bicicleta]) 
VALUES ('2024-10-15 10:00:00', 500, 'Preventivo', 'Revisión general y lubricación', 1);

INSERT INTO [Mantenimiento] ([Fecha_de_mantenimiento], [Kilometraje_recorrido], [Tipo_de_mantenimiento], [Descripcion], [id_bicicleta]) 
VALUES ('2024-10-20 14:30:00', 1200, 'Correctivo', 'Cambio de pastillas de freno', 2);

INSERT INTO [Mantenimiento] ([Fecha_de_mantenimiento], [Kilometraje_recorrido], [Tipo_de_mantenimiento], [Descripcion], [id_bicicleta]) 
VALUES ('2024-11-01 09:00:00', 300, 'Preventivo', 'Ajuste de cambios y tensión cadena', 3);

-- TIPO DE MÉTODO DE PAGO
-- =============================================

INSERT INTO [Tipo_de_metodo] ([Nombre]) VALUES ('Tarjeta');
INSERT INTO [Tipo_de_metodo] ([Nombre]) VALUES ('Billetera virtual');
INSERT INTO [Tipo_de_metodo] ([Nombre]) VALUES ('Efectivo');

-- MÉTODO DE PAGO
-- =============================================

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-01-15', '2024-01-15', 1);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-02-20', '2024-02-20', 1);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-03-10', '2024-03-10', 2);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-04-05', '2024-04-05', 2);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-05-12', '2024-05-12', 3);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-06-18', '2024-06-18', 3);

-- TARJETA
-- =============================================

INSERT INTO [Tarjeta] ([id_metodo_de_pago], [Franquicia], [Tipo], [numero_de_enmascarado], [Titular]) 
VALUES (1, 'Visa', 'Crédito', '**** **** **** 1234', 'Carlos Rodríguez');

INSERT INTO [Tarjeta] ([id_metodo_de_pago], [Franquicia], [Tipo], [numero_de_enmascarado], [Titular]) 
VALUES (2, 'MasterCard', 'Débito', '**** **** **** 5678', 'María González');

-- BILLETERA VIRTUAL
-- =============================================

INSERT INTO [Billetera_virtual] ([id_metodo_de_pago], [Identificador_de_cuenta], [Proveedor]) 
VALUES (3, 'andres.martinez@paypal.com', 'PayPal');

INSERT INTO [Billetera_virtual] ([id_metodo_de_pago], [Identificador_de_cuenta], [Proveedor]) 
VALUES (4, 'carlos.rodriguez@paypal.com', 'PayPal');

-- EFECTIVO
-- =============================================

INSERT INTO [Efectivo] ([id_metodo_pago], [Codigo_recibo]) 
VALUES (5, 'REC-2024-001-ABC123');

INSERT INTO [Efectivo] ([id_metodo_pago], [Codigo_recibo]) 
VALUES (6, 'REC-2024-002-XYZ789');

-- MÉTODOS DE PAGO DEL USUARIO
-- =============================================

INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (1, 1);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (1, 4);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (2, 2);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (2, 5);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (3, 3);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (3, 6);

-- OBJETO RESEÑABLE
-- =============================================

-- Bicicletas reseñables
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (1, NULL, NULL);
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (2, NULL, NULL);
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (3, NULL, NULL);

-- Prestadores de servicio reseñables
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (NULL, 4, NULL);
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (NULL, 5, NULL);
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (NULL, 6, NULL);

-- Rutas reseñables
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (NULL, NULL, 1);
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (NULL, NULL, 2);
INSERT INTO [Objeto_reseñable] ([id_bicicleta], [id_persona], [id_ruta]) VALUES (NULL, NULL, 3);

-- MULTIMEDIA
-- =============================================

INSERT INTO [Multimedia] ([Estado_de_revision], [Tamaño], [Formato_de_archivo], [Fecha_de_subida], [Foto_o_video]) 
VALUES ('Aprobado', 2048576, 'JPG', '2024-11-02', 'foto_bicicleta_trek_1001.jpg');

INSERT INTO [Multimedia] ([Estado_de_revision], [Tamaño], [Formato_de_archivo], [Fecha_de_subida], [Foto_o_video]) 
VALUES ('Aprobado', 15728640, 'MP4', '2024-11-06', 'video_ruta_sierra_nevada.mp4');

INSERT INTO [Multimedia] ([Estado_de_revision], [Tamaño], [Formato_de_archivo], [Fecha_de_subida], [Foto_o_video]) 
VALUES ('Pendiente', 3145728, 'PNG', '2024-11-12', 'foto_guia_turistico.png');

-- RESEÑA
-- =============================================

INSERT INTO [Reseña] ([Calificación], [Fecha_de_publicación], [Texto_de_comentario], [Estado_de_revisión], [id_usuario], [id_multimedia], [id_objeto_reseñable]) 
VALUES (4.5, '2024-11-02', 'Excelente bicicleta, muy cómoda para recorridos urbanos. La recomiendo totalmente.', 'Aprobada', 1, 1, 1);

INSERT INTO [Reseña] ([Calificación], [Fecha_de_publicación], [Texto_de_comentario], [Estado_de_revisión], [id_usuario], [id_multimedia], [id_objeto_reseñable]) 
VALUES (5.0, '2024-11-06', 'La ruta Sierra Nevada es increíble, paisajes hermosos y bien señalizada. El guía fue muy profesional.', 'Aprobada', 2, 2, 2);

INSERT INTO [Reseña] ([Calificación], [Fecha_de_publicación], [Texto_de_comentario], [Estado_de_revisión], [id_usuario], [id_multimedia], [id_objeto_reseñable]) 
VALUES (4.0, '2024-11-12', 'Buen servicio en general, las bicicletas eléctricas son muy potentes.', 'Pendiente', 3, 3, 3);

-- INCIDENTE
-- =============================================

INSERT INTO [Incidente] ([tipo_de_incidente], [descripción], [ubicación_donde_ocurrio], [fecha_de_incidente], [foto], [prioridad], [estado_de_incidente], [hora_de_incidente], [id_persona], [id_reserva]) 
VALUES ('Pinchazo', 'Pinchazo en llanta trasera en el kilómetro 3 de la ruta', 'Carretera a Minca, km 3', '2024-11-05', NULL, 'Media', 'Resuelto', '2024-11-05 14:30:00', 5, 2);

INSERT INTO [Incidente] ([tipo_de_incidente], [descripción], [ubicación_donde_ocurrio], [fecha_de_incidente], [foto], [prioridad], [estado_de_incidente], [hora_de_incidente], [id_persona], [id_reserva]) 
VALUES ('Falla mecánica', 'Problemas con el cambio de velocidades, no cambia correctamente', 'Estación Rodadero', '2024-11-01', NULL, 'Baja', 'Resuelto', '2024-11-01 11:45:00', 4, 1);

INSERT INTO [Incidente] ([tipo_de_incidente], [descripción], [ubicación_donde_ocurrio], [fecha_de_incidente], [foto], [prioridad], [estado_de_incidente], [hora_de_incidente], [id_persona], [id_reserva]) 
VALUES ('Batería baja', 'La batería de la bicicleta eléctrica se descargó más rápido de lo esperado', 'Centro Histórico', '2024-11-11', NULL, 'Alta', 'En proceso', '2024-11-11 16:00:00', 6, 3);

-- TRANSACCIÓN
-- =============================================

INSERT INTO [Transaccion] ([monto_total_cobrado], [tipo_de_transacción], [observaciones_adicionales], [fecha_de_transacción], [hora_de_transacción], [estado_de_transacción], [referencia_de_pago], [id_reserva]) 
VALUES (15000, 'Pago de reserva', 'Pago completo realizado con tarjeta Visa', '2024-11-01', '2024-11-01 08:00:00', 'Completada', 'TRX-2024-001-VISA', 1);

INSERT INTO [Transaccion] ([monto_total_cobrado], [tipo_de_transacción], [observaciones_adicionales], [fecha_de_transacción], [hora_de_transacción], [estado_de_transacción], [referencia_de_pago], [id_reserva]) 
VALUES (80000, 'Pago de reserva', 'Pago completo más cargo adicional por retraso en devolución', '2024-11-05', '2024-11-05 10:30:00', 'Completada', 'TRX-2024-002-MCARD', 2);

INSERT INTO [Transaccion] ([monto_total_cobrado], [tipo_de_transacción], [observaciones_adicionales], [fecha_de_transacción], [hora_de_transacción], [estado_de_transacción], [referencia_de_pago], [id_reserva]) 
VALUES (250000, 'Pago de reserva', 'Pago plan semanal con descuento del 20% aplicado', '2024-11-10', '2024-11-10 09:15:00', 'Completada', 'TRX-2024-003-PAYPAL', 3);