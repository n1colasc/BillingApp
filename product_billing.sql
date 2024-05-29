SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `fact_detalle` (
  `FDet_ID` int(11) NOT NULL,
  `FDet_Linea` int(11) NOT NULL,
  `FDet_Cantidad` int(11) NOT NULL,
  `zProd_ID` int(11) NOT NULL,
  `zFEnc_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `fact_detalle` (`FDet_ID`, `FDet_Linea`, `FDet_Cantidad`, `zProd_ID`, `zFEnc_ID`) VALUES
(1, 333, 1, 3, 2),
(2, 344, 1, 2, 3),
(4, 332, 2, 3, 4),
(22, 444, 1, 1, 26),
(23, 330, 2, 3, 4),
(24, 344, 1, 4, 3);

CREATE TABLE `fact_encabezado` (
  `FEnc_ID` int(11) NOT NULL,
  `FEnc_Numero` int(11) NOT NULL,
  `FEnc_Fecha` date NOT NULL,
  `zPer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `fact_encabezado` (`FEnc_ID`, `FEnc_Numero`, `FEnc_Fecha`, `zPer_ID`) VALUES
(2, 1, '2024-05-26', 2),
(3, 2, '2024-05-25', 2),
(4, 3, '2024-05-27', 2),
(26, 7, '2024-05-25', 1);
CREATE TABLE `listarpersonaproductomascaro` (
`ID` int(11)
,`Nombre` varchar(100)
,`Apellido` varchar(100)
,`Precio` int(11)
);
CREATE TABLE `listarpersonastotalfacturado` (
`Id` int(11)
,`Nombre` varchar(100)
,`Apellido` varchar(100)
,`Total facturado` decimal(32,0)
);
CREATE TABLE `listarproductomargenganancia` (
`ID` int(11)
,`Descripcion` varchar(250)
,`Margen de ganacia` decimal(22,8)
);
CREATE TABLE `listarproductoscantidadfacturadadesc` (
`ID` int(11)
,`Descripcion` varchar(250)
,`Cantidad facturada` decimal(32,0)
);
CREATE TABLE `listarproductossegunutilidad` (
`ID` int(11)
,`Descripcion` varchar(250)
,`Utilidad generada` decimal(43,0)
);
CREATE TABLE `obtenertodaslasfacturas` (
`FEnc_ID` int(11)
,`FEnc_Numero` int(11)
,`FEnc_Fecha` date
,`zPer_ID` int(11)
,`FDet_ID` int(11)
,`FDet_Linea` int(11)
,`FDet_Cantidad` int(11)
,`zProd_ID` int(11)
,`zFEnc_ID` int(11)
);
CREATE TABLE `obtenertodaslaspersonas` (
`Per_ID` int(11)
,`Per_Nombre` varchar(100)
,`Per_Apellido` varchar(100)
,`Per_TipoDocumento` varchar(10)
,`Per_Documento` int(11)
);
CREATE TABLE `obtenertodoslosproductos` (
`Prod_ID` int(11)
,`Prod_Descripcion` varchar(250)
,`Prod_Precio` int(11)
,`Prod_Costo` int(11)
,`Prod_UM` int(11)
);

CREATE TABLE `persona` (
  `Per_ID` int(11) NOT NULL,
  `Per_Nombre` varchar(100) NOT NULL,
  `Per_Apellido` varchar(100) NOT NULL,
  `Per_TipoDocumento` varchar(10) NOT NULL,
  `Per_Documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `persona` (`Per_ID`, `Per_Nombre`, `Per_Apellido`, `Per_TipoDocumento`, `Per_Documento`) VALUES
(1, 'Nicolás', 'Castiblanco', 'CC', 2024052501),
(2, 'Steven', 'Bohórquez', 'CE', 2024052502);

CREATE TABLE `producto` (
  `Prod_ID` int(11) NOT NULL,
  `Prod_Descripcion` varchar(250) NOT NULL,
  `Prod_Precio` int(11) NOT NULL,
  `Prod_Costo` int(11) NOT NULL,
  `Prod_UM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `producto` (`Prod_ID`, `Prod_Descripcion`, `Prod_Precio`, `Prod_Costo`, `Prod_UM`) VALUES
(3, 'Zapatos verdes', 108000, 98766, 45),
(4, 'Zapatos naranjas', 98500, 66768, 34),
(5, 'Camiseta negra', 30000, 21000, 22),
(6, 'Pantalón rojo', 45500, 32540, 30);
DROP TABLE IF EXISTS `listarpersonaproductomascaro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listarpersonaproductomascaro`  AS SELECT `p`.`Per_ID` AS `ID`, `p`.`Per_Nombre` AS `Nombre`, `p`.`Per_Apellido` AS `Apellido`, `prod`.`Prod_Precio` AS `Precio` FROM (((`persona` `p` left join `fact_encabezado` `fe` on(`p`.`Per_ID` = `fe`.`zPer_ID`)) left join `fact_detalle` `f` on(`fe`.`FEnc_ID` = `f`.`zFEnc_ID`)) left join `producto` `prod` on(`prod`.`Prod_ID` = `f`.`zProd_ID`)) WHERE `prod`.`Prod_Precio` = (select max(`prod`.`Prod_Precio`) from `persona`) GROUP BY `p`.`Per_ID` ;
DROP TABLE IF EXISTS `listarpersonastotalfacturado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listarpersonastotalfacturado`  AS SELECT `p`.`Per_ID` AS `Id`, `p`.`Per_Nombre` AS `Nombre`, `p`.`Per_Apellido` AS `Apellido`, coalesce(sum(`prod`.`Prod_Precio`),0) AS `Total facturado` FROM (((`persona` `p` left join `fact_encabezado` `f` on(`p`.`Per_ID` = `f`.`zPer_ID`)) left join `fact_detalle` `d` on(`f`.`FEnc_ID` = `d`.`zFEnc_ID`)) left join `producto` `prod` on(`prod`.`Prod_ID` = `d`.`zProd_ID`)) GROUP BY `p`.`Per_ID`, `p`.`Per_Nombre` ;
DROP TABLE IF EXISTS `listarproductomargenganancia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listarproductomargenganancia`  AS SELECT `p`.`Prod_ID` AS `ID`, `p`.`Prod_Descripcion` AS `Descripcion`, coalesce(avg((`p`.`Prod_Precio` - `p`.`Prod_Costo`) / `p`.`Prod_Precio` * 100),0) AS `Margen de ganacia` FROM (`producto` `p` left join `fact_detalle` `fd` on(`p`.`Prod_ID` = `fd`.`zProd_ID`)) GROUP BY `p`.`Prod_ID`, `p`.`Prod_Descripcion` ORDER BY 'Margen de ganacia' DESC ;
DROP TABLE IF EXISTS `listarproductoscantidadfacturadadesc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listarproductoscantidadfacturadadesc`  AS SELECT `p`.`Prod_ID` AS `ID`, `p`.`Prod_Descripcion` AS `Descripcion`, coalesce(sum(`fd`.`FDet_Cantidad`),0) AS `Cantidad facturada` FROM (`producto` `p` left join `fact_detalle` `fd` on(`p`.`Prod_ID` = `fd`.`zProd_ID`)) GROUP BY `p`.`Prod_ID` ORDER BY coalesce(sum(`fd`.`FDet_Cantidad`),0) DESC ;
DROP TABLE IF EXISTS `listarproductossegunutilidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listarproductossegunutilidad`  AS SELECT `p`.`Prod_ID` AS `ID`, `p`.`Prod_Descripcion` AS `Descripcion`, coalesce(sum((`p`.`Prod_Precio` - `p`.`Prod_Costo`) * `fd`.`FDet_Cantidad`),0) AS `Utilidad generada` FROM (`producto` `p` left join `fact_detalle` `fd` on(`p`.`Prod_ID` = `fd`.`zProd_ID`)) GROUP BY `p`.`Prod_ID`, `p`.`Prod_Descripcion` ;
DROP TABLE IF EXISTS `obtenertodaslasfacturas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obtenertodaslasfacturas`  AS SELECT `f`.`FEnc_ID` AS `FEnc_ID`, `f`.`FEnc_Numero` AS `FEnc_Numero`, `f`.`FEnc_Fecha` AS `FEnc_Fecha`, `f`.`zPer_ID` AS `zPer_ID`, `d`.`FDet_ID` AS `FDet_ID`, `d`.`FDet_Linea` AS `FDet_Linea`, `d`.`FDet_Cantidad` AS `FDet_Cantidad`, `d`.`zProd_ID` AS `zProd_ID`, `d`.`zFEnc_ID` AS `zFEnc_ID` FROM (`fact_encabezado` `f` left join `fact_detalle` `d` on(`f`.`FEnc_ID` = `d`.`zFEnc_ID`)) GROUP BY `f`.`FEnc_ID`, `d`.`FDet_ID` ;
DROP TABLE IF EXISTS `obtenertodaslaspersonas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obtenertodaslaspersonas`  AS SELECT `persona`.`Per_ID` AS `Per_ID`, `persona`.`Per_Nombre` AS `Per_Nombre`, `persona`.`Per_Apellido` AS `Per_Apellido`, `persona`.`Per_TipoDocumento` AS `Per_TipoDocumento`, `persona`.`Per_Documento` AS `Per_Documento` FROM `persona` ;
DROP TABLE IF EXISTS `obtenertodoslosproductos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obtenertodoslosproductos`  AS SELECT DISTINCT `producto`.`Prod_ID` AS `Prod_ID`, `producto`.`Prod_Descripcion` AS `Prod_Descripcion`, `producto`.`Prod_Precio` AS `Prod_Precio`, `producto`.`Prod_Costo` AS `Prod_Costo`, `producto`.`Prod_UM` AS `Prod_UM` FROM `producto` ;


ALTER TABLE `fact_detalle`
  ADD PRIMARY KEY (`FDet_ID`),
  ADD KEY `zFEnc_ID` (`zFEnc_ID`),
  ADD KEY `zProd_ID` (`zProd_ID`);

ALTER TABLE `fact_encabezado`
  ADD PRIMARY KEY (`FEnc_ID`),
  ADD KEY `zPer_ID` (`zPer_ID`);

ALTER TABLE `persona`
  ADD PRIMARY KEY (`Per_ID`);

ALTER TABLE `producto`
  ADD PRIMARY KEY (`Prod_ID`);


ALTER TABLE `fact_detalle`
  MODIFY `FDet_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

ALTER TABLE `fact_encabezado`
  MODIFY `FEnc_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

ALTER TABLE `persona`
  MODIFY `Per_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `producto`
  MODIFY `Prod_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `fact_detalle`
  ADD CONSTRAINT `fact_encabezado_ibfk_2` FOREIGN KEY (`zFEnc_ID`) REFERENCES `fact_encabezado` (`FEnc_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `fact_encabezado`
  ADD CONSTRAINT `fact_encabezado_ibfk_1` FOREIGN KEY (`zPer_ID`) REFERENCES `persona` (`Per_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
