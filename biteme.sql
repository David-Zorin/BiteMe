-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biteme
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `City` varchar(15) NOT NULL,
  `Branch` enum('North','Center','South') NOT NULL,
  PRIMARY KEY (`City`,`Branch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('Arad','South'),('Ashdod','South'),('Bat Yam','Center'),('Beer Sheva','South'),('Dimona','South'),('Eilat','South'),('Gadera','South'),('Gan Yavne','South'),('Givatayim','Center'),('Haifa','North'),('Herzliya','Center'),('Holon','Center'),('Karmiel','North'),('Kiryat Ata','North'),('Kiryat Bialik','North'),('Kiryat Haim','North'),('Kiryat Malachi','South'),('Kiryat Motzkin','North'),('Kiryat Tivon','North'),('Kiryat Yam','North'),('Misgav','North'),('Nahariya','North'),('Netanya','Center'),('Netivot','South'),('Ofakim','South'),('Petah Tikvah','Center'),('Ramat Gan','Center'),('Ramat Yishay','North'),('Rishon LeTsiyon','Center'),('Sderot','South'),('Tel Aviv','Center'),('Yokneam','North');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `ID` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `MonthlyBudget` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Apple',3000),(2,'Intel',2500),(3,'Microsoft',2850),(4,'Amazon',2780),(5,'Nvidia',2900),(6,'Alphabet',2930);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Username` varchar(15) NOT NULL,
  `ID` varchar(45) NOT NULL,
  `Type` enum('Private','Business') NOT NULL,
  `CompanyID` int DEFAULT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `HomeBranch` enum('North','Center','South') NOT NULL,
  `Credit` varchar(16) DEFAULT NULL,
  `CVV` varchar(3) DEFAULT NULL,
  `ValidDate` date DEFAULT NULL,
  `WalletBalance` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `CompanyID_idx` (`CompanyID`),
  CONSTRAINT `CompanyID1` FOREIGN KEY (`CompanyID`) REFERENCES `companies` (`ID`),
  CONSTRAINT `Username1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('Customer01','557138427','Business',3,'Yossi','Biton','yossi.biton@microsoft.com','0554272299','Center',NULL,NULL,NULL,2850),('Customer02','306750801','Business',4,'Moshe','Peretz','moshe.peretz@amazon.com','0539374151','South',NULL,NULL,NULL,2780),('Customer03','444242372','Private',NULL,'Rivka','Mizrahi','rivka.mizrahi@walla.com','0532704990','South','8143601717525888','363','2028-08-01',0),('Customer04','520463136','Private',NULL,'Moshe','Azoulay','moshe.azoulay@gmail.com','0583343893','South','0474167200319723','539','2024-12-01',0),('Customer05','635824636','Business',6,'David','Levi','david.levi@alphabet.com','0565546738','South',NULL,NULL,NULL,2930),('Customer06','768209461','Business',3,'Rivka','Levi','rivka.levi@microsoft.com','0579220881','Center',NULL,NULL,NULL,2850),('Customer07','962034036','Private',NULL,'Rivka','Biton','rivka.biton@gmail.com','0531578164','North','8899453704162861','015','2027-11-01',0),('Customer08','444327147','Private',NULL,'David','Mizrahi','david.mizrahi@yahoo.com','0519726249','Center','7566010423083659','120','2024-04-01',0),('Customer09','131007931','Private',NULL,'Oren','Cohen','oren.cohen@yahoo.com','0553960378','North','0781932653284075','653','2026-08-01',0),('Customer10','970133816','Private',NULL,'David','Azoulay','david.azoulay@walla.com','0569750879','North','4515943961873040','494','2030-04-01',0),('Customer11','327655509','Private',NULL,'Yossi','Biton','yossi.biton@yahoo.com','0562113172','North','2462878944354014','322','2026-07-01',0),('Customer12','723215237','Business',4,'Yael','Ohana','yael.ohana@amazon.com','0564201683','South',NULL,NULL,NULL,2780),('Customer13','622376411','Business',5,'David','Peretz','david.peretz@nvidia.com','0587001893','North',NULL,NULL,NULL,2900),('Customer14','952655813','Business',6,'Oren','Cohen','oren.cohen@alphabet.com','0583971096','South',NULL,NULL,NULL,2930),('Customer15','806826944','Business',3,'Yael','Peretz','yael.peretz@microsoft.com','0535822088','Center',NULL,NULL,NULL,2850),('Customer16','468136505','Private',NULL,'Rivka','Dahan','rivka.dahan@yahoo.com','0504704917','Center','5152534445898679','792','2027-11-01',0),('Customer17','510051351','Private',NULL,'Rivka','Shalom','rivka.shalom@gmail.com','0558119040','Center','3614788266193789','293','2025-06-01',0),('Customer18','500493076','Private',NULL,'Eli','Cohen','eli.cohen@yahoo.com','0522810046','South','5009416415482176','355','2025-08-01',0),('Customer19','954807658','Private',NULL,'Avi','Dahan','avi.dahan@yahoo.com','0552108540','South','1884736808215459','728','2030-10-01',0),('Customer20','748043252','Business',1,'Yael','Ohana','yael.ohana@apple.com','0508179647','Center',NULL,NULL,NULL,3000),('Customer21','995398506','Private',NULL,'Moshe','Azoulay','moshe.azoulay@walla.com','0543362702','Center','2427992025942041','079','2026-07-01',0),('Customer22','743523654','Private',NULL,'Noa','Azoulay','noa.azoulay@walla.com','0502168113','Center','0891262169553539','157','2029-11-01',0),('Customer23','225244782','Business',4,'Rivka','Biton','rivka.biton@amazon.com','0501004980','South',NULL,NULL,NULL,2780),('Customer24','592186166','Private',NULL,'Rivka','Levi','rivka.levi@gmail.com','0550887717','South','6285953047213886','393','2025-10-01',0),('Customer25','986817322','Business',1,'David','Shalom','david.shalom@apple.com','0518864390','Center',NULL,NULL,NULL,3000),('Customer26','324605558','Business',3,'Eli','Ohana','eli.ohana@microsoft.com','0569623616','Center',NULL,NULL,NULL,2850),('Customer27','186989215','Business',6,'Shira','Ohana','shira.ohana@alphabet.com','0555722813','South',NULL,NULL,NULL,2930),('Customer28','667131799','Private',NULL,'Noa','Ohana','noa.ohana@yahoo.com','0557608006','South','0275272740169647','503','2025-07-01',0),('Customer29','268939926','Private',NULL,'Moshe','Biton','moshe.biton@yahoo.com','0565421770','Center','9364717509235420','559','2027-11-01',0),('Customer30','286495383','Business',3,'Moshe','Mizrahi','moshe.mizrahi@microsoft.com','0574988320','Center',NULL,NULL,NULL,2850),('Customer31','103903365','Business',3,'David','Levi','david.levi@microsoft.com','0531501838','Center',NULL,NULL,NULL,2850),('Customer32','666882667','Private',NULL,'Oren','Levi','oren.levi@gmail.com','0523098552','Center','9438159257540833','418','2027-12-01',0),('Customer33','702429576','Business',2,'Oren','Azoulay','oren.azoulay@intel.com','0557884887','South',NULL,NULL,NULL,2500),('Customer34','929383828','Business',4,'Noa','Mizrahi','noa.mizrahi@amazon.com','0537517062','South',NULL,NULL,NULL,2780),('Customer35','884372702','Business',1,'Yael','Peretz','yael.peretz@apple.com','0599138453','Center',NULL,NULL,NULL,3000),('Customer36','645986556','Private',NULL,'Eli','Halevi','eli.halevi@gmail.com','0545482782','South','0406904419346005','611','2027-02-01',0),('Customer37','119757556','Private',NULL,'Yael','Cohen','yael.cohen@yahoo.com','0533273154','North','1570624959242011','812','2030-09-01',0),('Customer38','649981514','Private',NULL,'David','Halevi','david.halevi@walla.com','0515436109','North','6984278935799107','525','2024-01-01',0),('Customer39','375818636','Business',2,'Avi','Dahan','avi.dahan@intel.com','0589559021','South',NULL,NULL,NULL,2500),('Customer40','356261983','Business',5,'David','Cohen','david.cohen@nvidia.com','0571266696','North',NULL,NULL,NULL,2900),('Customer41','128553235','Business',5,'Yossi','Dahan','yossi.dahan@nvidia.com','0578636992','North',NULL,NULL,NULL,2900),('Customer42','673527908','Business',1,'Eli','Dahan','eli.dahan@apple.com','0529426056','Center',NULL,NULL,NULL,3000),('Customer43','512975368','Private',NULL,'Noa','Shalom','noa.shalom@gmail.com','0559939320','South','9399782138960962','853','2030-05-01',0),('Customer44','815082928','Business',4,'Yossi','Ohana','yossi.ohana@amazon.com','0542626557','South',NULL,NULL,NULL,2780),('Customer45','213535553','Business',3,'Shira','Levi','shira.levi@microsoft.com','0554701847','Center',NULL,NULL,NULL,2850);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `Username` varchar(15) NOT NULL,
  `ID` int NOT NULL,
  `SupplierID` int NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `Supplier_idx` (`SupplierID`),
  CONSTRAINT `SupplierID1` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`ID`),
  CONSTRAINT `Username4` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Category` enum('Salad','First Course','Main Course','Dessert','Beverage') NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `CustomSize` tinyint(1) NOT NULL,
  `CustomDoneness` tinyint(1) NOT NULL,
  `CustomRestrictions` tinyint(1) NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_supplier_index` (`SupplierID`,`Name`),
  KEY `SupplierID2_idx` (`SupplierID`),
  CONSTRAINT `SupplierID2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `Username` varchar(15) NOT NULL,
  `ID` int NOT NULL,
  `Type` enum('CEO','North Manager','Center Manager','South Manager') NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  CONSTRAINT `Username2` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES ('Center',3,'Center Manager','Aviv','Raz','manager.center@biteme.co.il','1800430430'),('CEO',1,'CEO','Ofer','Elzara','ceo@biteme.co.il','1800410410'),('North',2,'North Manager','Oran','Efroni','manager.north@biteme.co.il','1800420420'),('South',4,'South Manager','Sagi','Yosofov','manager.south@biteme.co.il','1800440440');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `Username` varchar(15) NOT NULL,
  `ID` int NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Branch` enum('North','Center','South') DEFAULT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `CityBranch_idx` (`City`,`Branch`),
  CONSTRAINT `CityBranch` FOREIGN KEY (`City`, `Branch`) REFERENCES `cities` (`City`, `Branch`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `Username3` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES ('Aroma@EI',1,'Aroma Eilat','eilat@aroma.co.il','0513602065','123 HaYam Street','Eilat','South'),('Aroma@NE',2,'Aroma Netanya','netanya@aroma.co.il','0587514121','45 Herzl Street','Netanya','Center'),('Bambino',3,'Shawarma Bambino','bambino@biteme.co.il','0554110091','20 Ben Gurion Street','Givatayim','Center'),('Dictator',4,'Dictator Burger','dictator@biteme.co.il','0576976103','87 Carmel Street','Haifa','North'),('Dominos',5,'Dominos Karmiel','karmiel@dominos.com','0584177868','33 HaCarmel Street','Karmiel','North'),('Falafel',6,'Yemeni Falafel','falafel@biteme.co.il','0567631435','15 Weizmann Street','Kiryat Motzkin','North'),('Japanika@AS',7,'Japanika Ashdod','ashdod@japanika.co.il','0526276870','70 HaPardes Street','Ashdod','South'),('Japanika@RY',8,'Japanika Ramat Yishay','ramaty@japanika.co.il','0556479831','98 HaMaor Street','Ramat Yishay','North'),('KFC@KR',9,'KFC Krayot','krayot@kfc.com','0554121472','65 HaNeviim Street','Kiryat Bialik','North'),('KFC@RL',10,'KFC Rishon LeTsyion','rishon@kfc.com','0531549147','110 Herzl Street','Rishon LeTsiyon','Center'),('Landwer',11,'Landwer Arad','arad@landwer.co.il','0515107501','22 HaNegev Street','Arad','South'),('Mcdonalds@BS',12,'Mcdonalds Beer-Sheva','sheva@mcdonalds.com','0502610591','105 HaNegev Street','Beer Sheva','South'),('Mcdonalds@TA',13,'Mcdonalds Tel-Aviv','telaviv@mcdonalds.com','0521564678','50 Dizengoff Street','Tel Aviv','Center'),('Mexicanit',14,'Mexicanit','mexicanit@biteme.co.il','0578418879','38 HaNegev Street','Dimona','South'),('PastaLaVista',15,'Pasta La Vista','pastala@biteme.co.il','0589712568','12 Ben Gurion Street','Ramat Gan','Center'),('Suduch',16,'Suduch','suduch@biteme.co.il','0571196622','77 HaNegev Street','Ofakim','South'),('SushiBar',17,'Sushi Bar','sushi@biteme.co.il','0562932854','62 Ibn Gvirol Street','Tel Aviv','Center'),('Vivino',18,'Vivino Kiryat Ata','ata@vivino.co.il','0597534913','44 HaCarmel Street','Kiryat Ata','North');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers_cities`
--

DROP TABLE IF EXISTS `suppliers_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers_cities` (
  `SupplierID` int NOT NULL,
  `City` varchar(15) NOT NULL,
  PRIMARY KEY (`SupplierID`,`City`),
  KEY `City_idx` (`City`),
  CONSTRAINT `City` FOREIGN KEY (`City`) REFERENCES `cities` (`City`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SupplierID3` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers_cities`
--

LOCK TABLES `suppliers_cities` WRITE;
/*!40000 ALTER TABLE `suppliers_cities` DISABLE KEYS */;
INSERT INTO `suppliers_cities` VALUES (14,'Arad'),(7,'Ashdod'),(14,'Beer Sheva'),(14,'Dimona'),(1,'Eilat'),(7,'Gadera'),(7,'Gan Yavne'),(3,'Givatayim'),(13,'Givatayim'),(15,'Givatayim'),(17,'Givatayim'),(4,'Haifa'),(18,'Haifa'),(2,'Herzliya'),(17,'Herzliya'),(3,'Holon'),(5,'Karmiel'),(6,'Kiryat Ata'),(10,'Kiryat Ata'),(18,'Kiryat Ata'),(6,'Kiryat Bialik'),(9,'Kiryat Bialik'),(18,'Kiryat Bialik'),(4,'Kiryat Haim'),(12,'Kiryat Haim'),(18,'Kiryat Haim'),(7,'Kiryat Malachi'),(6,'Kiryat Motzkin'),(9,'Kiryat Motzkin'),(18,'Kiryat Motzkin'),(8,'Kiryat Tivon'),(6,'Kiryat Yam'),(11,'Kiryat Yam'),(5,'Misgav'),(6,'Nahariya'),(2,'Netanya'),(16,'Netivot'),(16,'Ofakim'),(3,'Petah Tikvah'),(15,'Petah Tikvah'),(3,'Ramat Gan'),(13,'Ramat Gan'),(15,'Ramat Gan'),(17,'Ramat Gan'),(8,'Ramat Yishay'),(13,'Rishon LeTsiyon'),(16,'Sderot'),(3,'Tel Aviv'),(13,'Tel Aviv'),(15,'Tel Aviv'),(17,'Tel Aviv'),(8,'Yokneam');
/*!40000 ALTER TABLE `suppliers_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `IsLoggedIn` tinyint(1) NOT NULL DEFAULT '0',
  `Type` enum('Manager','Customer','Supplier','Employee') NOT NULL,
  `Registered` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Aroma@EI','ar0ma',0,'Supplier',1),('Aroma@NE','C4fe',0,'Supplier',1),('Bambino','Sh0wa',0,'Supplier',1),('Center','Center',0,'Manager',1),('CEO','CEO',0,'Manager',1),('Customer01','pass1',0,'Customer',1),('Customer02','pass2',0,'Customer',1),('Customer03','pass3',0,'Customer',1),('Customer04','pass4',0,'Customer',1),('Customer05','pass5',0,'Customer',1),('Customer06','pass6',0,'Customer',1),('Customer07','pass7',0,'Customer',1),('Customer08','pass8',0,'Customer',1),('Customer09','pass9',0,'Customer',1),('Customer10','pass10',0,'Customer',1),('Customer11','pass11',0,'Customer',1),('Customer12','pass12',0,'Customer',1),('Customer13','pass13',0,'Customer',1),('Customer14','pass14',0,'Customer',1),('Customer15','pass15',0,'Customer',1),('Customer16','pass16',0,'Customer',1),('Customer17','pass17',0,'Customer',1),('Customer18','pass18',0,'Customer',1),('Customer19','pass19',0,'Customer',1),('Customer20','pass20',0,'Customer',1),('Customer21','pass21',0,'Customer',1),('Customer22','pass22',0,'Customer',1),('Customer23','pass23',0,'Customer',1),('Customer24','pass24',0,'Customer',1),('Customer25','pass25',0,'Customer',1),('Customer26','pass26',0,'Customer',1),('Customer27','pass27',0,'Customer',1),('Customer28','pass28',0,'Customer',1),('Customer29','pass29',0,'Customer',1),('Customer30','pass30',0,'Customer',1),('Customer31','pass31',0,'Customer',1),('Customer32','pass32',0,'Customer',1),('Customer33','pass33',0,'Customer',1),('Customer34','pass34',0,'Customer',1),('Customer35','pass35',0,'Customer',1),('Customer36','pass36',0,'Customer',1),('Customer37','pass37',0,'Customer',1),('Customer38','pass38',0,'Customer',1),('Customer39','pass39',0,'Customer',1),('Customer40','pass40',0,'Customer',1),('Customer41','pass41',0,'Customer',1),('Customer42','pass42',0,'Customer',1),('Customer43','pass43',0,'Customer',1),('Customer44','pass44',0,'Customer',1),('Customer45','pass45',0,'Customer',1),('Dictator','Korea321',0,'Supplier',1),('Dominos','Pi314',0,'Supplier',1),('E@Aroma1','pass123',0,'Employee',1),('E@Aroma2','pass456',0,'Employee',1),('E@Bambino','pass789',0,'Employee',1),('E@Dictator','pass101',0,'Employee',1),('E@Dominos','pass202',0,'Employee',1),('E@Falafel','pass303',0,'Employee',1),('E@Japanika1','pass404',0,'Employee',1),('E@Japanika2','pass505',0,'Employee',1),('E@KFC1','pass606',0,'Employee',1),('E@KFC2','pass707',0,'Employee',1),('E@Landwer','pAss',0,'Employee',1),('E@Mcdonalds1','p4ss',0,'Employee',1),('E@Mcdonalds2','pass300',0,'Employee',1),('E@Mexicanit','1234',0,'Employee',1),('E@Pasta','Mac',0,'Employee',1),('E@Suduch','h0t',0,'Employee',1),('E@Sushi','4sia',0,'Employee',1),('E@Vivino','ch33',0,'Employee',1),('Falafel','Hutim',0,'Supplier',1),('Japanika@AS','cba123',0,'Supplier',1),('Japanika@RY','Oshi',0,'Supplier',1),('KFC@KR','12345',0,'Supplier',1),('KFC@RL','1111',0,'Supplier',1),('Landwer','C0ffee',0,'Supplier',1),('Mcdonalds@BS','qw3rty',0,'Supplier',1),('Mcdonalds@TA','abc123',0,'Supplier',1),('Mexicanit','Tac0',0,'Supplier',1),('North','North',0,'Manager',1),('PastaLaVista','C4rb@',0,'Supplier',1),('South','South',0,'Manager',1),('Suduch','Sud#',0,'Supplier',1),('SushiBar','T4tam1',0,'Supplier',1),('Vivino','Viv@',0,'Supplier',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 12:10:19
