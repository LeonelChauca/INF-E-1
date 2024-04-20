-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 20, 2024 at 06:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdleonel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuentaBancaria`
--

CREATE TABLE `cuentaBancaria` (
  `cbancaria_id` int(11) NOT NULL,
  `numero_cuenta` varchar(100) NOT NULL,
  `saldo` int(11) NOT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cuentaBancaria`
--

INSERT INTO `cuentaBancaria` (`cbancaria_id`, `numero_cuenta`, `saldo`, `persona_id`, `tipo`) VALUES
(1, '123456789', 5000, 1, 'Corriente'),
(2, '987654321', 7500, 2, 'Ahorros'),
(5, '456789012', 2000, 5, 'Corriente'),
(6, '789012345', 6000, 6, 'Ahorros'),
(7, '654321098', 4000, 7, 'Corriente'),
(8, '890123456', 8000, 8, 'Ahorros'),
(9, '234567890', 3500, 9, 'Corriente'),
(10, '012345678', 9000, 10, 'Ahorros'),
(11, '111222333', 4000, 1, 'Depósito a plazo'),
(12, '444555666', 6000, 1, 'Inversión'),
(13, '777888999', 4500, 2, 'Depósito a plazo'),
(14, '999888777', 3000, 2, 'Inversión'),
(19, '333444555', 5200, 5, 'Depósito a plazo'),
(20, '666777888', 6800, 5, 'Inversión'),
(21, '999000111', 4100, 6, 'Depósito a plazo'),
(22, '111000999', 3700, 6, 'Inversión'),
(23, '444555666', 5900, 7, 'Depósito a plazo'),
(24, '777888999', 3600, 7, 'Inversión'),
(25, '000111222', 4900, 8, 'Depósito a plazo'),
(26, '333444555', 4400, 8, 'Inversión'),
(27, '666777888', 6300, 9, 'Depósito a plazo'),
(28, '999000111', 5100, 9, 'Inversión'),
(29, '222333444', 4200, 10, 'Depósito a plazo'),
(30, '555666777', 3200, 10, 'Inversión'),
(31, '11233', 10, 1, 'cuenta corriente'),
(32, '10000', 102, 1, 'cuenta corriente'),
(33, '10101', 200, 1, 'cuenta corriente'),
(34, '123', 5, 1, 'cuenta corriente');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `persona_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ap_paterno` varchar(100) NOT NULL,
  `ap_materno` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`persona_id`, `nombre`, `ap_paterno`, `ap_materno`, `correo`, `tipo`) VALUES
(1, 'leonel', 'Chauca', 'Maydana', 'leonelchauca0@gmail.com', 'Cliente'),
(2, 'Maria', 'Gonzalez', 'Lopez', 'maria2002@example.com', 'Cliente'),
(5, 'Luisito', 'Diaz', 'Jimenez', 'luis@example.com', 'Cliente'),
(6, 'Sofia', 'Garcia', 'Perez', 'sofia@example.com', 'Cliente'),
(7, 'Carlos', 'Sanchez', 'Martinez', 'carlos@example.com', 'Cliente'),
(8, 'Laura', 'Lopez', 'Gutierrez', 'laura@example.com', 'Cliente'),
(9, 'Miguel', 'Torres', 'Dominguez', 'miguel@example.com', 'Cliente'),
(10, 'Elena', 'Fernandez', 'Ruiz', 'elena@example.com', 'Cliente'),
(11, 'leonel', 'chauca', 'maydana', 'leonelchauca0@gmail.com', 'Cliente'),
(13, 'Leonel', 'Chauca', 'Maydana', 'leonelchauca0@gmail.com', 'Cliente'),
(14, 'Leonel', 'Chauca', 'Maydana', 'leonelchauca0@gmail.com', 'Cliente'),
(15, 'Leonel', 'Chauca', 'Maydana', 'leonelchauca0@gmail.com', 'Cliente'),
(16, 'Leonel', 'Chauca', 'Maydana', 'leonelchauca0@gmail.com', 'Cliente'),
(17, 'Leonel', 'Chauca', 'Maydana', 'leonelchauca0@gmail.com', 'Cliente'),
(141, 'Luisito', 'Diaz', 'Jimenez', 'luis@example.com', 'Cliente'),
(142, 'Luisito', 'Diaz', 'Jimenez', 'luis@example.com', 'Cliente'),
(336, 'Maria', 'Gonzalez', 'Lopez', 'maria2002@example.com', 'Cliente'),
(337, 'Maria', 'Gonzalez', 'Lopez', 'maria2002@example.com', 'Cliente'),
(344, 'leonel', 'Perez', 'Gomez', 'juan@gmail.com', 'Cliente'),
(353, 'hola2', 'h2', 'h2', 'h2@gmail.com', 'Cliente'),
(354, 'bob', 'rodriguez', 'barrientos', 'pt@gmail.com', 'Cliente');

--
-- Triggers `persona`
--
DELIMITER $$
CREATE TRIGGER `eliminar_persona` BEFORE DELETE ON `persona` FOR EACH ROW BEGIN
    DELETE FROM cuentaBancaria WHERE persona_id = OLD.persona_id;
    DELETE FROM transaccionBancaria WHERE cuenta_origen=OLD.persona_id;
    DELETE FROM transaccionBancaria WHERE cuenta_destino=OLD.persona_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaccionBancaria`
--

CREATE TABLE `transaccionBancaria` (
  `transaccion_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `monto` int(11) NOT NULL,
  `cuenta_origen` int(11) DEFAULT NULL,
  `cuenta_destino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaccionBancaria`
--

INSERT INTO `transaccionBancaria` (`transaccion_id`, `fecha`, `monto`, `cuenta_origen`, `cuenta_destino`) VALUES
(1, '2024-04-15 14:30:00', 1000, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuentaBancaria`
--
ALTER TABLE `cuentaBancaria`
  ADD PRIMARY KEY (`cbancaria_id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`persona_id`);

--
-- Indexes for table `transaccionBancaria`
--
ALTER TABLE `transaccionBancaria`
  ADD PRIMARY KEY (`transaccion_id`),
  ADD KEY `cuenta_origen` (`cuenta_origen`),
  ADD KEY `cuenta_destino` (`cuenta_destino`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cuentaBancaria`
--
ALTER TABLE `cuentaBancaria`
  MODIFY `cbancaria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `persona_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT for table `transaccionBancaria`
--
ALTER TABLE `transaccionBancaria`
  MODIFY `transaccion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cuentaBancaria`
--
ALTER TABLE `cuentaBancaria`
  ADD CONSTRAINT `cuentabancaria_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`);

--
-- Constraints for table `transaccionBancaria`
--
ALTER TABLE `transaccionBancaria`
  ADD CONSTRAINT `transaccionbancaria_ibfk_1` FOREIGN KEY (`cuenta_origen`) REFERENCES `cuentaBancaria` (`cbancaria_id`),
  ADD CONSTRAINT `transaccionbancaria_ibfk_2` FOREIGN KEY (`cuenta_destino`) REFERENCES `cuentaBancaria` (`cbancaria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
