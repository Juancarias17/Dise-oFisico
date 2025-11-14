-- ============================================
-- INSERCIONES PARA SISTEMA DE ALQUILER DE BICICLETAS
-- ============================================

-- Tabla: Pais
INSERT INTO [Pais] ([Nombre_Pais]) VALUES ('Colombia');
INSERT INTO [Pais] ([Nombre_Pais]) VALUES ('Argentina');
INSERT INTO [Pais] ([Nombre_Pais]) VALUES ('México');

-- Tabla: Departamento
INSERT INTO [Departamento] ([Nombre_Departamento], [idPais]) VALUES ('Magdalena', 1);
INSERT INTO [Departamento] ([Nombre_Departamento], [idPais]) VALUES ('Buenos Aires', 2);
INSERT INTO [Departamento] ([Nombre_Departamento], [idPais]) VALUES ('Ciudad de México', 3);

-- Tabla: Ciudad
INSERT INTO [Ciudad] ([Nombre_Ciudad], [idDepartamento]) VALUES ('Santa Marta', 1);
INSERT INTO [Ciudad] ([Nombre_Ciudad], [idDepartamento]) VALUES ('La Plata', 2);
INSERT INTO [Ciudad] ([Nombre_Ciudad], [idDepartamento]) VALUES ('Coyoacán', 3);

-- Tabla: Tipo_de_plan
INSERT INTO [Tipo_de_plan] ([nombre]) VALUES ('Por hora');
INSERT INTO [Tipo_de_plan] ([nombre]) VALUES ('Por día');
INSERT INTO [Tipo_de_plan] ([nombre]) VALUES ('Mensual');
INSERT INTO [Tipo_de_plan] ([nombre]) VALUES ('Semanal');
INSERT INTO [Tipo_de_plan] ([nombre]) VALUES ('Anual');

-- Tabla: Plan (Necesitamos más planes para las bicicletas y usuarios)
-- Planes tipo "Por hora"
INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan básico por hora para usuarios ocasionales', 'Activo', 5000.00, 'Reembolso del 100% si se cancela con 24 horas de anticipación', 1);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan por hora económico', 'Activo', 4000.00, 'Reembolso del 80% con 12 horas de anticipación', 1);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan por hora premium', 'Activo', 7000.00, 'Reembolso total sin restricciones', 1);

-- Planes tipo "Por día"
INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan diario para turistas y visitantes', 'Activo', 35000.00, 'Reembolso del 50% si se cancela el mismo día', 2);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan diario básico', 'Activo', 30000.00, 'Reembolso del 60% con 6 horas de anticipación', 2);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan diario todo incluido', 'Activo', 45000.00, 'Reembolso del 70% el mismo día', 2);

-- Planes tipo "Mensual"
INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan mensual premium con descuentos especiales', 'Activo', 250000.00, 'No hay reembolso después de 7 días de uso', 3);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan mensual estándar', 'Activo', 200000.00, 'Reembolso proporcional los primeros 5 días', 3);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan mensual básico', 'Activo', 180000.00, 'Reembolso del 30% en los primeros 3 días', 3);

-- Planes tipo "Semanal"
INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan semanal fin de semana', 'Activo', 80000.00, 'Reembolso del 50% con 48 horas de anticipación', 4);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan semanal completo', 'Activo', 120000.00, 'Reembolso del 40% con 24 horas de anticipación', 4);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan semanal turista', 'Activo', 100000.00, 'Reembolso del 60% con 72 horas de anticipación', 4);

-- Planes tipo "Anual"
INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan anual VIP', 'Activo', 2000000.00, 'Reembolso proporcional los primeros 30 días', 5);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan anual corporativo', 'Activo', 1800000.00, 'Reembolso del 50% los primeros 15 días', 5);

INSERT INTO [Plan] ([Descripcion], [estado], [tarifa], [Politicas_de_reembolso], [id_tipo_plan]) 
VALUES ('Plan anual estudiante', 'Activo', 1500000.00, 'Reembolso del 70% los primeros 20 días', 5);

-- Tabla: Punto_de_alquiler
INSERT INTO [Punto_de_alquiler] ([Capacidad_total_de_bicicletas], [Nombre], [Foto], [Direccion], [Coordenadas_geograficas], [Numero_de_bicicletas_almacenadas], [id_ciudad]) 
VALUES (50, 'Estación Rodadero', 'https://ejemplo.com/foto_rodadero.jpg', 'Calle 11 #3-25, El Rodadero', '11.2094,-74.2272', 35, 1);

INSERT INTO [Punto_de_alquiler] ([Capacidad_total_de_bicicletas], [Nombre], [Foto], [Direccion], [Coordenadas_geograficas], [Numero_de_bicicletas_almacenadas], [id_ciudad]) 
VALUES (40, 'Estación Parque Tayrona', 'https://ejemplo.com/foto_tayrona.jpg', 'Entrada Principal Parque Tayrona', '11.3100,-74.0500', 28, 1);

INSERT INTO [Punto_de_alquiler] ([Capacidad_total_de_bicicletas], [Nombre], [Foto], [Direccion], [Coordenadas_geograficas], [Numero_de_bicicletas_almacenadas], [id_ciudad]) 
VALUES (30, 'Estación Centro Histórico', 'https://ejemplo.com/foto_centro.jpg', 'Carrera 5 #16-44, Centro', '11.2419,-74.2064', 20, 1);

-- Tabla: Tipo_de_persona
INSERT INTO [Tipo_de_persona] ([Nombre]) VALUES ('Usuario');
INSERT INTO [Tipo_de_persona] ([Nombre]) VALUES ('Prestador de servicio');
INSERT INTO [Tipo_de_persona] ([Nombre]) VALUES ('Usuario');

-- Tabla: Persona (Necesitamos más personas para múltiples usuarios)
-- Usuarios
INSERT INTO [Persona] ([nombre], [apellido], [correo], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona], [Acepta_terminos]) 
VALUES ('Carlos', 'Martínez', 'carlos.martinez@email.com', '1990-05-15', 'Masculino', 1, 1);

INSERT INTO [Persona] ([nombre], [apellido], [correo], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona], [Acepta_terminos]) 
VALUES ('Miguel', 'Rodríguez', 'miguel.rodriguez@email.com', '1995-12-03', 'Masculino', 1, 1);

INSERT INTO [Persona] ([nombre], [apellido], [correo], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona], [Acepta_terminos]) 
VALUES ('Laura', 'Pérez', 'laura.perez@email.com', '1992-07-20', 'Femenino', 1, 1);

-- Prestadores de servicio
INSERT INTO [Persona] ([nombre], [apellido], [correo], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona], [Acepta_terminos]) 
VALUES ('Ana', 'García', 'ana.garcia@email.com', '1985-08-22', 'Femenino', 2, 1);

INSERT INTO [Persona] ([nombre], [apellido], [correo], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona], [Acepta_terminos]) 
VALUES ('José', 'Mendoza', 'jose.mendoza@email.com', '1988-11-10', 'Masculino', 2, 1);

INSERT INTO [Persona] ([nombre], [apellido], [correo], [fecha_nacimiento], [Sexo], [id_Tipo_de_persona], [Acepta_terminos]) 
VALUES ('María', 'López', 'maria.lopez@email.com', '1990-03-15', 'Femenino', 2, 1);

-- Tabla: Contacto
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 300 123 4567', 1);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 320 456 7890', 2);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 315 789 1234', 3);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 310 987 6543', 4);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 305 234 5678', 5);
INSERT INTO [Contacto] ([Numero_telefonico], [id_persona]) VALUES ('+57 318 876 5432', 6);

-- Tabla: Usuario (Cada usuario tiene su propia persona)
INSERT INTO [Usuario] ([id_persona], [Contraseña], [id_plan]) 
VALUES (1, '$2a$12$KIXqNwPqJ9fR5Zx8vN5GuOYHJKLMNPqRsTuVwXyZ', 1);

INSERT INTO [Usuario] ([id_persona], [Contraseña], [id_plan]) 
VALUES (2, '$2a$12$AbCdEfGhIjKlMnOpQrStUvWxYz123456789', 4);

INSERT INTO [Usuario] ([id_persona], [Contraseña], [id_plan]) 
VALUES (3, '$2a$12$ZyXwVuTsRqPoNmLkJiHgFeDcBa987654321', 7);

-- Tabla: Prestador_de_servicio
INSERT INTO [Prestador_de_servicio] ([id_persona], [Tipo_de_servicio], [id_Punto_de_alquiler]) 
VALUES (4, 'Mantenimiento y reparación de bicicletas', 1);

INSERT INTO [Prestador_de_servicio] ([id_persona], [Tipo_de_servicio], [id_Punto_de_alquiler]) 
VALUES (5, 'Guía turístico en rutas ciclísticas', 2);

INSERT INTO [Prestador_de_servicio] ([id_persona], [Tipo_de_servicio], [id_Punto_de_alquiler]) 
VALUES (6, 'Atención al cliente y alquiler', 3);

-- Tabla: Horario_de_atencion
INSERT INTO [Horario_de_atencion] ([id_punto_de_alquiler], [dia_semana], [hora_apertura], [hora_cierre]) 
VALUES (1, 'Lunes', '06:00:00', '20:00:00');

INSERT INTO [Horario_de_atencion] ([id_punto_de_alquiler], [dia_semana], [hora_apertura], [hora_cierre]) 
VALUES (1, 'Sábado', '07:00:00', '22:00:00');

INSERT INTO [Horario_de_atencion] ([id_punto_de_alquiler], [dia_semana], [hora_apertura], [hora_cierre]) 
VALUES (2, 'Domingo', '08:00:00', '18:00:00');

-- Tabla: Rutas
INSERT INTO [Rutas] ([Nombre], [Nivel_de_dificultad], [Distancia_total], [Descripcion]) 
VALUES ('Ruta Costera Santa Marta', 'Fácil', 15, 'Recorrido por la bahía de Santa Marta con vistas al mar');

INSERT INTO [Rutas] ([Nombre], [Nivel_de_dificultad], [Distancia_total], [Descripcion]) 
VALUES ('Ascenso Sierra Nevada', 'Difícil', 45, 'Ruta de montaña con elevación pronunciada hacia la Sierra Nevada');

INSERT INTO [Rutas] ([Nombre], [Nivel_de_dificultad], [Distancia_total], [Descripcion]) 
VALUES ('Tour Centro Histórico', 'Moderado', 10, 'Recorrido cultural por el centro histórico de la ciudad');

-- Tabla: Ruta_Prestador
INSERT INTO [Ruta_Prestador] ([id_ruta], [id_prestador]) VALUES (1, 4);
INSERT INTO [Ruta_Prestador] ([id_ruta], [id_prestador]) VALUES (2, 5);
INSERT INTO [Ruta_Prestador] ([id_ruta], [id_prestador]) VALUES (3, 6);

-- Tabla: Punto_de_interés
INSERT INTO [Punto_de_interés] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción], [id_Ruta]) 
VALUES ('Playa El Rodadero', 1, '11.2094,-74.2272', 'Principal playa turística de Santa Marta', 1);

INSERT INTO [Punto_de_interés] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción], [id_Ruta]) 
VALUES ('Mirador Alto de Mira', 2, '11.3200,-74.0800', 'Punto panorámico con vista a la ciudad y la sierra', 2);

INSERT INTO [Punto_de_interés] ([Nombre], [Orden_secuencial_en_la_ruta], [coordenadas_geograficas], [Descripción], [id_Ruta]) 
VALUES ('Catedral Basílica', 1, '11.2419,-74.2064', 'Edificación histórica colonial del siglo XVIII', 3);

-- Tabla: Por_hora (debe coincidir con planes de tipo 1 - Por hora)
INSERT INTO [Por_hora] ([id_plan], [Duracion_maxima], [Duracion_minima], [Tarifa_por_fraccion_adicional]) 
VALUES (1, 4, 1, 2000);

INSERT INTO [Por_hora] ([id_plan], [Duracion_maxima], [Duracion_minima], [Tarifa_por_fraccion_adicional]) 
VALUES (2, 6, 2, 1500);

INSERT INTO [Por_hora] ([id_plan], [Duracion_maxima], [Duracion_minima], [Tarifa_por_fraccion_adicional]) 
VALUES (3, 8, 1, 2500);

-- Tabla: Por_dia (debe coincidir con planes de tipo 2 - Por día)
INSERT INTO [Por_dia] ([id_plan], [Costo_extra_por_extender_al_dia_siguiente], [Hora_limite_de_devolución]) 
VALUES (4, 15000, '20:00:00');

INSERT INTO [Por_dia] ([id_plan], [Costo_extra_por_extender_al_dia_siguiente], [Hora_limite_de_devolución]) 
VALUES (5, 20000, '22:00:00');

INSERT INTO [Por_dia] ([id_plan], [Costo_extra_por_extender_al_dia_siguiente], [Hora_limite_de_devolución]) 
VALUES (6, 10000, '18:00:00');

-- Tabla: Mensual (debe coincidir con planes de tipo 3 - Mensual)
INSERT INTO [Mensual] ([id_plan], [Confirmación_de_reenovación_automatica], [Descuento_especial]) 
VALUES (7, 'Si', 0.15);

INSERT INTO [Mensual] ([id_plan], [Confirmación_de_reenovación_automatica], [Descuento_especial]) 
VALUES (8, 'No', 0.10);

INSERT INTO [Mensual] ([id_plan], [Confirmación_de_reenovación_automatica], [Descuento_especial]) 
VALUES (9, 'Si', 0.20);

-- Tabla: Anual (debe coincidir con planes de tipo 5 - Anual)
INSERT INTO [Anual] ([id_plan], [Confirmación_de_reenovación_automatica], [Descuento_especial]) 
VALUES (13, 'Si', 0.25);

INSERT INTO [Anual] ([id_plan], [Confirmación_de_reenovación_automatica], [Descuento_especial]) 
VALUES (14, 'No', 0.20);

INSERT INTO [Anual] ([id_plan], [Confirmación_de_reenovación_automatica], [Descuento_especial]) 
VALUES (15, 'Si', 0.30);

-- Tabla: Semanal (debe coincidir con planes de tipo 4 - Semanal)
INSERT INTO [Semanal] ([id_plan], [Número_de_semanas_inlcluidas], [Días_especificos_en_que_aplica]) 
VALUES (10, 1, 'Lunes a Viernes');

INSERT INTO [Semanal] ([id_plan], [Número_de_semanas_inlcluidas], [Días_especificos_en_que_aplica]) 
VALUES (11, 2, 'Todos los días');

INSERT INTO [Semanal] ([id_plan], [Número_de_semanas_inlcluidas], [Días_especificos_en_que_aplica]) 
VALUES (12, 4, 'Fines de semana');

-- Tabla: Seguro
INSERT INTO [Seguro] ([Nombre], [Monto_maximo_de_indemnización], [Precio_del_plan], [Descripción], [Periodo_de_vigencia], [Descripción_de_daños_cubiertos], [Terminos_y_condiciones]) 
VALUES ('Seguro Básico', 500000.00, 15000.00, 'Cobertura básica contra daños y robo', '2025-12-31', 'Cubre daños menores, robo parcial', 'Deducible del 10%. Válido solo en territorio nacional');

INSERT INTO [Seguro] ([Nombre], [Monto_maximo_de_indemnización], [Precio_del_plan], [Descripción], [Periodo_de_vigencia], [Descripción_de_daños_cubiertos], [Terminos_y_condiciones]) 
VALUES ('Seguro Premium', 1500000.00, 35000.00, 'Cobertura completa todo riesgo', '2025-12-31', 'Cubre todo tipo de daños, robo total, accidentes', 'Sin deducible. Cobertura internacional');

INSERT INTO [Seguro] ([Nombre], [Monto_maximo_de_indemnización], [Precio_del_plan], [Descripción], [Periodo_de_vigencia], [Descripción_de_daños_cubiertos], [Terminos_y_condiciones]) 
VALUES ('Seguro Estándar', 1000000.00, 25000.00, 'Cobertura intermedia contra riesgos comunes', '2025-12-31', 'Cubre daños moderados, robo con denuncia', 'Deducible del 5%. Válido en ciudades principales');

-- Tabla: Tarifa_base
INSERT INTO [Tarifa_base] ([Tipo_de_uso], [Tipo_de_asistencia], [Precio_base]) 
VALUES ('urbana', 'Convencional', 45000);

INSERT INTO [Tarifa_base] ([Tipo_de_uso], [Tipo_de_asistencia], [Precio_base]) 
VALUES ('montaña', 'Eléctrica', 120000);

INSERT INTO [Tarifa_base] ([Tipo_de_uso], [Tipo_de_asistencia], [Precio_base]) 
VALUES ('de ruta', 'Convencional', 70000);

-- Tabla: Bicicleta (Ahora con planes diferentes)
INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_punto_de_alquiler], [id_plan], [id_Seguro], [id_tarifa_base]) 
VALUES (1001, 'Trek', 'FX 3 Disc', '2023-01-01', 'https://ejemplo.com/trek_fx3.jpg', 'Delantera con bloqueo', 'Llantas híbridas 700c', 12.50, 1, 1, 1, 1);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_punto_de_alquiler], [id_plan], [id_Seguro], [id_tarifa_base]) 
VALUES (1002, 'Giant', 'Trance X E+', '2024-01-01', 'https://ejemplo.com/giant_trance.jpg', 'Doble suspensión', 'Llantas MTB 29 pulgadas', 22.80, 2, 4, 2, 2);

INSERT INTO [Bicicleta] ([Numero_de_serie], [Marca], [Modelo], [Año_de_fabricacion], [foto], [suspensión], [tipo_de_llantas], [peso], [id_punto_de_alquiler], [id_plan], [id_Seguro], [id_tarifa_base]) 
VALUES (1003, 'Specialized', 'Roubaix Sport', '2023-06-01', 'https://ejemplo.com/specialized_roubaix.jpg', 'Sin suspensión', 'Llantas de ruta 700x25c', 9.20, 3, 7, 3, 3);

-- Tabla: Mantenimiento
INSERT INTO [Mantenimiento] ([Fecha_de_mantenimiento], [Kilometraje_recorrido], [Tipo_de_mantenimiento], [Descripcion], [id_bicicleta]) 
VALUES ('2024-10-15', 500, 'Preventivo', 'Revisión general y lubricación de cadena',1);

INSERT INTO [Mantenimiento] ([Fecha_de_mantenimiento], [Kilometraje_recorrido], [Tipo_de_mantenimiento], [Descripcion], [id_bicicleta]) 
VALUES ('2024-11-01', 1200, 'Correctivo', 'Cambio de pastillas de freno y ajuste',2);

INSERT INTO [Mantenimiento] ([Fecha_de_mantenimiento], [Kilometraje_recorrido], [Tipo_de_mantenimiento], [Descripcion], [id_bicicleta]) 
VALUES ('2024-09-20', 800, 'Preventivo', 'Calibración de cambios y revisión',3);

-- Tabla: Tipo_de_metodo
INSERT INTO [Tipo_de_metodo] ([Nombre]) VALUES ('Tarjeta');
INSERT INTO [Tipo_de_metodo] ([Nombre]) VALUES ('Billetera virtual');
INSERT INTO [Tipo_de_metodo] ([Nombre]) VALUES ('Efectivo');

-- Tabla: Metodo_de_pago (Necesitamos métodos de pago únicos)
INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-01-15', '2024-01-15', 1);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-02-10', '2024-02-10', 1);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-03-05', '2024-03-05', 1);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-03-20', '2024-05-10', 2);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-04-15', '2024-04-15', 2);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-05-20', '2024-05-20', 2);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-06-01', '2024-06-01', 3);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-07-10', '2024-07-10', 3);

INSERT INTO [Metodo_de_pago] ([fecha_Registro], [fecha_modificacion], [id_tipo_de_metodo]) 
VALUES ('2024-08-05', '2024-08-05', 3);

-- Tabla: Efectivo (id_metodo_pago 7, 8, 9 son de tipo Efectivo)
INSERT INTO [Efectivo] ([id_metodo_pago], [Codigo_recibo]) 
VALUES (7, 'REC-2024-001-SM');

INSERT INTO [Efectivo] ([id_metodo_pago], [Codigo_recibo]) 
VALUES (8, 'REC-2024-002-SM');

INSERT INTO [Efectivo] ([id_metodo_pago], [Codigo_recibo]) 
VALUES (9, 'REC-2024-003-SM');

-- Tabla: Tarjeta (id_metodo_pago 1, 2, 3 son de tipo Tarjeta)
INSERT INTO [Tarjeta] ([id_metodo_de_pago], [Franquicia], [Tipo], [numero_de_enmascarado], [Titular]) 
VALUES (1, 'Visa', 'Crédito', '**** **** **** 1234', 'Carlos Martínez');

INSERT INTO [Tarjeta] ([id_metodo_de_pago], [Franquicia], [Tipo], [numero_de_enmascarado], [Titular]) 
VALUES (2, 'MasterCard', 'Débito', '**** **** **** 5678', 'Miguel Rodríguez');

INSERT INTO [Tarjeta] ([id_metodo_de_pago], [Franquicia], [Tipo], [numero_de_enmascarado], [Titular]) 
VALUES (3, 'American Express', 'Crédito', '**** ****** *9012', 'Laura Pérez');

-- Tabla: Billetera_virtual (id_metodo_pago 4, 5, 6 son de tipo Billetera virtual)
INSERT INTO [Billetera_virtual] ([id_metodo_de_pago], [Identificador_de_cuenta], [Proveedor]) 
VALUES (4, 'carlos.martinez@paypal.com', 'PayPal');

INSERT INTO [Billetera_virtual] ([id_metodo_de_pago], [Identificador_de_cuenta], [Proveedor]) 
VALUES (5, 'miguel.rodriguez@paypal.com', 'PayPal');

INSERT INTO [Billetera_virtual] ([id_metodo_de_pago], [Identificador_de_cuenta], [Proveedor]) 
VALUES (6, 'laura.perez@paypal.com', 'PayPal');

-- Tabla: Métodos_de_pago_del_usuario (Cada método de pago es único)
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (1, 1);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (1, 4);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (2, 2);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (2, 5);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (3, 3);
INSERT INTO [Métodos_de_pago_del_usuario] ([id_usuario], [id_metodo_pago]) VALUES (3, 6);

-- Tabla: Reseña (Actualizar referencias de prestadores)
INSERT INTO [Reseña] ([Calificación], [Fecha_de_publicación], [Texto_de_comentario], [Estado_de_revisión], [id_Usuario], [id_Prestador_de_servicio], [id_Ruta], [id_Bicicleta]) 
VALUES (4.5, '2024-11-01', 'Excelente servicio, la bicicleta estaba en perfectas condiciones', 'Aprobada', 1, NULL, NULL, 1);

INSERT INTO [Reseña] ([Calificación], [Fecha_de_publicación], [Texto_de_comentario], [Estado_de_revisión], [id_Usuario], [id_Prestador_de_servicio], [id_Ruta], [id_Bicicleta]) 
VALUES (5.0, '2024-10-28', 'La ruta costera es hermosa, totalmente recomendada para familias', 'Aprobada', 2, NULL, 1, NULL);

INSERT INTO [Reseña] ([Calificación], [Fecha_de_publicación], [Texto_de_comentario], [Estado_de_revisión], [id_Usuario], [id_Prestador_de_servicio], [id_Ruta], [id_Bicicleta]) 
VALUES (4.0, '2024-11-05', 'El prestador de servicio fue muy atento y profesional', 'Pendiente', 3, 4, NULL, NULL);

-- Tabla: Multimedia
INSERT INTO [Multimedia] ([Estado_de_revision], [Tamaño], [Formato_de_archivo], [Fecha_de_subida], [Foto_o_video], [idReseña]) 
VALUES ('Aprobado', 2500000, 'JPG', '2024-11-01', 'https://ejemplo.com/multimedia/foto1.jpg', 1);

INSERT INTO [Multimedia] ([Estado_de_revision], [Tamaño], [Formato_de_archivo], [Fecha_de_subida], [Foto_o_video], [idReseña]) 
VALUES ('Aprobado', 15000000, 'MP4', '2024-10-28', 'https://ejemplo.com/multimedia/video_ruta.mp4', 2);

INSERT INTO [Multimedia] ([Estado_de_revision], [Tamaño], [Formato_de_archivo], [Fecha_de_subida], [Foto_o_video], [idReseña]) 
VALUES ('Pendiente', 3200000, 'PNG', '2024-11-05', 'https://ejemplo.com/multimedia/foto_servicio.png', 3);