CREATE DATABASE SistemaDeFacturacion;

USE SistemaDeFacturacion;

CREATE TABLE Categoria(
	idCategoria int IDENTITY PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	descripcion varchar(60) NOT NULL
)

CREATE TABLE Proveedor(
	idProveedor varchar(15) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	direccion varchar(60) NOT NULL,
	empresa varchar(30) NOT NULL
)

CREATE TABLE Empleado(
	idEmpleado varchar(15) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	telefono varchar(15) NOT NULL,
	edad int NOT NULL,
	direccion varchar(60) NOT NULL
)
CREATE TABLE Cliente(
	Cedula varchar(15) PRIMARY KEY,
	nombre varchar(50) NOT NULL,
	telefono varchar(15) NOT NULL,
	direccion varchar(60) NOT NULL
)

CREATE TABLE Producto(
	idProducto varchar(15) PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	peso float NOT NULL,
	color varchar(20) NOT NULL,
	marca varchar(20) NOT NULL,
	imgEmpresa varchar(800) NOT NULL,
	valor float NOT NULL,
	existencia bit,
	idCategoria int,
	FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
)
CREATE TABLE FacturaVenta(
	idFactura varchar(15) PRIMARY KEY,
	fecha DATETIME NOT NULL,
	total float,
	subTotal float,
	iva float,
	idEmpleado varchar(15),
	cedula_C varchar(15),
	FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
	FOREIGN KEY (cedula_C) REFERENCES Cliente(Cedula)
)
CREATE TABLE FacturaCompra(
	idFactura varchar(15) PRIMARY KEY,
	fecha DATETIME NOT NULL,
	total float,
	subTotal float,
	iva float,
	idEmpleado varchar(15),
	idProveedor varchar(15),
	FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
	FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
)
CREATE TABLE Producto_FacturaV(
	cantidad int NOT NULL,
	valorTotal float,
	idProducto varchar(15),
	idFactura varchar(15),
	FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
	FOREIGN KEY (idFactura) REFERENCES FacturaVenta(idFactura),
	PRIMARY KEY (idProducto,idFactura)
)
CREATE TABLE Producto_FacturaC(
	cantidad int NOT NULL,
	costo float NOT NULL,
	valorTotal float,
	idProducto varchar(15),
	idFactura varchar(15),
	FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
	FOREIGN KEY (idFactura) REFERENCES FacturaCompra(idFactura),
	PRIMARY KEY (idProducto,idFactura)
)

CREATE TABLE Telefono(
	idTelefono int IDENTITY PRIMARY KEY,
	NoTelefono varchar(15) NOT NULL,
	idProveedor varchar(15),
	FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor),
)

INSERT INTO Cliente (cedula, nombre, telefono, direccion) VALUES ('1092875432', 'Kelly', '3445994837', 'B/El bosque Mz1 #3'),
('1094878151', 'Jeyson', '3214596515', 'B/Arenales Calle 50'),
('1094787515', 'Andres', '3445994837', 'B/Pinares Mz34 #5'),
('1009554877', 'Felipe', '3147871230', 'B/Las Acasias Mz4 #12'),
('1055999658', 'Adriana', '3114568234', 'B/Mercedes Centro #23'),
('1090654125', 'Melissa', '3221458654', 'B/Las Americas MZ34 #45'),
('1091548566', 'Jeniffer', '3654578534', 'B/El bosque Mz45 #13'),
('1094585621', 'Daniela', '3148785965', 'B/Simon Bolivar Mz34 #4'),
('1092565896', 'Andrea', '3236547892', 'B/Ezperanza Mz32 #5'),
('1091458626', 'Jose', '3214569521', 'B/Castilla Mz34 #7');

INSERT INTO Proveedor(idProveedor, nombre, direccion, empresa) VALUES ('248963', 'Andrea', 'Av. Bolivar 10N #45', 'Gourmet'),
('248964', 'Felipe', 'Av. Centenario, ConJ EntreVerdes', 'Alkeria'),
('248968', 'Jeyson', 'ALto del Rio, ConJ Vistas', 'Coca Cola'),
('248966', 'Camilo', 'Via Valle, ConJ Caimo', 'Postobon'),
('248962', 'Arle', 'Via Caimo, ConJ lasPalmas', 'Aplle'),
('248969', 'Edwin', 'Puerto Espejo, ConJ losAlpes', 'Alpina'),
('248961', 'Luisa', 'Oro Negro, ConJ elNegro', 'Samsung'),
('248967', 'Liliana', 'Circasia, ConJ Altura', 'Redmin EU'),
('248965', 'Wilber', 'Filandia, ConJ Encanto', 'Nestle'),
('248956', 'Jorge', 'Armenia Centro, Edf Bahia Plaza', 'Coca Cola');

INSERT INTO Empleado(idEmpleado, nombre, telefono, edad, direccion) VALUES ('68957581', 'Miguel', '3445994837', 23, 'B/El bosque Mz1 #3'),
('28957582', 'Juan', '3214596854', 30, 'B/El bosque Mz2 #44'),
('38957583', 'Carlos', '3148785966', 50, 'B/Arenales Mz1 #55'),
('48957584', 'Luis', '3224805696', 18, 'B/Pinares Mz14 #34'),
('58957585', 'Maria', '3214587653', 44, 'B/Simon Bolivar Mz4 #44'),
('68957586', 'Kelly', '3025486595', 32, 'B/Mercedes Mz13 #33'),
('78957587', 'Mariana', '3005478962', 28, 'B/El Palcer Mz16 #36'),
('83895758', 'Valentina', '3224589621', 25, 'B/El Jordan Mz22 #3'),
('98957589', 'Nicol', '3254789615', 26, 'B/Pequin Mz1 #53'),
('01957501', 'Dayana', '3265847514', 24, 'B/CañasGordas Mz44 #23'),
('02957502', 'Gerardo', '3214578962', 27, 'B/Galan Mz41 #36'),
('03957503', 'Fernando', '3245698714', 35, 'B/Fundadores Mz1 #3'),
('04957504', 'Angel', '3236584712', 22, 'B/Pinares Mz13 #33'),
('05957505', 'Hector', '3214589626', 20, 'B/Guaduales Mz3 #5'),
('06957506', 'Julian', '3214785966', 19, 'B/la Isabela Mz5 #10');

INSERT INTO Categoria(nombre, descripcion) VALUES ('Frutas', 'En esta categoria veras las frutas'),
('Granos', 'En esta categoria veras los granos'),
('Lacteos', 'En esta categoria veras los lacteos'),
('Electrodomesticos', 'En esta categoria veras los electrodomesticos'),
('Vestuario', 'En esta categoria veras los vestuarios');

INSERT INTO Producto(idProducto, nombre, peso, color, marca, imgEmpresa, valor, existencia, idCategoria) VALUES 
('2451', 'Mango', 300, 'Amarillo', 'Farmest', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Mango_-_single.jpg/1200px-Mango_-_single.jpg', 3000, 1, 1),
('2453', 'Fresa', 56, 'Rojo', 'Farmest', 'https://www.fresasnm.com/wp-content/uploads/2020/10/fresas-nuevos-materiales-variedad-fresa-primoris-a-1024x640.jpg', 500, 1, 1),
('2455', 'Pera', 200, 'Verde', 'Farmest', 'https://static9.depositphotos.com/1642482/1148/i/600/depositphotos_11489464-stock-photo-pears.jpg', 900, 1, 1),
('2457', 'Banano', 100, 'Amarillo', 'Farmest', 'https://cdn.shopify.com/s/files/1/0492/2458/1274/products/76b6170a-f1e1-4a92-8622-cee94a659b91_512x512.png?v=1622197616', 600, 1, 1),
('2456', 'Manzana', 200, 'Rojo', 'Farmest', 'https://www.recetasnestlecam.com/sites/default/files/2022-04/tipos-de-manzana-royal-gala.jpg', 2500, 1, 1),
('2454', 'Mani', 75, 'Amarillo', 'Farmest', 'https://snacknomad.com/wp-content/uploads/2017/12/iStock-118429152-1300x836-1024x659.jpg', 11450, 1, 2),
('2452', 'Frijoles', 310, 'Cafe oscuro', 'Farmest', 'https://www.elespectador.com/resizer/7YJPtAIPF3LQTdzqCf0Jw80yI2Q=/525x0/filters:quality(60):format(jpeg)/cloudfront-us-east-1.images.arcpublishing.com/elespectador/6M7TYAUDEFG2TDP2H2RXGBU3HM.jpg', 7000, 1, 2),
('2458', 'Lentejas', 250, 'Cafe claro', 'Farmest', 'https://www.antojoentucocina.com/wp-content/uploads/2020/09/lentejas-1.jpg', 4290, 1, 2),
('2459', 'Guisante', 160, 'Verde', 'Farmest', 'https://static4.abc.es/media/bienestar/2020/06/02/guisantes-ficha-kkEC--1200x630@abc.jpg', 1700, 1, 2),
('24510', 'Garbanzos', 570, 'Piel', 'Farmest', 'https://s2.ppllstatics.com/diariovasco/www/multimedia/201905/17/media/cortadas/garbanzos-kQuB-U80230759096F0G-624x385@Diario%20Vasco.jpg', 1160, 1, 2),
('24511', 'Leche entera', 1030, 'Blanco', 'Colanta', 'https://cdn.shopify.com/s/files/1/0492/2458/1274/products/supermercados_la_vaquita_supervaquita_leche_colanta_200c_entera_tetra_lacteos_leches_1024x1024.jpg?v=1620487404', 6600, 1, 3),
('24512', 'Queso', 500, 'Blanco', 'Colanta', 'https://jumbocolombiaio.vtexassets.com/arquivos/ids/202904/7702129015400-20-281-29.jpg?v=637814193061470000', 15000, 1, 3),
('24513', 'Bolsa de Yogurt', 1200, 'Naranja', 'Colanta', 'https://i0.wp.com/mercaenlinea.nyc3.digitaloceanspaces.com/2019/10/colanta_yagur_surtido_x6.jpg?fit=600%2C600&ssl=1', 5400, 1, 3),
('24514', 'Leche condensada', 600, 'Blanco', 'Colanta', 'https://vaquitaexpress.com.co/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/7/7/7702024964124.jpg', 2000, 1, 3),
('24515', 'Natilla', 300, 'Cafe claro', 'Colanta', 'https://www.delaabuelaconamor.com/wp-content/uploads/2022/08/natilla-Abuela-tradicional-300g-19-agosto-2022-v1.jpg', 8000, 1, 3),
('24516', 'Horno', 25000, 'Negro', 'Beko', 'https://img.freepik.com/vector-gratis/horno-microondas-luz-interior-aislado-sobre-fondo-blanco-electrodomesticos-cocina_134830-658.jpg', 1000000, 1, 4),
('24517', 'Lavadora', 64000, 'Blanca', 'LG', 'https://jumbocolombiaio.vtexassets.com/arquivos/ids/349553-800-800?v=637845219754470000&width=800&height=800&aspect=true', 1500000, 1, 4),
('24518', 'Nevera', 132900, 'Gris', 'Samsung', 'https://st.depositphotos.com/1765561/1966/i/600/depositphotos_19669021-stock-photo-modern-refrigerator.jpg', 4300000, 1, 4),
('24519', 'Secadora', 30500, 'Azul', 'Whirlpool', 'https://falabella.scene7.com/is/image/FalabellaCO/3916729?wid=544&hei=544&qlt=70&anchor=750,750&crop=0,0,0,0', 3800000, 1, 4),
('24520', 'Campana Extractora', 5850, 'Gris', 'Challenger', 'https://socoda.vtexassets.com/arquivos/ids/176672/campana-extractora-socoda-min.jpg?v=638114706655800000', 3000000, 1, 4),
('24521', 'Camiseta', 300, 'Blanca', 'Gucci', 'https://cdn-images.farfetch-contents.com/12/14/71/57/12147157_10105325_1000.jpg', 504600, 1, 5),
('24522', 'Jeans ', 300, 'Azul', 'Versace', 'https://www.versace.com/dw/image/v2/ABAO_PRD/on/demandware.static/-/Sites-ver-master-catalog/default/dwad786255/original/90_E73GAB5S7-EDW042D13_E904_10_V-EmblemJeans-Pants-versace-online-store_0_2.jpg?sw=748&sh=1050&sm=fit', 1337200, 1, 5),
('24523', 'Tenis', 300, 'Rojo', 'Jordan', 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRmBEBf8TLoWCIzbnUPckpNDMZ8Yprd6CCv_0j7uJ36t7nUnk359ErxyD5uRoRArctFQ5DiBn_yDog&usqp=CAc', 3799739, 1, 5),
('24524', 'Gorra', 300, 'Blanca', 'Adidas', 'https://prochampions.vtexassets.com/arquivos/ids/394152-800-800?v=637617425475800000&width=800&height=800&aspect=true', 79950, 1, 5),
('24525', 'Saco', 300, 'Negro', 'Versace', 'https://www.versace.com/dw/image/v2/ABAO_PRD/on/demandware.static/-/Sites-ver-master-catalog/default/dw8c3efab3/original/90_1006352-1A04317_1B000_10_FormalWoolBlazer-BlazersandSuits-versace-online-store_0_0.jpg?sw=850&sh=1200&sm=fit', 10596300, 1, 5);

--Cliente1
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('211', '2021-12-25 13:26:27.000', '28957582', '1092875432')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (2, '2456', '211'),
(5,'24514', '211'),
(1,'24515', '211'),
(10,'24511', '211');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('212', '2021-12-26 13:46:65.000', '38957583', '1092875432')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (1, '24525', '212'),
(2,'24521', '212'),
(1,'24520', '212'),
(2,'24524', '212');

--Cliente2
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('221', '2022-12-25 13:26:27.000', '28957582', '1094878151')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (10, '2455', '221'),
(2,'2454', '221'),
(5,'2459', '221'),
(3,'24512', '221');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('222', '2022-12-20 13:26:27.000', '38957583', '1094878151')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (1, '24516', '222'),
(2,'24518', '222'),
(10,'24515', '222'),
(1,'24519', '222');

--Cliente3
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('231', '2023-12-25 13:26:27.000', '28957582', '1094787515')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (15, '2451', '231'),
(2,'2453', '231'),
(2,'2456', '231'),
(3,'2452', '231');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('232', '2023-04-25 13:26:27.000', '38957583', '1094787515')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (1, '24521', '232'),
(2,'24523', '232'),
(1,'24524', '232'),
(1,'24525', '232');

--Cliente4
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('241', '2024-11-25 13:26:27.000', '28957582', '1009554877')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (20, '2457', '241'),
(1,'24510', '241'),
(2,'24513', '241'),
(1,'2454', '241');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('242', '2024-01-25 13:26:27.000', '38957583', '1009554877')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (1, '24516', '242'),
(1,'24519', '242'),
(1,'24518', '242'),
(1,'24517', '242');

--Cliente5
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('251', '2023-05-25 13:26:27.000', '28957582', '1055999658')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (2, '24513', '251'),
(3,'24515', '251'),
(1,'24512', '251'),
(3,'2452', '251');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('252', '2023-04-25 13:26:27.000', '38957583', '1055999658')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (1, '24523', '252'),
(2,'24522', '252'),
(1,'24521', '252'),
(1,'24520', '252');

--Cliente6
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('261', '2021-01-25 13:26:27.000', '28957582', '1090654125')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (2,'2456', '261'),
(5,'2451', '261'),
(4,'2454', '261'),
(1,'2459', '261');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('262', '2021-02-25 13:26:27.000', '38957583', '1092875432')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (2, '24521', '262'),
(1, '24524', '262'),
(2, '24525', '262'),
(1, '24523', '262');

--Cliente7
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('271', '2021-03-25 13:26:27.000', '28957582', '1091548566')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (12, '2453', '271'),
(5, '2456', '271'),
(1, '2455', '271'),
(1, '24515', '271');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('272', '2021-04-25 13:26:27.000', '38957583', '1092875432')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (1,'24519', '272'),
(2, '24523', '272'),
(1, '24516', '272'),
(3, '24524', '272');

--Cliente8
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('281', '2021-08-25 13:26:27.000', '28957582', '1094585621')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (3, '2457', '281'),
(2, '2451', '281'),
(5, '2453', '281'),
(1, '2454', '281');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('282', '2021-10-25 13:26:27.000', '38957583', '1092875432')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (2, '24515', '282'),
(5, '2454', '282'),
(2, '2459', '282'),
(2, '2456', '282');

--Cliente9
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('291', '2021-12-11 13:26:27.000', '28957582', '1092565896')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (2, '24510', '291'),
(1, '24521', '291'),
(2, '24522', '291'),
(1, '24525', '291');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('292', '2021-01-20 13:26:27.000', '38957583', '1092875432')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (1, '24518', '292'),
(10, '24514', '292'),
(2, '2456', '292'),
(2, '24511', '292');

--Cliente10
INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('301', '2021-06-14 13:26:27.000', '28957582', '1091458626')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (10, '2456', '301'),
(2, '24513', '301'),
(3, '2458', '301'),
(1, '2452', '301');

INSERT INTO FacturaVenta(idFactura, fecha, idEmpleado, cedula_C) VALUES ('302', '2021-01-31 13:26:27.000', '38957583', '1092875432')
INSERT INTO Producto_FacturaV(cantidad, idProducto, idFactura) VALUES (2, '24511', '302'),
(4,'24521', '302'),
(1,'24517', '302'),
(1,'24524', '302');

--Provedor1
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('516', '2021-10-12 08:20:27.000', 124950, 105000, 19, '01957501', '248963')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (30, 2000, 60000, '2451', '516'),
(30, 1500, 45000, '2456', '516');

--Provedor2
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('526', '2021-10-27 08:30:57.000', 59500, 50000, 19, '02957502', '248964')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (100, 250, 25000, '2453', '526'),
(50, 500, 25000, '2455', '526');

--Provedor3
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('536', '2021-11-10 09:05:08.000', 74970, 63000, 19, '03957503', '248968')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (60, 300, 18000, '2457', '536'),
(30, 1500, 45000, '2456', '536');

--Provedor4
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('546', '2021-11-25 06:46:34.000', 321300, 270000, 19, '04957504', '248966')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (30, 4000, 120000, '24511', '546'),
(15, 10000, 150000, '24512', '546');

--Provedor5
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('556', '2021-12-05 12:01:29.000', 184450, 155000, 19, '05957505', '248962')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (25, 4000, 100000, '24513', '556'),
(50, 1100, 55000, '24514', '556');

--Provedor6
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('566', '2021-12-22 10:50:01.000', 321300, 270000, 19, '06957506', '248969')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (30, 5000, 150000, '24515', '566'),
(30, 4000, 120000, '24511', '566');

--Provedor7
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('576', '2022-01-03 14:45:19.000', 120190, 101000, 19, '01957501', '248961')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (10, 8000, 80000, '2454', '576'),
(30, 700, 21000, '24510', '576');

--Provedor8
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('586', '2022-01-10 09:03:43.000', 243950, 205000, 19, '02957502', '248967')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (45, 4000, 180000, '2452', '586'),
(50, 2500, 125000, '2458', '586');

--Provedor9
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('596', '2022-01-24 11:00:27.000', 4521405, 3799500, 19, '03957503', '248965')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (3, 1000000, 3000000, '24517', '596'),
(10, 79950, 799500, '24524', '596');

--Provedor10
INSERT INTO FacturaCompra(idFactura, fecha, total, subTotal, iva, idEmpleado, idProveedor) VALUES ('606', '2022-01-30 16:10:56.000', 21355740, 17946000, 19, '04957504', '248956')
INSERT INTO Producto_FacturaC(cantidad, costo, valorTotal, idProducto, idFactura) VALUES (10, 504600, 5046000, '24521', '606'),
(3, 4300000, 12900000, '24518', '606');