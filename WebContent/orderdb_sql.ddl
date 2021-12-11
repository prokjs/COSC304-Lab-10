DROP TABLE review;
DROP TABLE shipment;
DROP TABLE productinventory;
DROP TABLE warehouse;
DROP TABLE orderproduct;
DROP TABLE incart;
DROP TABLE product;
DROP TABLE category;
DROP TABLE ordersummary;
DROP TABLE paymentmethod;
DROP TABLE customer;


CREATE TABLE customer (
    customerId          INT IDENTITY,
    firstName           VARCHAR(40),
    lastName            VARCHAR(40),
    email               VARCHAR(50),
    phonenum            VARCHAR(20),
    address             VARCHAR(50),
    city                VARCHAR(40),
    state               VARCHAR(20),
    postalCode          VARCHAR(20),
    country             VARCHAR(40),
    userid              VARCHAR(20),
    password            VARCHAR(30),
    PRIMARY KEY (customerId)
);

CREATE TABLE paymentmethod (
    paymentMethodId     INT IDENTITY,
    paymentType         VARCHAR(20),
    paymentNumber       VARCHAR(30),
    paymentExpiryDate   DATE,
    customerId          INT,
    PRIMARY KEY (paymentMethodId),
    FOREIGN KEY (customerId) REFERENCES customer(customerid)
        ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE ordersummary (
    orderId             INT IDENTITY,
    orderDate           DATETIME,
    totalAmount         DECIMAL(10,2),
    shiptoAddress       VARCHAR(50),
    shiptoCity          VARCHAR(40),
    shiptoState         VARCHAR(20),
    shiptoPostalCode    VARCHAR(20),
    shiptoCountry       VARCHAR(40),
    customerId          INT,
    PRIMARY KEY (orderId),
    FOREIGN KEY (customerId) REFERENCES customer(customerid)
        ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE category (
    categoryId          INT IDENTITY,
    categoryName        VARCHAR(50),    
    PRIMARY KEY (categoryId)
);

CREATE TABLE product (
    productId           INT IDENTITY,
    productName         VARCHAR(40),
    productPrice        DECIMAL(10,2),
    productImageURL     VARCHAR(100),
    productImage        VARBINARY(MAX),
    productDesc         VARCHAR(1000),
    categoryId          INT,
    PRIMARY KEY (productId),
    FOREIGN KEY (categoryId) REFERENCES category(categoryId)
);

CREATE TABLE orderproduct (
    orderId             INT,
    productId           INT,
    quantity            INT,
    price               DECIMAL(10,2),  
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES ordersummary(orderId)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE incart (
    orderId             INT,
    productId           INT,
    quantity            INT,
    price               DECIMAL(10,2),  
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES ordersummary(orderId)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE warehouse (
    warehouseId         INT IDENTITY,
    warehouseName       VARCHAR(30),    
    PRIMARY KEY (warehouseId)
);

CREATE TABLE shipment (
    shipmentId          INT IDENTITY,
    shipmentDate        DATETIME,   
    shipmentDesc        VARCHAR(100),   
    warehouseId         INT, 
    PRIMARY KEY (shipmentId),
    FOREIGN KEY (warehouseId) REFERENCES warehouse(warehouseId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE productinventory ( 
    productId           INT,
    warehouseId         INT,
    quantity            INT,
    price               DECIMAL(10,2),  
    PRIMARY KEY (productId, warehouseId),   
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (warehouseId) REFERENCES warehouse(warehouseId)
        ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE review (
    reviewId            INT IDENTITY,
    reviewRating        INT,
    reviewDate          DATETIME,   
    customerId          INT,
    productId           INT,
    reviewComment       VARCHAR(1000),          
    PRIMARY KEY (reviewId),
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES product(productId)
        ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO category(categoryName) VALUES ('Consoles');
INSERT INTO category(categoryName) VALUES ('Peripherals');
INSERT INTO category(categoryName) VALUES ('Monitors');
INSERT INTO category(categoryName) VALUES ('Computers');
INSERT INTO category(categoryName) VALUES ('General Electronics');


INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Nintendo NES', 1, 'Includes one controller and cable',200.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Nintendo Super NES',1,'Includes one controller, cable and copy of Super Mario',300.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Sega Genesis',1,'12 - Includes one controller and cable',200.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Sony Playstation',1,'Includes two controllers and cable',400.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Playstation Portable',1,'Includes charging cable and copy of Persona 3 Portable',300.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Atari',1,'Includes cable. No controller',150.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Capcom Home Arcade',1,'Includes cable and controller',200.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Nintendo 64',1,'Includes cable. Controller sold separately',170.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Nintendo 64 Controller',2,'Controller for N64',50.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Sega Genesis Controller',2,'Controller for Sega Genesis',50.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Super Nintendo Controller',2,'Controller for Super Nintendo',40.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('AV Cable',2,'4 foot Cable to attach console to TV',40.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Sony Playstation Controller',2,'Controller for Sony Playstation',50.25);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Playstation Portable Charger',2,'2-foot Charger for Playstation Portable',30.50);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('DELL CRT Monitor',3,'800x800 resolution monitor',100.45);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('GATEWAY CRT Monitor',3,'600x600 resolution monitor',89.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Apple Macintosh Quadro 800',4,'50mb harddrive',400.50);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Commodore Amiga 1000',4,'100mb harddrive',300.20);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Vtg IBM PS/2',4,'500mb harddrive. Comes with keyboard',600.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Sony Camcorder',5,'Records HD video',200.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Canon AE-1',5,'35 mm single-lens reflex',150.00);
INSERT product(productName, categoryId, productDesc, productPrice) VALUES ('Atari Portfolio',5,'128 KB of RAM',200.00);

    
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Brad', 'Pitt', 'fightclub@gmail.com', '999-666-1122', '103 Back Street', 'Miami', 'FL', 'R3X 45T', 'USA', 'brad' , 'fight');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Dennis', 'Jones', 'denny.jones@hotmail.ca', '895-367-9011', '222 Red Avenue', 'New York', 'NY', '99999', 'United States', 'denny' , 'jones');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Jim', 'Henry', 'jhen@gmail.com', '999-999-1111', '444 Discovery Crescent', 'San Francisco', 'CA', '23478', 'United States', 'jim' , 'crabs');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Jane', 'Doe', 'JD@hotmail.com', '250-897-2122', '444 Clever Lane', 'Kelowna', 'BC', 'V1V 1V8', 'Canada', 'jane' , 'donkey');
INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES ('Mary', 'Jane', 'janem@uiowa.edu', '985-673-7799', '555 Everwood Road', 'Iowa City', 'IA', '52789', 'United States', 'mary' , 'HelloWorld');


DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (1, '2019-10-15 10:25:55', 91.70)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 1, 1, 18)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 5, 2, 21.35)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 10, 1, 31);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (2, '2019-10-16 18:00:00', 106.75)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 5, 5, 21.35);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (3, '2019-10-15 3:30:22', 140)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 6, 2, 25)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 7, 3, 30);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (2, '2019-10-17 05:45:11', 327.85)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 3, 4, 10)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 8, 3, 40)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 13, 3, 23.25)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 28, 2, 21.05)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 29, 4, 14);

DECLARE @orderId int
INSERT INTO ordersummary (customerId, orderDate, totalAmount) VALUES (5, '2019-10-15 10:25:55', 277.40)
SELECT @orderId = @@IDENTITY
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 5, 4, 21.35)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 19, 2, 81)
INSERT INTO orderproduct (orderId, productId, quantity, price) VALUES (@orderId, 20, 3, 10);