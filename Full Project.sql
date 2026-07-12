create database Online_Grocery_Delivery_System;
USE Online_Grocery_Delivery_System;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE NOT NULL,
    _Password VARCHAR(100) NOT NULL,
    Registration_Date DATE
);
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Description_ varchar(100)
);
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
	First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Company_Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(200),
    Rating DECIMAL(2,1)
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    PName VARCHAR(100) NOT NULL,
    Description_ varchar(100),
    Price DECIMAL(10,2) NOT NULL,
    Stock_Quantity INT DEFAULT 0,
    Expiry_Date DATE,
    Category_ID INT,
    Supplier_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);
CREATE TABLE Cart (
    Cart_ID INT PRIMARY KEY,
    Customer_ID INT UNIQUE,
    Created_Date DATE,
    Status VARCHAR(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Cart_Items (
    CartItem_ID INT PRIMARY KEY,
    Cart_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2),
    FOREIGN KEY (Cart_ID) REFERENCES Cart(Cart_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    Order_Status VARCHAR(30),
    Payment_Status VARCHAR(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Order_Details (
    OrderDetail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2),
    Sub_Total DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Payment_Method VARCHAR(50),
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Payment_Status VARCHAR(30),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);
CREATE TABLE Delivery_Person (
    Delivery_Person_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(20),
    Vehicle_Number VARCHAR(20),
    Availability_Status VARCHAR(30)
);
CREATE TABLE Delivery (
    Delivery_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE,
    Delivery_Person_ID INT,
    Delivery_Status VARCHAR(30),
    Delivery_Date DATE,
    Delivery_Time TIME,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Delivery_Person_ID) REFERENCES Delivery_Person(Delivery_Person_ID)
);
CREATE TABLE Delivery_Address (
    Address_ID INT PRIMARY KEY,
    Customer_ID INT,
    Street VARCHAR(100),
    Area VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(20),
    Landmark VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Admin (
    Admin_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(100),
    Role VARCHAR(50)
);
CREATE TABLE Review (
    Review_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment varchar(100),
    Review_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
insert into Customer values
(1,'Ali','Khan','03001234567','ali1@gmail.com','pass1','2026-01-01'),
(2,'Ahmed','Raza','03001234568','ali2@gmail.com','pass2','2026-01-02'),
(3,'Usman','Ali','03001234569','ali3@gmail.com','pass3','2026-01-03'),
(4,'Hamza','Tariq','03001234570','ali4@gmail.com','pass4','2026-01-04'),
(5,'Bilal','Aslam','03001234571','ali5@gmail.com','pass5','2026-01-05'),
(6,'Sara','Noor','03001234572','ali6@gmail.com','pass6','2026-01-06'),
(7,'Ayesha','Khan','03001234573','ali7@gmail.com','pass7','2026-01-07'),
(8,'Hina','Iqbal','03001234574','ali8@gmail.com','pass8','2026-01-08'),
(9,'Fatima','Rauf','03001234575','ali9@gmail.com','pass9','2026-01-09'),
(10,'Zain','Ahmed','03001234576','ali10@gmail.com','pass10','2026-01-10'),
(11,'Talha','Usman','03001234577','ali11@gmail.com','pass11','2026-01-11'),
(12,'Saad','Khan','03001234578','ali12@gmail.com','pass12','2026-01-12'),
(13,'Umer','Javed','03001234579','ali13@gmail.com','pass13','2026-01-13'),
(14,'Daniyal','Raza','03001234580','ali14@gmail.com','pass14','2026-01-14'),
(15,'Muneeb','Ali','03001234581','ali15@gmail.com','pass15','2026-01-15'),
(16,'Hassan','Shah','03001234582','ali16@gmail.com','pass16','2026-01-16'),
(17,'Maaz','Iqbal','03001234583','ali17@gmail.com','pass17','2026-01-17'),
(18,'Anaya','Noor','03001234584','ali18@gmail.com','pass18','2026-01-18'),
(19,'Laiba','Khan','03001234585','ali19@gmail.com','pass19','2026-01-19'),
(20,'Areeba','Aslam','03001234586','ali20@gmail.com','pass20','2026-01-20');
insert into Category values
(101,'Beverages','Cold Drinks'),
(102,'Snacks','Chips'),
(103,'Dairy','Milk Products'),
(104,'Bakery','Bread Items'),
(105,'Frozen','Frozen Food'),
(106,'Fruits','Fresh Fruits'),
(107,'Vegetables','Fresh Vegetables'),
(108,'Meat','Chicken and Beef'),
(109,'Seafood','Fish Products'),
(110,'Personal Care','Beauty Products'),
(111,'Cleaning','Cleaning Products'),
(112,'Baby Care','Baby Products'),
(113,'Stationery','Office Items'),
(114,'Electronics','Electronic Items'),
(115,'Tea','Tea Products'),
(116,'Coffee','Coffee Products'),
(117,'Rice','Rice Bags'),
(118,'Spices','Cooking Spices'),
(119,'Biscuits','Sweet Biscuits'),
(120,'Ice Cream','Frozen Desserts');
insert into Supplier values
(201,'Hamza','Ali','Fresh Foods','fresh1@gmail.com','Lahore',4.5),
(202,'Bilal','Khan','Snack House','fresh2@gmail.com','Karachi',4.2),
(203,'Usman','Raza','Milk Pack','fresh3@gmail.com','Lahore',4.1),
(204,'Ali','Ahmed','Bake House','fresh4@gmail.com','Islamabad',4.0),
(205,'Sara','Noor','Frozen Hub','fresh5@gmail.com','Multan',4.3),
(206,'Ayesha','Khan','Fruit Market','fresh6@gmail.com','Faisalabad',4.6),
(207,'Fatima','Ali','Veggie Shop','fresh7@gmail.com','Sialkot',4.4),
(208,'Hassan','Rauf','Meat World','fresh8@gmail.com','Lahore',4.1),
(209,'Saad','Javed','Sea Foods','fresh9@gmail.com','Karachi',4.2),
(210,'Talha','Usman','Care Products','fresh10@gmail.com','Lahore',4.8),
(211,'Zain','Khan','Clean House','fresh11@gmail.com','Multan',4.3),
(212,'Hina','Noor','Baby Shop','fresh12@gmail.com','Islamabad',4.5),
(213,'Laiba','Ali','Stationery Hub','fresh13@gmail.com','Lahore',4.1),
(214,'Maaz','Raza','Electronic World','fresh14@gmail.com','Karachi',4.4),
(215,'Ahmed','Shah','Tea Corner','fresh15@gmail.com','Peshawar',4.2),
(216,'Daniyal','Aslam','Coffee Point','fresh16@gmail.com','Quetta',4.0),
(217,'Muneeb','Khan','Rice Traders','fresh17@gmail.com','Lahore',4.7),
(218,'Anaya','Noor','Spice Market','fresh18@gmail.com','Karachi',4.3),
(219,'Areeba','Ali','Biscuit House','fresh19@gmail.com','Lahore',4.4),
(220,'Umer','Javed','Ice Cream Hub','fresh20@gmail.com','Islamabad',4.5);
insert into Product values
(301,'Pepsi','Cold Drink',250,100,'2026-12-01',101,201),
(302,'Lays','Chips',80,200,'2026-10-01',102,202),
(303,'Milk Pack','Milk',320,50,'2026-06-01',103,203),
(304,'Bread','Fresh Bread',120,70,'2026-05-20',104,204),
(305,'Nuggets','Frozen Nuggets',700,40,'2026-11-01',105,205),
(306,'Apple','Fresh Apple',300,90,'2026-05-15',106,206),
(307,'Tomato','Fresh Tomato',150,100,'2026-05-10',107,207),
(308,'Chicken','Fresh Chicken',900,60,'2026-05-18',108,208),
(309,'Fish','Frozen Fish',1200,30,'2026-09-01',109,209),
(310,'Shampoo','Hair Shampoo',450,80,'2027-01-01',110,210),
(311,'Surf','Washing Powder',550,75,'2027-02-01',111,211),
(312,'Baby Lotion','Lotion',650,35,'2027-03-01',112,212),
(313,'Notebook','Register',120,150,'2028-01-01',113,213),
(314,'Headphones','Bluetooth Headphones',2500,20,'2028-01-01',114,214),
(315,'Lipton','Tea Pack',900,65,'2027-01-01',115,215),
(316,'Nescafe','Coffee Jar',1100,45,'2027-04-01',116,216),
(317,'Basmati Rice','Rice Bag',3500,25,'2027-06-01',117,217),
(318,'Red Chili','Spice Powder',220,100,'2027-05-01',118,218),
(319,'Oreo','Chocolate Biscuit',180,120,'2027-07-01',119,219),
(320,'Walls','Vanilla Ice Cream',600,55,'2026-08-01',120,220);
insert into Cart values
(401,1,'2026-05-01','Active'),
(402,2,'2026-05-02','Active'),
(403,3,'2026-05-03','Active'),
(404,4,'2026-05-04','Inactive'),
(405,5,'2026-05-05','Active'),
(406,6,'2026-05-06','Inactive'),
(407,7,'2026-05-07','Active'),
(408,8,'2026-05-08','Active'),
(409,9,'2026-05-09','Inactive'),
(410,10,'2026-05-10','Active'),
(411,11,'2026-05-11','Active'),
(412,12,'2026-05-12','Inactive'),
(413,13,'2026-05-13','Active'),
(414,14,'2026-05-14','Active'),
(415,15,'2026-05-15','Inactive'),
(416,16,'2026-05-16','Active'),
(417,17,'2026-05-17','Active'),
(418,18,'2026-05-18','Inactive'),
(419,19,'2026-05-19','Active'),
(420,20,'2026-05-20','Active');
insert into Cart_Items values
(501,401,301,2,500),
(502,402,302,1,80),
(503,403,303,3,960),
(504,404,304,2,240),
(505,405,305,1,700),
(506,406,306,5,1500),
(507,407,307,4,600),
(508,408,308,2,1800),
(509,409,309,1,1200),
(510,410,310,3,1350),
(511,411,311,2,1100),
(512,412,312,1,650),
(513,413,313,6,720),
(514,414,314,1,2500),
(515,415,315,2,1800),
(516,416,316,1,1100),
(517,417,317,1,3500),
(518,418,318,4,880),
(519,419,319,3,540),
(520,420,320,2,1200);
insert into Orders values
(601,1,'2026-05-01',500,'Pending','Unpaid'),
(602,2,'2026-05-02',80,'Completed','Paid'),
(603,3,'2026-05-03',960,'Pending','Paid'),
(604,4,'2026-05-04',240,'Delivered','Paid'),
(605,5,'2026-05-05',700,'Pending','Unpaid'),
(606,6,'2026-05-06',1500,'Completed','Paid'),
(607,7,'2026-05-07',600,'Delivered','Paid'),
(608,8,'2026-05-08',1800,'Pending','Unpaid'),
(609,9,'2026-05-09',1200,'Completed','Paid'),
(610,10,'2026-05-10',1350,'Delivered','Paid'),
(611,11,'2026-05-11',1100,'Pending','Unpaid'),
(612,12,'2026-05-12',650,'Completed','Paid'),
(613,13,'2026-05-13',720,'Delivered','Paid'),
(614,14,'2026-05-14',2500,'Pending','Unpaid'),
(615,15,'2026-05-15',1800,'Completed','Paid'),
(616,16,'2026-05-16',1100,'Delivered','Paid'),
(617,17,'2026-05-17',3500,'Pending','Unpaid'),
(618,18,'2026-05-18',880,'Completed','Paid'),
(619,19,'2026-05-19',540,'Delivered','Paid'),
(620,20,'2026-05-20',1200,'Pending','Unpaid');
insert into Order_Details values
(701,601,301,2,250,500),
(702,602,302,1,80,80),
(703,603,303,3,320,960),
(704,604,304,2,120,240),
(705,605,305,1,700,700),
(706,606,306,5,300,1500),
(707,607,307,4,150,600),
(708,608,308,2,900,1800),
(709,609,309,1,1200,1200),
(710,610,310,3,450,1350),
(711,611,311,2,550,1100),
(712,612,312,1,650,650),
(713,613,313,6,120,720),
(714,614,314,1,2500,2500),
(715,615,315,2,900,1800),
(716,616,316,1,1100,1100),
(717,617,317,1,3500,3500),
(718,618,318,4,220,880),
(719,619,319,3,180,540),
(720,620,320,2,600,1200);
insert into Payment values
(801,601,'Cash','2026-05-01',500,'Pending'),
(802,602,'Card','2026-05-02',80,'Paid'),
(803,603,'JazzCash','2026-05-03',960,'Paid'),
(804,604,'Cash','2026-05-04',240,'Paid'),
(805,605,'EasyPaisa','2026-05-05',700,'Pending'),
(806,606,'Card','2026-05-06',1500,'Paid'),
(807,607,'Cash','2026-05-07',600,'Paid'),
(808,608,'JazzCash','2026-05-08',1800,'Pending'),
(809,609,'EasyPaisa','2026-05-09',1200,'Paid'),
(810,610,'Card','2026-05-10',1350,'Paid'),
(811,611,'Cash','2026-05-11',1100,'Pending'),
(812,612,'Card','2026-05-12',650,'Paid'),
(813,613,'JazzCash','2026-05-13',720,'Paid'),
(814,614,'EasyPaisa','2026-05-14',2500,'Pending'),
(815,615,'Card','2026-05-15',1800,'Paid'),
(816,616,'Cash','2026-05-16',1100,'Paid'),
(817,617,'JazzCash','2026-05-17',3500,'Pending'),
(818,618,'Card','2026-05-18',880,'Paid'),
(819,619,'EasyPaisa','2026-05-19',540,'Paid'),
(820,620,'Cash','2026-05-20',1200,'Pending');
insert into Delivery_Person values
(901,'Ali','Khan','03010000001','LEA-101','Available'),
(902,'Ahmed','Raza','03010000002','LEA-102','Busy'),
(903,'Usman','Ali','03010000003','LEA-103','Available'),
(904,'Bilal','Tariq','03010000004','LEA-104','Busy'),
(905,'Hamza','Noor','03010000005','LEA-105','Available'),
(906,'Saad','Ahmed','03010000006','LEA-106','Busy'),
(907,'Hassan','Rauf','03010000007','LEA-107','Available'),
(908,'Talha','Usman','03010000008','LEA-108','Busy'),
(909,'Daniyal','Khan','03010000009','LEA-109','Available'),
(910,'Muneeb','Ali','03010000010','LEA-110','Busy'),
(911,'Ayesha','Noor','03010000011','LEA-111','Available'),
(912,'Sara','Iqbal','03010000012','LEA-112','Busy'),
(913,'Fatima','Shah','03010000013','LEA-113','Available'),
(914,'Hina','Javed','03010000014','LEA-114','Busy'),
(915,'Anaya','Ali','03010000015','LEA-115','Available'),
(916,'Areeba','Raza','03010000016','LEA-116','Busy'),
(917,'Laiba','Khan','03010000017','LEA-117','Available'),
(918,'Maaz','Aslam','03010000018','LEA-118','Busy'),
(919,'Umer','Noor','03010000019','LEA-119','Available'),
(920,'Zain','Ahmed','03010000020','LEA-120','Busy');
insert into Delivery values
(1001,601,901,'Pending','2026-05-01','10:00:00'),
(1002,602,902,'Delivered','2026-05-02','11:00:00'),
(1003,603,903,'Pending','2026-05-03','12:00:00'),
(1004,604,904,'Delivered','2026-05-04','01:00:00'),
(1005,605,905,'On The Way','2026-05-05','02:00:00'),
(1006,606,906,'Delivered','2026-05-06','03:00:00'),
(1007,607,907,'Pending','2026-05-07','04:00:00'),
(1008,608,908,'On The Way','2026-05-08','05:00:00'),
(1009,609,909,'Delivered','2026-05-09','06:00:00'),
(1010,610,910,'Pending','2026-05-10','07:00:00'),
(1011,611,911,'On The Way','2026-05-11','08:00:00'),
(1012,612,912,'Delivered','2026-05-12','09:00:00'),
(1013,613,913,'Pending','2026-05-13','10:00:00'),
(1014,614,914,'On The Way','2026-05-14','11:00:00'),
(1015,615,915,'Delivered','2026-05-15','12:00:00'),
(1016,616,916,'Pending','2026-05-16','01:00:00'),
(1017,617,917,'On The Way','2026-05-17','02:00:00'),
(1018,618,918,'Delivered','2026-05-18','03:00:00'),
(1019,619,919,'Pending','2026-05-19','04:00:00'),
(1020,620,920,'On The Way','2026-05-20','05:00:00');
insert into Delivery_Address values
(1101,1,'Street 1','Johar Town','Lahore','54000','Near UCP'),
(1102,2,'Street 2','Model Town','Lahore','54001','Near Park'),
(1103,3,'Street 3','Gulberg','Lahore','54002','Near Mall'),
(1104,4,'Street 4','DHA','Lahore','54003','Near School'),
(1105,5,'Street 5','Bahria','Lahore','54004','Near Hospital'),
(1106,6,'Street 6','Johar Town','Lahore','54005','Near Market'),
(1107,7,'Street 7','Wapda Town','Lahore','54006','Near Mosque'),
(1108,8,'Street 8','Township','Lahore','54007','Near Bank'),
(1109,9,'Street 9','Iqbal Town','Lahore','54008','Near Plaza'),
(1110,10,'Street 10','Sabzazar','Lahore','54009','Near Stop'),
(1111,11,'Street 11','Canal View','Lahore','54010','Near Restaurant'),
(1112,12,'Street 12','Garden Town','Lahore','54011','Near College'),
(1113,13,'Street 13','Shadman','Lahore','54012','Near Office'),
(1114,14,'Street 14','Gulshan','Karachi','75000','Near Mall'),
(1115,15,'Street 15','North Nazimabad','Karachi','75001','Near School'),
(1116,16,'Street 16','Clifton','Karachi','75002','Near Sea'),
(1117,17,'Street 17','Satellite Town','Rawalpindi','46000','Near Stadium'),
(1118,18,'Street 18','Blue Area','Islamabad','44000','Near Metro'),
(1119,19,'Street 19','Hayatabad','Peshawar','25000','Near Hospital'),
(1120,20,'Street 20','Cantt','Multan','60000','Near Chowk');
insert into Admin values
(1201,'Admin','One','admin1@gmail.com','admin1','Manager'),
(1202,'Admin','Two','admin2@gmail.com','admin2','Supervisor'),
(1203,'Admin','Three','admin3@gmail.com','admin3','Staff'),
(1204,'Admin','Four','admin4@gmail.com','admin4','Manager'),
(1205,'Admin','Five','admin5@gmail.com','admin5','Supervisor'),
(1206,'Admin','Six','admin6@gmail.com','admin6','Staff'),
(1207,'Admin','Seven','admin7@gmail.com','admin7','Manager'),
(1208,'Admin','Eight','admin8@gmail.com','admin8','Supervisor'),
(1209,'Admin','Nine','admin9@gmail.com','admin9','Staff'),
(1210,'Admin','Ten','admin10@gmail.com','admin10','Manager'),
(1211,'Admin','Eleven','admin11@gmail.com','admin11','Supervisor'),
(1212,'Admin','Twelve','admin12@gmail.com','admin12','Staff'),
(1213,'Admin','Thirteen','admin13@gmail.com','admin13','Manager'),
(1214,'Admin','Fourteen','admin14@gmail.com','admin14','Supervisor'),
(1215,'Admin','Fifteen','admin15@gmail.com','admin15','Staff'),
(1216,'Admin','Sixteen','admin16@gmail.com','admin16','Manager'),
(1217,'Admin','Seventeen','admin17@gmail.com','admin17','Supervisor'),
(1218,'Admin','Eighteen','admin18@gmail.com','admin18','Staff'),
(1219,'Admin','Nineteen','admin19@gmail.com','admin19','Manager'),
(1220,'Admin','Twenty','admin20@gmail.com','admin20','Supervisor');
insert into Review values
(1301,1,301,5,'Excellent','2026-05-01'),
(1302,2,302,4,'Very Good','2026-05-02'),
(1303,3,303,5,'Fresh Product','2026-05-03'),
(1304,4,304,3,'Average','2026-05-04'),
(1305,5,305,4,'Good Taste','2026-05-05'),
(1306,6,306,5,'Fresh Fruits','2026-05-06'),
(1307,7,307,4,'Nice Quality','2026-05-07'),
(1308,8,308,5,'Excellent Meat','2026-05-08'),
(1309,9,309,3,'Okay','2026-05-09'),
(1310,10,310,4,'Useful','2026-05-10'),
(1311,11,311,5,'Best Product','2026-05-11'),
(1312,12,312,4,'Nice','2026-05-12'),
(1313,13,313,5,'Good Notebook','2026-05-13'),
(1314,14,314,5,'Amazing Sound','2026-05-14'),
(1315,15,315,4,'Good Tea','2026-05-15'),
(1316,16,316,5,'Excellent Coffee','2026-05-16'),
(1317,17,317,5,'Premium Rice','2026-05-17'),
(1318,18,318,4,'Spicy','2026-05-18'),
(1319,19,319,5,'Tasty','2026-05-19'),
(1320,20,320,4,'Creamy Ice Cream','2026-05-20');

update Customer
set Phone = '03112223333'
where Customer_ID = 1;

update Product
set Price = 275
where Product_ID = 301;

update Orders
set Order_Status = 'Delivered'
where Order_ID = 601;

update Supplier
set Rating = 4.9
where Supplier_ID = 201;

update Delivery_Person
set Availability_Status = 'Busy'
where Delivery_Person_ID = 901;

delete from Review
where Review_ID = 1320;

delete from Cart_Items
where CartItem_ID = 520;

delete from Payment
where Payment_ID = 820;

delete from Delivery
where Delivery_ID = 1020;

delete from Delivery_Address
where Address_ID = 1120;

SELECT * FROM Customer;

SELECT * FROM Product
WHERE Price > 500;

SELECT * FROM Orders
WHERE Order_Status = 'Pending';

SELECT * FROM Supplier
WHERE Rating >= 4.5;

SELECT * FROM Delivery
WHERE Delivery_Status = 'Delivered';

select * from Product
order by Price desc;

select * from Customer
order by First_Name asc;

select * from Orders
order by Total_Amount desc;

select * from Supplier
order by Rating desc;

select * from Review
order by Rating desc;

select count(*) as Total_Customers
from Customer;

select avg(Price) as Average_Product_Price
from Product;

select max(Total_Amount) as Highest_Order
from Orders;

select min(Price) as Lowest_Product_Price
from Product;

select sum(Total_Amount) as Total_Sales
from Orders;

select Customer.First_Name, Orders.Order_ID
from Customer
inner join Orders
on Customer.Customer_ID = Orders.Customer_ID;

select Product.PName, Category.Category_Name
from Product
inner join Category
on Product.Category_ID = Category.Category_ID;

select Product.PName, Supplier.Company_Name
from Product
inner join Supplier
on Product.Supplier_ID = Supplier.Supplier_ID;

select Orders.Order_ID, Payment.Amount
from Orders
inner join Payment
on Orders.Order_ID = Payment.Order_ID;

select Delivery.Delivery_ID, Delivery_Person.First_Name
from Delivery
inner join Delivery_Person
on Delivery.Delivery_Person_ID = Delivery_Person.Delivery_Person_ID;

select * from Customer
where First_Name like 'A%';

select * from Product
where PName like '%a%';

select * from Supplier
where Company_Name like '%House%';

select * from Category
where Category_Name like 'B%';

select * from Admin
where Email like '%gmail.com';

select * from Product
where Price between 100 AND 1000;

select * from Orders
where Total_Amount between 500 AND 2000;

select * from Review
where Rating between 4 AND 5;

select * from Supplier
where Rating between 4.0 AND 5.0;

select * from Product
where Stock_Quantity between 20 AND 100;

select * from Product
where Category_ID in (101,102,103);

select * from Orders
where Order_Status in ('Pending','Delivered');

select * from Payment
where Payment_Method in ('Cash','Card');

select * from Review
where Rating in (4,5);
-- Phase 03 --
-- Aggregate Functions --
-- Count --
SELECT COUNT(*) AS Total_Customers
FROM Customer;

SELECT COUNT(*) AS Total_Products
FROM Product;

-- SUM --
SELECT SUM(Total_Amount) AS Total_Sales
FROM Orders;

SELECT SUM(Amount) AS Total_Payments
FROM Payment;

-- AVG() --
SELECT AVG(Price) AS Average_Product_Price
FROM Product;

SELECT AVG(Total_Amount) AS Average_Order_Amount
FROM Orders;

-- Max --
SELECT MAX(Price) AS Highest_Product_Price
FROM Product;

SELECT MAX(Total_Amount) AS Highest_Order_Amount
FROM Orders;

-- Min --
SELECT MIN(Total_Amount) AS Lowest_Order_Amount
FROM Orders;

SELECT MIN(Stock_Quantity) AS Lowest_Stock
FROM Product;

-- GroupBy Queries --
SELECT Category_ID, COUNT(*) AS Total_Products
FROM Product
GROUP BY Category_ID;

SELECT Customer_ID, SUM(Total_Amount) AS Total_Spent
FROM Orders
GROUP BY Customer_ID;

SELECT Rating, COUNT(*) AS Total_Suppliers
FROM Supplier
GROUP BY Rating;

SELECT Payment_Method, SUM(Amount) AS Total_Amount
FROM Payment
GROUP BY Payment_Method;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID;

SELECT Customer_ID, SUM(Total_Amount) AS Total_Spent
FROM Orders
GROUP BY Customer_ID
HAVING SUM(Total_Amount) > 1000;

-- SubQuery
SELECT *
FROM Product
WHERE Price >
(
    SELECT AVG(Price)
    FROM Product
);

SELECT *
FROM Product
WHERE Price =
(
    SELECT MAX(Price)
    FROM Product
);

SELECT *
FROM Customer
WHERE Customer_ID IN
(
    SELECT Customer_ID
    FROM Orders
);

SELECT *
FROM Orders
WHERE Total_Amount >
(
    SELECT AVG(Total_Amount)
    FROM Orders
);

-- Corelated Queries
SELECT *
FROM Orders o1
WHERE Total_Amount >
(
    SELECT AVG(Total_Amount)
    FROM Orders o2
    WHERE o1.Customer_ID = o2.Customer_ID
);

SELECT *
FROM Product p1
WHERE Price >
(
    SELECT AVG(Price)
    FROM Product p2
    WHERE p1.Category_ID = p2.Category_ID
);

