CREATE DATABASE  IF NOT EXISTS `NATURADIET`;
USE `NATURADIET`;
--
-- Table structure for table `ROL`
--

DROP TABLE IF EXISTS `ROL`;

CREATE TABLE `ROL` (
  `ID_ROL` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;







--
-- Table structure for table `CALORIA`
--

DROP TABLE IF EXISTS `CALORIA`;

CREATE TABLE `CALORIA` (
  `ID_CALORIA` int NOT NULL AUTO_INCREMENT,
  `PERSONA` varchar(30) DEFAULT NULL,
  `GENERO` varchar(30) DEFAULT NULL,
  `EDAD_MIN` int DEFAULT NULL,
  `EDAD_MAX` int DEFAULT NULL,
  `CALORIAS` int DEFAULT NULL,
  PRIMARY KEY (`ID_CALORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




--
-- Table structure for table `CATEGORIA`
--

DROP TABLE IF EXISTS `CATEGORIA`;

CREATE TABLE `CATEGORIA` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `CATEGORIA_PRODUCTO`
--

DROP TABLE IF EXISTS `CATEGORIA_PRODUCTO`;

CREATE TABLE `CATEGORIA_PRODUCTO` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





--
-- Table structure for table `DIETA`
--

DROP TABLE IF EXISTS `DIETA`;

CREATE TABLE `DIETA` (
  `ID_DIETA` int NOT NULL AUTO_INCREMENT,
  `LUNES` longtext NOT NULL,
  `MARTES` longtext NOT NULL,
  `MIERCOLES` longtext NOT NULL,
  `JUEVES` longtext NOT NULL,
  `VIERNES` longtext NOT NULL,
  `SABADO` longtext NOT NULL,
  `DOMINGO` longtext NOT NULL,
  `KCAL` int NOT NULL,
  PRIMARY KEY (`ID_DIETA`),
  KEY `DIETA_KCAL_c87a2286_fk_CALORIA_ID_CALORIA` (`KCAL`),
  CONSTRAINT `DIETA_KCAL_c87a2286_fk_CALORIA_ID_CALORIA` FOREIGN KEY (`KCAL`) REFERENCES `CALORIA` (`ID_CALORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





--
-- Table structure for table `ESTADO`
--

DROP TABLE IF EXISTS `ESTADO`;

CREATE TABLE `ESTADO` (
  `ID_ESTADO` int NOT NULL AUTO_INCREMENT,
  `MINIMO` decimal(3,1) NOT NULL,
  `MAXIMO` decimal(3,1) NOT NULL,
  `TIPO` varchar(45) NOT NULL,
  `DESCRIPCION` longtext,
  PRIMARY KEY (`ID_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;







--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;

CREATE TABLE `USUARIO` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `EDAD` int NOT NULL,
  `DNI` varchar(11) DEFAULT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL,
  `LOCALIDAD` varchar(50) DEFAULT NULL,
  `PROVINCIA` varchar(30) DEFAULT NULL,
  `CP` varchar(5) DEFAULT NULL,
  `PESO` int NOT NULL,
  `ALTURA` decimal(3,2) NOT NULL,
  `IMC` decimal(3,1) DEFAULT NULL,
  `GENERO` varchar(30) NOT NULL,
  `ESTADO` int DEFAULT NULL,
  `ROL` int DEFAULT NULL,
  `DESCRIPCION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `USUARIO_ESTADO_ad3a19c9_fk_ESTADO_ID_ESTADO` (`ESTADO`),
  KEY `USUARIO_ROL_298e5f17_fk_ROL_ID_ROL` (`ROL`),
  CONSTRAINT `USUARIO_ESTADO_ad3a19c9_fk_ESTADO_ID_ESTADO` FOREIGN KEY (`ESTADO`) REFERENCES `ESTADO` (`ID_ESTADO`),
  CONSTRAINT `USUARIO_ROL_298e5f17_fk_ROL_ID_ROL` FOREIGN KEY (`ROL`) REFERENCES `ROL` (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;







--
-- Table structure for table `PEDIDO`
--

DROP TABLE IF EXISTS `PEDIDO`;

CREATE TABLE `PEDIDO` (
  `ID_PEDIDO` int NOT NULL AUTO_INCREMENT,
  `FECHA` datetime(6) NOT NULL,
  `USUARIO` int NOT NULL,
  `IMPORTE` decimal(5,2) DEFAULT NULL,
  `ENTREGADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  KEY `PEDIDO_USUARIO_795720ed_fk_USUARIO_id` (`USUARIO`),
  CONSTRAINT `PEDIDO_USUARIO_795720ed_fk_USUARIO_id` FOREIGN KEY (`USUARIO`) REFERENCES `USUARIO` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





--
-- Table structure for table `PRODUCTO`
--

DROP TABLE IF EXISTS `PRODUCTO`;

CREATE TABLE `PRODUCTO` (
  `ID_PRODUCTO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) NOT NULL,
  `IMAGEN` varchar(100) NOT NULL,
  `DESCRIPCION` longtext,
  `PRECIO` decimal(5,2) NOT NULL,
  `CATEGORIA` int NOT NULL,
  `DISPONIBILIDAD` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_PRODUCTO`),
  KEY `PRODUCTO_CATEGORIA_22b351f2_fk_CATEGORIA_PRODUCTO_ID_CATEGORIA` (`CATEGORIA`),
  CONSTRAINT `PRODUCTO_CATEGORIA_22b351f2_fk_CATEGORIA_PRODUCTO_ID_CATEGORIA` FOREIGN KEY (`CATEGORIA`) REFERENCES `CATEGORIA_PRODUCTO` (`ID_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






--
-- Table structure for table `FACTURA`
--

DROP TABLE IF EXISTS `FACTURA`;

CREATE TABLE `FACTURA` (
  `id` int NOT NULL AUTO_INCREMENT,
  `IMPORTE` decimal(5,2) DEFAULT NULL,
  `CANTIDAD` int DEFAULT NULL,
  `PEDIDO` int NOT NULL,
  `PRODUCTO` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FACTURA_PEDIDO_PRODUCTO_29263f05_uniq` (`PEDIDO`,`PRODUCTO`),
  KEY `FACTURA_PRODUCTO_16e64ce4_fk_PRODUCTO_ID_PRODUCTO` (`PRODUCTO`),
  CONSTRAINT `FACTURA_PEDIDO_3e8b8229_fk_PEDIDO_ID_PEDIDO` FOREIGN KEY (`PEDIDO`) REFERENCES `PEDIDO` (`ID_PEDIDO`),
  CONSTRAINT `FACTURA_PRODUCTO_16e64ce4_fk_PRODUCTO_ID_PRODUCTO` FOREIGN KEY (`PRODUCTO`) REFERENCES `PRODUCTO` (`ID_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `NOTICIA`
--

DROP TABLE IF EXISTS `NOTICIA`;

CREATE TABLE `NOTICIA` (
  `ID_NOTICIA` int NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(255) NOT NULL,
  `SUBTITULO` varchar(255) NOT NULL,
  `IMAGEN` varchar(100) NOT NULL,
  `CONTENIDO` longtext NOT NULL,
  `CREATED` datetime(6) NOT NULL,
  `CATEGORIA` int NOT NULL,
  `USUARIO` int NOT NULL,
  PRIMARY KEY (`ID_NOTICIA`),
  KEY `NOTICIA_CATEGORIA_78e2f87b_fk_CATEGORIA_ID_CATEGORIA` (`CATEGORIA`),
  KEY `NOTICIA_USUARIO_6c6c806b_fk_USUARIO_id` (`USUARIO`),
  CONSTRAINT `NOTICIA_CATEGORIA_78e2f87b_fk_CATEGORIA_ID_CATEGORIA` FOREIGN KEY (`CATEGORIA`) REFERENCES `CATEGORIA` (`ID_CATEGORIA`),
  CONSTRAINT `NOTICIA_USUARIO_6c6c806b_fk_USUARIO_id` FOREIGN KEY (`USUARIO`) REFERENCES `USUARIO` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;










--
-- Table structure for table `USUARIO_dieta`
--

DROP TABLE IF EXISTS `USUARIO_dieta`;

CREATE TABLE `USUARIO_dieta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `dieta_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `USUARIO_dieta_usuario_id_dieta_id_aff4ef98_uniq` (`usuario_id`,`dieta_id`),
  KEY `USUARIO_dieta_dieta_id_9a852002_fk_DIETA_ID_DIETA` (`dieta_id`),
  CONSTRAINT `USUARIO_dieta_dieta_id_9a852002_fk_DIETA_ID_DIETA` FOREIGN KEY (`dieta_id`) REFERENCES `DIETA` (`ID_DIETA`),
  CONSTRAINT `USUARIO_dieta_usuario_id_ea6e7fb4_fk_USUARIO_id` FOREIGN KEY (`usuario_id`) REFERENCES `USUARIO` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `USUARIO_groups`
--

DROP TABLE IF EXISTS `USUARIO_groups`;

CREATE TABLE `USUARIO_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `USUARIO_groups_usuario_id_group_id_5615d760_uniq` (`usuario_id`,`group_id`),
  KEY `USUARIO_groups_group_id_7fa4dc7d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `USUARIO_groups_group_id_7fa4dc7d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `USUARIO_groups_usuario_id_e5b75340_fk_USUARIO_id` FOREIGN KEY (`usuario_id`) REFERENCES `USUARIO` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `USUARIO_user_permissions`
--

DROP TABLE IF EXISTS `USUARIO_user_permissions`;

CREATE TABLE `USUARIO_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `USUARIO_user_permissions_usuario_id_permission_id_e836d30a_uniq` (`usuario_id`,`permission_id`),
  KEY `USUARIO_user_permiss_permission_id_03a80355_fk_auth_perm` (`permission_id`),
  CONSTRAINT `USUARIO_user_permiss_permission_id_03a80355_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `USUARIO_user_permissions_usuario_id_970eeb7d_fk_USUARIO_id` FOREIGN KEY (`usuario_id`) REFERENCES `USUARIO` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_USUARIO_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_USUARIO_id` FOREIGN KEY (`user_id`) REFERENCES `USUARIO` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



