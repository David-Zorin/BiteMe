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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (-1,'None'),(1,'Apple'),(2,'Intel'),(3,'Microsoft'),(4,'Amazon'),(5,'Nvidia'),(6,'Alphabet');
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
  `ID` int NOT NULL,
  `Type` enum('Private','Business') NOT NULL,
  `CompanyID` int NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `HomeBranch` enum('North','Center','South') NOT NULL,
  `Credit` varchar(16) NOT NULL,
  `CVV` varchar(4) NOT NULL,
  `ValidMonth` int NOT NULL,
  `ValidYear` int NOT NULL,
  `WalletBalance` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Username`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `CompanyID_idx` (`CompanyID`),
  CONSTRAINT `CompanyID1` FOREIGN KEY (`CompanyID`) REFERENCES `companies` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Username1` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('C1',557138427,'Business',3,'Yossi','Biton','yossi.biton@microsoft.com','0554272299','Center','-1','-1',-1,-1,0),('C10',970133816,'Private',-1,'David','Azoulay','david.azoulay@walla.com','0569750879','North','4515943961873040','494',4,2030,53),('C11',327655509,'Private',-1,'Yossi','Biton','yossi.biton@yahoo.com','0562113172','North','2462878944354014','322',7,2026,0),('C12',723215237,'Business',4,'Yael','Ohana','yael.ohana@amazon.com','0564201683','South','-1','-1',-1,-1,0),('C13',622376411,'Business',5,'David','Katz','david.katz@nvidia.com','0587001893','North','-1','-1',-1,-1,102),('C14',952655813,'Business',6,'Oren','Cohen','oren.cohen@alphabet.com','0583971096','South','-1','-1',-1,-1,0),('C15',806826944,'Business',3,'Yael','Peretz','yael.peretz@microsoft.com','0535822088','Center','-1','-1',-1,-1,0),('C16',468136505,'Private',-1,'Rivka','Dahan','rivka.dahan@yahoo.com','0504704917','Center','5152534445898679','792',11,2027,70),('C17',510051351,'Private',-1,'Rivka','Shalom','rivka.shalom@gmail.com','0558119040','Center','3614788266193789','293',6,2025,0),('C18',500493076,'Private',-1,'Eli','Weiss','eli.weiss@yahoo.com','0522810046','South','5009416415482176','355',8,2025,56),('C19',954807658,'Private',-1,'Avi','Dahan','avi.dahan@yahoo.com','0552108540','South','1884736808215459','728',10,2030,0),('C2',306750801,'Business',4,'Moshe','Peretz','moshe.peretz@amazon.com','0539374151','South','-1','-1',-1,-1,0),('C20',748043252,'Business',1,'Yael','Goldstein','yael.goldstein@apple.com','0508179647','Center','-1','-1',-1,-1,34),('C21',995398506,'Private',-1,'Moshe','Fridman','moshe.fridman@walla.com','0543362702','Center','2427992025942041','079',7,2026,0),('C22',743523654,'Private',-1,'Noa','Azoulay','noa.azoulay@walla.com','0502168113','Center','0891262169553539','157',11,2029,0),('C23',225244782,'Business',4,'Rivka','Biton','rivka.biton@amazon.com','0501004980','South','-1','-1',-1,-1,0),('C24',592186166,'Private',-1,'Rivka','Levi','rivka.levi@gmail.com','0550887717','South','6285953047213886','393',10,2025,29),('C25',986817322,'Business',1,'David','Shalom','david.shalom@apple.com','0518864390','Center','-1','-1',-1,-1,0),('C26',324605558,'Business',3,'Eli','Ohana','eli.ohana@microsoft.com','0569623616','Center','-1','-1',-1,-1,0),('C27',186989215,'Business',6,'Shira','Stein','shira.stein@alphabet.com','0555722813','South','-1','-1',-1,-1,0),('C28',667131799,'Private',-1,'Noa','Ohana','noa.ohana@yahoo.com','0557608006','South','0275272740169647','503',7,2025,93),('C29',268939926,'Private',-1,'Moshe','Biton','moshe.biton@yahoo.com','0565421770','Center','9364717509235420','559',11,2027,0),('C3',444242372,'Private',-1,'Rivka','Mizrahi','rivka.mizrahi@walla.com','0532704990','South','8143601717525888','363',8,2028,0),('C30',286495383,'Business',3,'Moshe','Mizrahi','moshe.mizrahi@microsoft.com','0574988320','Center','-1','-1',-1,-1,0),('C31',103903365,'Business',3,'David','Levi','david.levi@microsoft.com','0531501838','Center','-1','-1',-1,-1,55),('C32',666882667,'Private',-1,'Oren','Levi','oren.levi@gmail.com','0523098552','Center','9438159257540833','418',12,2027,0),('C33',702429576,'Business',2,'Oren','Azoulay','oren.azoulay@intel.com','0557884887','South','-1','-1',-1,-1,0),('C34',929383828,'Business',4,'Noa','Mizrahi','noa.mizrahi@amazon.com','0537517062','South','-1','-1',-1,-1,0),('C35',884372702,'Business',1,'Yael','Peretz','yael.peretz@apple.com','0599138453','Center','-1','-1',-1,-1,0),('C36',645986556,'Private',-1,'Eli','Halevi','eli.halevi@gmail.com','0545482782','South','0406904419346005','611',2,2027,0),('C37',119757556,'Private',-1,'Leah','Berger','leah.berger@yahoo.com','0533273154','North','1570624959242011','812',9,2030,76),('C38',649981514,'Private',-1,'David','Halevi','david.halevi@walla.com','0515436109','North','6984278935799107','525',1,2025,0),('C39',375818636,'Business',2,'Avi','Dahan','avi.dahan@intel.com','0589559021','South','-1','-1',-1,-1,0),('C4',520463136,'Private',-1,'Moshe','Azoulay','moshe.azoulay@gmail.com','0583343893','South','0474167200319723','539',12,2024,0),('C40',356261983,'Business',5,'David','Cohen','david.cohen@nvidia.com','0571266696','North','-1','-1',-1,-1,72),('C41',128553235,'Business',5,'Yossi','Dahan','yossi.dahan@nvidia.com','0578636992','North','-1','-1',-1,-1,0),('C42',673527908,'Business',1,'Eli','Dahan','eli.dahan@apple.com','0529426056','Center','-1','-1',-1,-1,0),('C43',512975368,'Private',-1,'Esther','Fridman','esther.fridman@gmail.com','0559939320','South','9399782138960962','853',5,2030,45),('C44',815082928,'Business',4,'Yossi','Ohana','yossi.ohana@amazon.com','0542626557','South','-1','-1',-1,-1,0),('C45',213535553,'Business',3,'Shira','Levi','shira.levi@microsoft.com','0554701847','Center','-1','-1',-1,-1,24),('C5',635824636,'Business',6,'David','Levi','david.levi@alphabet.com','0565546738','South','-1','-1',-1,-1,0),('C6',768209461,'Business',3,'Hannah','Schwartz','hannah.schwartz@microsoft.com','0579220881','Center','-1','-1',-1,-1,0),('C7',962034036,'Private',-1,'Rivka','Biton','rivka.biton@gmail.com','0531578164','North','8899453704162861','015',11,2027,63),('C8',444327147,'Private',-1,'David','Mizrahi','david.mizrahi@yahoo.com','0519726249','Center','7566010423083659','120',4,2024,0),('C9',131007931,'Private',-1,'Oren','Cohen','oren.cohen@yahoo.com','0553960378','North','0781932653284075','653',8,2026,0);
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
  CONSTRAINT `SupplierID1` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Username4` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('E@Aroma1',485736291,1,'Hagit','Dayan','hagit.dayan@aroma.co.il','0507248193'),('E@Aroma2',927384615,2,'Uri','Ben-Ari','uri.benari@aroma.co.il','0526342790'),('E@Bambino',194820736,3,'Nava','Aharon','nava.aharon@biteme.co.il','0548917362'),('E@Dictator',658372904,4,'Yoel','Kaplan','yoel.kaplan@biteme.co.il','0584679203'),('E@Dominos',712954386,5,'Yitzhak','Mizrahi','yitzhak.mizrahi@dominos.co.il','0503827645'),('E@Falafel',830271649,6,'Eli','Avrahami','eli.avrahami@biteme.co.il','0527194863'),('E@Japanika1',473192058,7,'Dalia','Mor','dalia.mor@japanika.co.il','0542967381'),('E@Japanika2',291736480,8,'Rivka','Levinson','rivka.levinson@japanika.co.il','0585409274'),('E@KFC1',846290731,9,'Noam','Avrahamson','noam.avrahamson@kfc.com','0506584912'),('E@KFC2',573948162,10,'Yakir','Binder','yakir.binder@kfc.com','0529037481'),('E@Landwer',639281745,11,'Tomer','Gurevitch','tomer.gurevitch@landwer.co.il','0543726914'),('E@Mcdonalds1',214786039,12,'Ofer','Cohen','ofer.cohen@mcdonalds.com','0582849176'),('E@Mcdonalds2',758902416,13,'Gilad','Amoyal','gilad.amoyal@mcdonalds.com','0504832569'),('E@Mexicanit',982374650,14,'Sagiv','Guetta','sagiv.guetta@biteme.co.il','0525964732'),('E@Pasta',416839270,15,'Tamar','Danino','tamar.danino@biteme.co.il','0547819204'),('E@Suduch',305712948,16,'Shlomo','Kahlon','shlomo.kahlon@biteme.co.il','0583658921'),('E@Sushi',467395821,17,'Oren','Berman','oren.berman@biteme.co.il','0507943286'),('E@Vivino',291647380,18,'Avi','Baruch','avi.brach@vivino.co.il','0524876359');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incomes_reports`
--

DROP TABLE IF EXISTS `incomes_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incomes_reports` (
  `Year` int NOT NULL,
  `Month` int NOT NULL,
  `Branch` enum('North','Center','South') NOT NULL,
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(30) NOT NULL,
  `Incomes` int NOT NULL,
  PRIMARY KEY (`Year`,`Month`,`Branch`,`SupplierID`,`SupplierName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incomes_reports`
--

LOCK TABLES `incomes_reports` WRITE;
/*!40000 ALTER TABLE `incomes_reports` DISABLE KEYS */;
INSERT INTO `incomes_reports` VALUES (2024,1,'North',4,'Dictator Burger',322),(2024,1,'North',5,'Dominos Karmiel',228),(2024,1,'North',6,'Yemeni Falafel',139),(2024,1,'North',8,'Japanika Ramat Yishay',0),(2024,1,'North',9,'KFC Krayot',0),(2024,1,'North',18,'Vivino Kiryat Ata',0),(2024,1,'Center',2,'Aroma Netanya',680),(2024,1,'Center',3,'Shawarma Bambino',0),(2024,1,'Center',10,'KFC Rishon LeTsyion',0),(2024,1,'Center',13,'Mcdonalds Tel-Aviv',310),(2024,1,'Center',15,'Pasta La Vista',0),(2024,1,'Center',17,'Sushi Bar',0),(2024,1,'South',1,'Aroma Eilat',145),(2024,1,'South',7,'Japanika Ashdod',535),(2024,1,'South',11,'Landwer Arad',0),(2024,1,'South',12,'Mcdonalds Beer-Sheva',0),(2024,1,'South',14,'Mexicanit',0),(2024,1,'South',16,'Suduch',0),(2024,2,'North',4,'Dictator Burger',0),(2024,2,'North',5,'Dominos Karmiel',222),(2024,2,'North',6,'Yemeni Falafel',0),(2024,2,'North',8,'Japanika Ramat Yishay',253),(2024,2,'North',9,'KFC Krayot',200),(2024,2,'North',18,'Vivino Kiryat Ata',398),(2024,2,'Center',2,'Aroma Netanya',91),(2024,2,'Center',3,'Shawarma Bambino',210),(2024,2,'Center',10,'KFC Rishon LeTsyion',101),(2024,2,'Center',13,'Mcdonalds Tel-Aviv',89),(2024,2,'Center',15,'Pasta La Vista',0),(2024,2,'Center',17,'Sushi Bar',0),(2024,2,'South',1,'Aroma Eilat',170),(2024,2,'South',7,'Japanika Ashdod',120),(2024,2,'South',11,'Landwer Arad',0),(2024,2,'South',12,'Mcdonalds Beer-Sheva',194),(2024,2,'South',14,'Mexicanit',0),(2024,2,'South',16,'Suduch',0),(2024,3,'North',4,'Dictator Burger',0),(2024,3,'North',5,'Dominos Karmiel',0),(2024,3,'North',6,'Yemeni Falafel',33),(2024,3,'North',8,'Japanika Ramat Yishay',61),(2024,3,'North',9,'KFC Krayot',159),(2024,3,'North',18,'Vivino Kiryat Ata',169),(2024,3,'Center',2,'Aroma Netanya',262),(2024,3,'Center',3,'Shawarma Bambino',134),(2024,3,'Center',10,'KFC Rishon LeTsyion',230),(2024,3,'Center',13,'Mcdonalds Tel-Aviv',58),(2024,3,'Center',15,'Pasta La Vista',0),(2024,3,'Center',17,'Sushi Bar',0),(2024,3,'South',1,'Aroma Eilat',193),(2024,3,'South',7,'Japanika Ashdod',211),(2024,3,'South',11,'Landwer Arad',0),(2024,3,'South',12,'Mcdonalds Beer-Sheva',92),(2024,3,'South',14,'Mexicanit',0),(2024,3,'South',16,'Suduch',0),(2024,4,'North',4,'Dictator Burger',0),(2024,4,'North',5,'Dominos Karmiel',0),(2024,4,'North',6,'Yemeni Falafel',0),(2024,4,'North',8,'Japanika Ramat Yishay',0),(2024,4,'North',9,'KFC Krayot',0),(2024,4,'North',18,'Vivino Kiryat Ata',0),(2024,4,'Center',2,'Aroma Netanya',168),(2024,4,'Center',3,'Shawarma Bambino',0),(2024,4,'Center',10,'KFC Rishon LeTsyion',0),(2024,4,'Center',13,'Mcdonalds Tel-Aviv',0),(2024,4,'Center',15,'Pasta La Vista',0),(2024,4,'Center',17,'Sushi Bar',0),(2024,4,'South',1,'Aroma Eilat',108),(2024,4,'South',7,'Japanika Ashdod',27),(2024,4,'South',11,'Landwer Arad',0),(2024,4,'South',12,'Mcdonalds Beer-Sheva',50),(2024,4,'South',14,'Mexicanit',0),(2024,4,'South',16,'Suduch',0),(2024,5,'North',4,'Dictator Burger',334),(2024,5,'North',5,'Dominos Karmiel',0),(2024,5,'North',6,'Yemeni Falafel',0),(2024,5,'North',8,'Japanika Ramat Yishay',0),(2024,5,'North',9,'KFC Krayot',0),(2024,5,'North',18,'Vivino Kiryat Ata',0),(2024,5,'Center',2,'Aroma Netanya',0),(2024,5,'Center',3,'Shawarma Bambino',174),(2024,5,'Center',10,'KFC Rishon LeTsyion',140),(2024,5,'Center',13,'Mcdonalds Tel-Aviv',47),(2024,5,'Center',15,'Pasta La Vista',0),(2024,5,'Center',17,'Sushi Bar',0),(2024,5,'South',1,'Aroma Eilat',0),(2024,5,'South',7,'Japanika Ashdod',0),(2024,5,'South',11,'Landwer Arad',0),(2024,5,'South',12,'Mcdonalds Beer-Sheva',0),(2024,5,'South',14,'Mexicanit',0),(2024,5,'South',16,'Suduch',0),(2024,6,'North',4,'Dictator Burger',179),(2024,6,'North',5,'Dominos Karmiel',212),(2024,6,'North',6,'Yemeni Falafel',47),(2024,6,'North',8,'Japanika Ramat Yishay',0),(2024,6,'North',9,'KFC Krayot',189),(2024,6,'North',18,'Vivino Kiryat Ata',0),(2024,6,'Center',2,'Aroma Netanya',0),(2024,6,'Center',3,'Shawarma Bambino',0),(2024,6,'Center',10,'KFC Rishon LeTsyion',0),(2024,6,'Center',13,'Mcdonalds Tel-Aviv',0),(2024,6,'Center',15,'Pasta La Vista',0),(2024,6,'Center',17,'Sushi Bar',0),(2024,6,'South',1,'Aroma Eilat',0),(2024,6,'South',7,'Japanika Ashdod',0),(2024,6,'South',11,'Landwer Arad',0),(2024,6,'South',12,'Mcdonalds Beer-Sheva',0),(2024,6,'South',14,'Mexicanit',0),(2024,6,'South',16,'Suduch',0);
/*!40000 ALTER TABLE `incomes_reports` ENABLE KEYS */;
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
  `Name` varchar(30) NOT NULL,
  `Category` enum('Salad','First Course','Main Course','Dessert','Beverage') NOT NULL,
  `Description` varchar(150) DEFAULT NULL,
  `CustomSize` tinyint(1) NOT NULL,
  `CustomDoneness` tinyint(1) NOT NULL,
  `CustomRestrictions` tinyint(1) NOT NULL,
  `Price` float NOT NULL,
  `ImageURL` varchar(50) NOT NULL DEFAULT '/gui/resource/no_image.jpg',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_supplier_index` (`SupplierID`,`Name`),
  KEY `SupplierID2_idx` (`SupplierID`),
  CONSTRAINT `SupplierID2` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(2,1,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(3,1,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(4,1,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(5,1,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(6,1,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(7,1,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(8,1,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(9,2,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(10,2,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(11,2,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(12,2,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(13,2,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(14,2,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(15,2,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(16,2,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(17,3,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(18,3,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(19,3,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(20,3,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(21,3,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(22,3,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(23,3,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(24,3,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(25,4,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(26,4,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(27,4,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(28,4,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(29,4,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(30,4,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(31,4,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(32,4,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(33,5,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(34,5,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(35,5,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(36,5,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(37,5,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(38,5,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(39,5,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(40,5,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(41,6,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(42,6,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(43,6,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(44,6,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(45,6,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(46,6,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(47,6,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(48,6,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(49,7,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(50,7,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(51,7,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(52,7,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(53,7,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(54,7,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(55,7,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(56,7,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(57,8,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(58,8,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(59,8,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(60,8,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(61,8,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(62,8,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(63,8,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(64,8,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(65,9,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(66,9,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(67,9,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(68,9,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(69,9,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(70,9,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(71,9,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(72,9,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(73,10,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(74,10,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(75,10,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(76,10,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(77,10,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(78,10,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(79,10,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(80,10,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(81,11,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(82,11,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(83,11,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(84,11,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(85,11,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(86,11,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(87,11,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(88,11,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(89,12,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(90,12,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(91,12,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(92,12,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(93,12,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(94,12,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(95,12,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(96,12,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(97,13,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(98,13,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(99,13,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(100,13,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(101,13,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(102,13,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(103,13,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(104,13,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(105,14,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(106,14,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(107,14,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(108,14,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(109,14,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(110,14,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(111,14,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(112,14,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(113,15,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(114,15,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(115,15,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(116,15,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(117,15,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(118,15,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(119,15,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(120,15,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(121,16,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(122,16,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(123,16,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(124,16,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(125,16,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(126,16,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(127,16,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(128,16,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(129,17,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(130,17,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(131,17,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(132,17,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(133,17,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(134,17,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(135,17,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(136,17,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(137,18,'Mineral Water','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/mineral-water.jpg'),(138,18,'Coca Cola','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/coca-cola.jpg'),(139,18,'Coca Cola Zero','Beverage','330ml',0,0,0,10.99,'/gui/resource/beverages/zero.jpg'),(140,18,'Sprite','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite.jpg'),(141,18,'Sprite Zero','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/sprite-zero.jpg'),(142,18,'Fanta','Beverage','330ml',0,0,0,10,'/gui/resource/beverages/fanta.jpg'),(143,18,'Grape Juice','Beverage','330ml',0,0,0,9.99,'/gui/resource/beverages/grape-juice.jpg'),(144,18,'Soda','Beverage','330ml',0,0,0,9,'/gui/resource/beverages/soda.jpg'),(145,1,'Cappuccino','Beverage','Creamy coffee with espresso, steamed milk, and frothy milk foam.',1,0,0,15,'/gui/resource/aroma/cappuccino.jpg'),(146,1,'Espresso','Beverage','Strong, concentrated coffee brewed by forcing hot water through finely ground beans.',1,0,0,12,'/gui/resource/aroma/espresso.jpg'),(147,1,'Hot Chocolate','Beverage','Warm, creamy drink made with melted cocoa.',1,0,0,12,'/gui/resource/aroma/hot-chocolate.jpg'),(148,2,'Cappuccino','Beverage','Creamy coffee with espresso, steamed milk, and frothy milk foam.',1,0,0,15,'/gui/resource/aroma/cappuccino.jpg'),(149,2,'Espresso','Beverage','Strong, concentrated coffee brewed by forcing hot water through finely ground beans.',1,0,0,12,'/gui/resource/aroma/espresso.jpg'),(150,2,'Hot Chocolate','Beverage','Warm, creamy drink made with melted cocoa.',1,0,0,12,'/gui/resource/aroma/hot-chocolate.jpg'),(151,1,'Halumi Salad','Salad','Charred halloumi, roasted cabbage, mushrooms, peppers, onions, tomatoes, carrots, lettuce, and arugula.',0,0,1,43,'/gui/resource/no_image.jpg'),(152,1,'Chicken Salad','Salad','Warm chicken cubes with sautéed cabbage, onions, carrots, potatoes, lettuce, tomatoes, and arugula.',0,0,1,49,'/gui/resource/no_image.jpg'),(153,1,'Tuna Salad','Salad','Tuna, hard-boiled egg, roasted eggplant, potato, onions, lettuce, corn, pickles, parsley, tomato.',0,0,1,41,'/gui/resource/no_image.jpg'),(154,2,'Halumi Salad','Salad','Charred halloumi, roasted cabbage, mushrooms, peppers, onions, tomatoes, carrots, lettuce, and arugula.',0,0,1,43,'/gui/resource/no_image.jpg'),(155,2,'Chicken Salad','Salad','Warm chicken cubes with sautéed cabbage, onions, carrots, potatoes, lettuce, tomatoes, and arugula.',0,0,1,49,'/gui/resource/no_image.jpg'),(156,2,'Tuna Salad','Salad','Tuna, hard-boiled egg, roasted eggplant, potato, onions, lettuce, corn, pickles, parsley, tomato.',0,0,1,41,'/gui/resource/no_image.jpg'),(157,1,'Israeli Breakfast','Main Course','Two eggs of your choice, a small salad (Israeli or green), served with tahini, choice of bread, butter, and olives.',0,0,1,40,'/gui/resource/aroma/morning-breakfast.jpg'),(158,1,'Shakshuka','Main Course','Shakshuka with two eggs, tomato and pepper sauce, parsley, small salad (Israeli/green). Served with tahini and bread.',0,0,0,40,'/gui/resource/no_image.jpg'),(159,1,'Vegan Breakfast','Main Course','Hummus omelet, small salad (Israeli/green), served with tahini, bread, and olives.',0,0,0,40,'/gui/resource/aroma/vegan-breakfast.jpg'),(160,2,'Israeli Breakfast','Main Course','Two eggs of your choice, a small salad (Israeli or green), served with tahini, choice of bread, butter, and olives.',0,0,1,40,'/gui/resource/aroma/morning-breakfast.jpg'),(161,2,'Shakshuka','Main Course','Shakshuka with two eggs, tomato and pepper sauce, parsley, small salad (Israeli/green). Served with tahini and bread.',0,0,0,40,'/gui/resource/no_image.jpg'),(162,2,'Vegan Breakfast','Main Course','Hummus omelet, small salad (Israeli/green), served with tahini, bread, and olives.',0,0,0,40,'/gui/resource/aroma/vegan-breakfast.jpg'),(163,1,'Omelette Sandwich','First Course','Omelet, cream cheese, tomato, pickles, and lettuce.',1,0,1,33,'/gui/resource/aroma/omelette-sandwich.jpg'),(164,1,'Halumi Sandwich','First Course','Charred halloumi, cream cheese, tomato, pickles, and lettuce.',1,0,1,33,'/gui/resource/aroma/haloumi-sandwich.jpg'),(165,1,'Tuna Sandwich','First Course','Aroma sauce, tuna, tomato, pickles, and arugula.',1,0,1,33,'/gui/resource/aroma/tuna-sandwich.jpg'),(166,2,'Omelette Sandwich','First Course','Omelet, cream cheese, tomato, pickles, and lettuce.',1,0,1,33,'/gui/resource/aroma/omelette-sandwich.jpg'),(167,2,'Halumi Sandwich','First Course','Charred halloumi, cream cheese, tomato, pickles, and lettuce.',1,0,1,33,'/gui/resource/aroma/haloumi-sandwich.jpg'),(168,2,'Tuna Sandwich','First Course','Aroma sauce, tuna, tomato, pickles, and arugula.',1,0,1,33,'/gui/resource/aroma/tuna-sandwich.jpg'),(169,1,'Almond Butter Croissant','Dessert','Buttery croissant topped with almond butter and sliced almonds.',1,0,0,18,'/gui/resource/aroma/crossiant.jpg'),(170,1,'Chocolate Chip Cookie','Dessert','Chewy cookie with rich chocolate chips.',1,0,0,13,'/gui/resource/aroma/chocolate-chip.jpg'),(171,1,'Brownies','Dessert','Rich, fudgy brownies with a gooey texture.',1,0,0,14,'/gui/resource/aroma/brownies.jpg'),(172,2,'Almond Butter Croissant','Dessert','Buttery croissant topped with almond butter and sliced almonds.',1,0,0,18,'/gui/resource/aroma/crossiant.jpg'),(173,2,'Chocolate Chip Cookie','Dessert','Chewy cookie with rich chocolate chips.',1,0,0,13,'/gui/resource/aroma/chocolate-chip.jpg'),(174,2,'Brownies','Dessert','Rich, fudgy brownies with a gooey texture.',1,0,0,14,'/gui/resource/aroma/brownies.jpg'),(175,9,'Fries','First Course','Golden fries with a perfect crunch and fluffy interior',1,0,0,18,'/gui/resource/kfc/fries.jpg'),(176,9,'Onion Rings','First Course','Falvorful onion rings.',1,0,0,16,'/gui/resource/kfc/onion-rings.jpg'),(177,9,'Mozzaerilla Bites','First Course','5 Crispy, golden bites of mozzarella cheese, served warm and melty inside.',0,0,0,29.99,'/gui/resource/kfc/mozzaerella-bites.jpg'),(178,10,'Fries','First Course','Golden fries with a perfect crunch and fluffy interior',1,0,0,18,'/gui/resource/kfc/fries.jpg'),(179,10,'Onion Rings','First Course','Falvorful onion rings.',1,0,0,16,'/gui/resource/kfc/onion-rings.jpg'),(180,10,'Mozzaerilla Bites','First Course','5 Crispy, golden bites of mozzarella cheese, served warm and melty inside.',0,0,0,29.99,'/gui/resource/kfc/mozzaerella-bites.jpg'),(181,9,'Strips Bucket','Main Course','Classic tender chicken strips, seasoned and fried to perfection.',1,0,0,105,'/gui/resource/kfc/strips-bucket.jpg'),(182,9,'Colonel Bucket','Main Course','Chicken pieces on the bone. Crispy on the outside, juicy and tender on the inside.',1,0,0,85,'/gui/resource/kfc/colonel-bucket.jpg'),(183,9,'Classic Twister','Main Course','Soft tortilla with crispy strips, lettuce, tomatoes, and mayo.',1,0,1,25,'/gui/resource/kfc/classic-twister.jpg'),(184,10,'Strips Bucket','Main Course','Classic tender chicken strips, seasoned and fried to perfection.',1,0,0,105,'/gui/resource/kfc/strips-bucket.jpg'),(185,10,'Colonel Bucket','Main Course','Chicken pieces on the bone. Crispy on the outside, juicy and tender on the inside.',1,0,0,85,'/gui/resource/kfc/colonel-bucket.jpg'),(186,10,'Classic Twister','Main Course','Soft tortilla with crispy strips, lettuce, tomatoes, and mayo.',1,0,1,25,'/gui/resource/kfc/classic-twister.jpg'),(187,9,'Caesar Salad with Chicken','Salad','Caesar salad with crispy chicken bites, lettuce, tomato, and croutons.',0,0,1,34,'/gui/resource/kfc/caesar-salad.jpg'),(188,10,'Caesar Salad with Chicken','Salad','Caesar salad with crispy chicken bites, lettuce, tomato, and croutons.',0,0,1,34,'/gui/resource/kfc/caesar-salad.jpg'),(189,9,'Milka Donut','Dessert','Soft, fluffy donut topped with creamy Milka chocolate.',1,0,1,12,'/gui/resource/kfc/milka-donut.jpg'),(190,10,'Milka Donut','Dessert','Soft, fluffy donut topped with creamy Milka chocolate.',1,0,1,12,'/gui/resource/kfc/milka-donut.jpg'),(191,12,'McChicken Salad','Salad','Green salad with chicken steaks',1,0,1,38,'/gui/resource/mcdonalds/mcchicken-salad.jpg'),(192,13,'McChicken Salad','Salad','Green salad with chicken steaks',1,0,1,38,'/gui/resource/mcdonalds/mcchicken-salad.jpg'),(193,12,'McFries','First Course','The most famous crispy fries.',1,0,0,25,'/gui/resource/mcdonalds/mcfries.jpg'),(194,12,'McRings','First Course','Hot and crispy onion rings.',1,0,0,17,'/gui/resource/mcdonalds/mcrings.jpg'),(195,12,'Potatoes','First Course','Crispy potato wedges.',1,0,0,27,'/gui/resource/mcdonalds/potatoes.jpg'),(196,13,'McFries','First Course','The most famous crispy fries.',1,0,0,25,'/gui/resource/mcdonalds/mcfries.jpg'),(197,13,'McRings','First Course','Hot and crispy onion rings.',1,0,0,17,'/gui/resource/mcdonalds/mcrings.jpg'),(198,13,'Potatoes','First Course','Crispy potato wedges.',1,0,0,27,'/gui/resource/mcdonalds/potatoes.jpg'),(199,12,'McRoyal','Main Course','Juicy patty in a bun with premium lettuce, tomato, red onion, pickles, and Royal sauce.',1,1,1,44.99,'/gui/resource/mcdonalds/mcroyal.jpg'),(200,12,'McChicken','Main Course','Juicy grilled chicken steak in a bun, with lettuce, tomato, and our famous Royal sauce.',1,0,1,42.99,'/gui/resource/mcdonalds/mcchicken.jpg'),(201,12,'McNuggets','Main Course','Tender pieces of chicken in a golden coating.',1,0,0,37,'/gui/resource/mcdonalds/mcnuggets.jpg'),(202,13,'McRoyal','Main Course','Juicy patty in a bun with premium lettuce, tomato, red onion, pickles, and Royal sauce.',1,1,1,44.99,'/gui/resource/mcdonalds/mcroyal.jpg'),(203,13,'McChicken','Main Course','Juicy grilled chicken steak in a bun, with lettuce, tomato, and our famous Royal sauce.',1,0,1,42.99,'/gui/resource/mcdonalds/mcchicken.jpg'),(204,13,'McNuggets','Main Course','Tender pieces of chicken in a golden coating.',1,0,0,37,'/gui/resource/mcdonalds/mcnuggets.jpg'),(205,12,'McFlurry Oreo','Dessert','Frozen soft serve dessert with mixed-in with Oreo fragments.',0,0,0,20,'/gui/resource/mcdonalds/mcflurry.jpg'),(206,13,'McFlurry Oreo','Dessert','Frozen soft serve dessert with mixed-in with Oreo fragments.',0,0,0,20,'/gui/resource/mcdonalds/mcflurry.jpg'),(207,7,'Crunchy Chicken','First Course','Crispy chicken balls served with a side of sweet and sour sauce.',0,0,0,29.99,'/gui/resource/japanika/crunchy-chicken.jpg'),(208,7,'Jiaozi','First Course','Dumplings filled with chicken and vegetables, served with a side of soy and ginger sauce.',0,0,0,33.99,'/gui/resource/japanika/jiaozi.jpg'),(209,7,'Rice','First Course','Stir-fried rice with cooked with a mix of fresh vegetables.',0,0,0,18.99,'/gui/resource/japanika/rice.jpg'),(210,8,'Crunchy Chicken','First Course','Crispy chicken balls served with a side of sweet and sour sauce.',0,0,0,29.99,'/gui/resource/japanika/crunchy-chicken.jpg'),(211,8,'Jiaozi','First Course','Dumplings filled with chicken and vegetables, served with a side of soy and ginger sauce.',0,0,0,33.99,'/gui/resource/japanika/jiaozi.jpg'),(212,8,'Rice','First Course','Stir-fried rice with cooked with a mix of fresh vegetables.',0,0,0,18.99,'/gui/resource/japanika/rice.jpg'),(213,7,'Tofu Salad','Salad','Tofu and cucumber salad in a creamy peanut butter and coconut milk dressing.',1,0,1,31,'/gui/resource/japanika/tofu-salad.jpg'),(214,7,'Bean Sprout Salad','Salad','Bean sprouts, white cabbage, red cabbage, microgreens, green onions, and toasted sesame, served with peanut butter and tahini sauce.',1,0,1,29,'/gui/resource/japanika/bean-sprout-salad.jpg'),(215,8,'Tofu Salad','Salad','Tofu and cucumber salad in a creamy peanut butter and coconut milk dressing.',1,0,1,31,'/gui/resource/japanika/tofu-salad.jpg'),(216,8,'Bean Sprout Salad','Salad','Bean sprouts, white cabbage, red cabbage, microgreens, green onions, and toasted sesame, served with peanut butter and tahini sauce.',1,0,1,29,'/gui/resource/japanika/bean-sprout-salad.jpg'),(217,7,'Szechuan Stir-Fry','Main Course','Beef, udon noodles, vegetables, and green beans in a spicy sauce. Rice noodles available.',0,0,1,57,'/gui/resource/japanika/szechuan.jpg'),(218,7,'Asian Bun Burger','Main Course','Burger in a bao bun with BBQ sauce, spicy mayo, pickles, red onion, and iceberg lettuce. Served with crispy sweet potato fries.',1,1,1,52,'/gui/resource/japanika/bun-burger.jpg'),(219,7,'Japanko','Main Course','Panko-coated sushi roll, served warm with teriyaki sauce. Fish choice: Sea bass (original), salmon or tuna.',0,0,1,42,'/gui/resource/japanika/japanko.jpg'),(220,8,'Szechuan Stir-Fry','Main Course','Beef, udon noodles, vegetables, and green beans in a spicy sauce. Rice noodles available.',0,0,1,57,'/gui/resource/japanika/szechuan.jpg'),(221,8,'Asian Bun Burger','Main Course','Burger in a bao bun with BBQ sauce, spicy mayo, pickles, red onion, and iceberg lettuce. Served with crispy sweet potato fries.',1,1,1,52,'/gui/resource/japanika/bun-burger.jpg'),(222,8,'Japanko','Main Course','Panko-coated sushi roll, served warm with teriyaki sauce. Fish choice: Sea bass (original), salmon or tuna.',0,0,1,42,'/gui/resource/japanika/japanko.jpg'),(223,7,'Blondies','Dessert','Blondie cubes with salted caramel cream, topped with dark chocolate ganache.',1,0,0,27.99,'/gui/resource/japanika/blondies.jpg'),(224,7,'Red Velvet','Dessert','Layers of raspberry cake and delicate vanilla cream.',1,0,0,27.99,'/gui/resource/japanika/red-velvet.jpg'),(225,8,'Blondies','Dessert','Blondie cubes with salted caramel cream, topped with dark chocolate ganache.',1,0,0,27.99,'/gui/resource/japanika/blondies.jpg'),(226,8,'Red Velvet','Dessert','Layers of raspberry cake and delicate vanilla cream.',1,0,0,27.99,'/gui/resource/japanika/red-velvet.jpg'),(227,5,'Greek Pizza','Main Course','Family-size. Diced tomatoes, red onion, Kalamata olives, and feta cheese, topped with oregano.',0,0,1,86.9,'/gui/resource/dominos/greek-pizza.jpg'),(228,5,'Carnivore Pizza','Main Course','Family-size. Pepperoni, cabanossi, and beef brisket, topped with spicy chipotle sauce.',0,0,1,89.9,'/gui/resource/dominos/carnivore-pizza.jpg'),(229,5,'Israeli Pizza','Main Course','Family-size. Mushrooms, onions, and green olives.',0,0,1,86.9,'/gui/resource/dominos/israeli-pizza.jpg'),(230,5,'Garlic Bread','First Course','Garlic bread seasoned with garlic butter and herbs, topped with Grana Padano, mozzarella, and confit garlic, cut for sharing.',0,0,0,25.99,'/gui/resource/dominos/garlic-bread.jpg'),(231,5,'Cheesy Rolls','First Course','8 amazing rolls filled with cheese, butter, and herbs.',0,0,0,29,'/gui/resource/dominos/cheesy-rolls.jpg'),(232,5,'Mini Pancakes','Dessert','Served with: Maple Syrup (original) / Salted Caramel',0,0,1,22,'/gui/resource/dominos/mini-pancakes.jpg'),(233,5,'Cinnamon bites','Dessert','Warm cinnamon pastry served with a side of salted caramel dip.',0,0,0,22.99,'/gui/resource/dominos/cinnamon-bites.jpg'),(234,3,'Hummus and Salads','Salad','Hummus platter with a selection of salads.',1,0,1,30,'/gui/resource/bambino/hummus-salads.jpg'),(235,3,'Shawarma Pita','Main Course','Turkish shawarma inside pita with hummus, tahini and vegetables. Comes with Fries.',0,0,1,45,'/gui/resource/bambino/shawarma-pita.jpg'),(236,3,'Shawarma Laffa','Main Course','Turkish shawarma inside laffa with hummus, tahini and vegetables. Comes with Fries.',0,0,1,55,'/gui/resource/no_image.jpg'),(237,3,'Shawarma Baguette','Main Course','Turkish shawarma inside baguette with hummus, tahini and vegetables. Comes with Fries.',0,0,1,52,'/gui/resource/no_image.jpg'),(238,6,'Falafel Pita','Main Course','Salads of choice.',0,0,1,12,'/gui/resource/falafel/falafel-pita.jpg'),(239,6,'Hummus and Falafel','Main Course','20 Pieces of falafel, hummus, french fries, 4 pitas, tahini, emba, spicy and pickles.',0,0,0,90,'/gui/resource/falafel/hummus-and-falafel.jpg'),(240,6,'Salads Tray','Salad','Fresh vegetables. Various sizes.',1,0,0,14,'/gui/resource/falafel/salads-tray.jpg'),(241,6,'Box of Pickles','Salad','Tangy pickles. Various sizes.',1,0,0,14,'/gui/resource/falafel/box-of-pickles.jpg'),(242,18,'Focaccia','First Course','Baked in a wood-fired oven with olive oil, tomato salsa, and confit garlic.',1,0,0,26,'/gui/resource/vivino/focaccia.jpg'),(243,18,'Arancini','First Course','Risotto balls with a crispy coating, filled with mozzarella, Parmesan, Pecorino, and black pepper, served on a velvety rosa sauce.',0,0,0,58,'/gui/resource/vivino/arancini.jpg'),(244,18,'Polenta','First Course','A delicate corn cream with roasted champignon mushrooms, asparagus, truffles, charred white corn on the griddle, and parmesan.',0,0,0,58,'/gui/resource/no_image.jpg'),(245,18,'Panzanella Salad','Salad','Mixed greens, cherry tomatoes, broccoli, spinach, caramelized onion, baby mozzarella, sourdough, cider vinaigrette, balsamic reduction.',1,0,1,66,'/gui/resource/vivino/panzanella-salad.jpg'),(246,18,'Tomato Salad','Salad','Cherry tomatoes, red and green tomatoes, roasted carrots, beetroot, radishes, red onion, Kalamata olives, pine nuts, basil, with feta cream.',1,0,1,67,'/gui/resource/vivino/tomato-salad.jpg'),(247,18,'Pizza Margherita','Main Course','Family-size. Tomato sauce, mozzarella, and basil. Can be gluten free.',0,0,1,72,'/gui/resource/vivino/pizza-margeritha.jpg'),(248,18,'Campanella Bolognese','Main Course','Traditional long-cooked Bolognese sauce with root vegetables, beef stock, and fresh basil. Can be gluten free.',0,0,1,78,'/gui/resource/vivino/campanella-bolognese.jpg'),(249,18,'Spaghetti Pomodoro','Main Course','Roasted cherry tomatoes, half a ball of burrata, Genoese pesto, and tomato sauce. Can be gluten free.',0,0,1,84,'/gui/resource/vivino/spaghetti-pomodoro.jpg'),(250,18,'Pappardelle Funghi','Main Course','Portobello and champignon mushroom ragù, fresh basil, Parmesan, in a white wine cream sauce, with porcini foam and truffles.',0,0,1,76,'/gui/resource/vivino/pappardelle-funghi.jpg'),(251,18,'Tiramisu','Dessert','Layers of biscotti soaked in Italian espresso and brandy, wrapped in rich mascarpone cream, with cocoa powder and a chocolate tuile.',0,0,0,49,'/gui/resource/vivino/tiramisu.jpg'),(252,18,'Basque Cheesecake','Dessert','Baked cheesecake with a crunchy butter crumble and mixed berries.',0,0,0,44,'/gui/resource/vivino/basque-cheesecake.jpg'),(253,4,'Buffalo Chicken Wings','First Course','Grilled chicken wings in BBQ marinade.',1,0,0,46,'/gui/resource/dictator/buffalo-chicken-wings.jpg'),(254,4,'Beef Tenderloin','Main Course','Beef tenderloin chunks, Dictator style.',0,1,1,169,'/gui/resource/dictator/beef-tenderloin.jpg'),(255,4,'Dictator Burger','Main Course','Beef patty in a bun with lettuce, tomato, onion, and pickles.',1,1,1,69,'/gui/resource/dictator/dictator-burger.jpg');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_in_orders`
--

DROP TABLE IF EXISTS `items_in_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_in_orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `ItemID` int DEFAULT NULL,
  `SupplierID` int NOT NULL,
  `ItemName` varchar(30) NOT NULL,
  `Category` enum('Salad','First Course','Main Course','Dessert','Beverage') NOT NULL,
  `Size` enum('Small','Medium','Large','None') NOT NULL DEFAULT 'None',
  `Doneness` enum('MR','M','MW','WD','None') NOT NULL DEFAULT 'None',
  `Restrictions` varchar(50) NOT NULL DEFAULT 'None',
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`,`SupplierID`,`ItemName`,`Category`,`Size`,`Doneness`,`Restrictions`,`CustomerID`),
  KEY `SupplierID_idx` (`SupplierID`) /*!80000 INVISIBLE */,
  KEY `CustomerID_idx` (`CustomerID`),
  KEY `ItemIDFK_idx` (`ItemID`),
  CONSTRAINT `ItemIDFK` FOREIGN KEY (`ItemID`) REFERENCES `items` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `OrderID1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_in_orders`
--

LOCK TABLES `items_in_orders` WRITE;
/*!40000 ALTER TABLE `items_in_orders` DISABLE KEYS */;
INSERT INTO `items_in_orders` VALUES (1,557138427,148,2,'Cappucino','Beverage','Medium','None','None',5),(1,557138427,173,2,'Chocolate Chip Cookie','Dessert','Small','None','None',1),(1,557138427,156,2,'Tuna Salad','Salad','None','None','Extra tuna',2),(1,557138427,168,2,'Tuna Sandwich','First Course','Small','None','None',2),(2,468136505,99,13,'Coca Cola Zero','Beverage','None','None','None',2),(2,468136505,206,13,'McFlurry Oreo','Dessert','None','None','None',1),(2,468136505,202,13,'McRoyal','Main Course','Large','MW','No pickles',1),(2,468136505,202,13,'McRoyal','Main Course','Large','MW','No tomato',1),(2,468136505,198,13,'Potatoes','First Course','Large','None','None',2),(3,743523654,192,13,'McChicken Salad','Salad','Medium','None','None',1),(3,743523654,196,13,'McFries','First Course','Large','None','None',1),(3,743523654,202,13,'McRoyal','Main Course','Large','WD','None',1),(4,500493076,218,7,'Asian Bun Burger','Main Course','Medium','M','Extra pickles',1),(4,500493076,219,7,'Japanko','Main Course','None','None','Tuna',1),(4,500493076,56,7,'Soda','Beverage','None','None','None',2),(4,500493076,213,7,'Tofu Salad','Salad','Small','None','None',1),(5,119757556,253,4,'Buffalo Chicken Wings','First Course','Large','None','None',2),(5,119757556,26,4,'Coca Cola','Beverage','None','None','None',1),(6,557138427,148,2,'Cappucino','Beverage','Large','None','None',4),(6,557138427,150,2,'Hot Chocolate','Beverage','Large','None','None',1),(6,557138427,161,2,'Shakshuka','Main Course','None','None','None',2),(7,649981514,169,1,'Almond Butter Croissant','Dessert','Large','None','None',1),(7,649981514,164,1,'Halumi Sandwich','First Course','Medium','None','No cream',1),(8,131007931,241,6,'Box of Pickles','Salad','Small','None','None',1),(8,131007931,239,6,'Hummus and Falafel','Main Course','None','None','None',1),(8,131007931,44,6,'Sprite','Beverage','None','None','None',1),(9,748043252,160,2,'Israeli Breakfast','Main Course','None','None','None',3),(10,743523654,146,1,'Espresso','Beverage','Medium','None','None',1),(10,743523654,159,1,'Vegan Breakfast','Main Course','None','None','None',1),(11,622376411,228,5,'Carnivore Pizza','Main Course','None','None','None',1),(11,622376411,230,5,'Garlic Bread','First Course','None','None','None',1),(11,622376411,227,5,'Greek Pizza','Main Course','None','None','No onion',1),(12,128553235,254,4,'Beef Tenderloin','Main Course','None','MR','None',1),(13,512975368,102,7,'Fanta','Beverage','None','None','None',1),(13,512975368,204,7,'McNuggets','Main Course','Large','None','None',3),(13,512975368,197,7,'McRings','First Course','Medium','None','None',3),(14,131007931,143,18,'Grape Juice','Beverage','None','None','None',1),(14,131007931,247,18,'Pizza Margherita','Main Course','None','None','None',1),(14,131007931,249,18,'Spaghetti Pomodoro','Main Course','None','None','None',1),(15,356261983,221,8,'Asian Bun Burger','Main Course','Small','M','None',1),(15,356261983,210,8,'Crunchy Chicken','First Course','None','None','None',2),(15,356261983,64,8,'Soda','Beverage','None','None','None',2),(15,356261983,215,8,'Tofu Salad','Salad','Medium','None','None',1),(16,649981514,233,5,'Cinnamon bites','Dessert','None','None','None',1),(16,649981514,229,5,'Israeli Pizza','Main Course','None','None','None',2),(17,128553235,252,18,'Basque Cheesecake','Dessert','None','None','None',1),(17,128553235,245,18,'Panzanella Salad','Salad','None','None','None',1),(17,128553235,247,18,'Pizza Margherita','Main Course','None','None','No basil',1),(18,119757556,70,9,'Fanta','Beverage','None','None','None',1),(18,119757556,177,9,'Mozzaerilla Bites','First Course','None','None','None',2),(18,119757556,181,9,'Strips Bucket','Main Course','Large','None','None',1),(19,131007931,216,8,'Bean Sprout Salad','Salad','Large','None','None',1),(19,131007931,57,8,'Mineral Water','Beverage','None','None','None',2),(20,375818636,223,7,'Blondies','Dessert','Medium','None','None',1),(20,375818636,54,7,'Fanta','Beverage','None','None','None',1),(20,375818636,217,7,'Szechuan Stir-Fry','Main Course','None','None','None',1),(21,592186166,191,12,'McChicken Salad','Main Course','Large','None','None',1),(21,592186166,193,12,'McFries','First Course','Small','None','None',2),(22,520463136,157,1,'Israeli Breakfast','Main Course','None','None','None',2),(22,520463136,163,1,'Omelette Sandwich','First Course','Small','None','None',2),(22,520463136,8,1,'Soda','Beverage','None','None','None',2),(23,510051351,204,13,'McNuggets','Main Course','Large','None','None',2),(24,986817322,188,10,'Caesar Salad with Chicken','Salad','None','None','None',1),(24,986817322,190,10,'Milka Donut','Dessert','Small','None','None',1),(24,986817322,180,10,'Mozzaerilla Bites','First Course','None','None','None',1),(25,884372702,236,3,'Shawarma Laffa','Main Course','None','None','None',3),(25,884372702,20,3,'Sprite','Beverage','None','None','None',3),(26,286495383,168,2,'Tuna Sandwich','First Course','Medium','None','None',2),(27,667131799,191,12,'McChicken Salad','Salad','Medium','None','None',1),(27,667131799,205,12,'McFlurry Oreo','Dessert','None','None','None',1),(27,667131799,89,12,'Mineral Water','Beverage','None','None','None',1),(28,649981514,238,6,'Falafel Pita','Main Course','None','None','None',1),(29,356261983,142,18,'Fanta','Beverage','None','None','None',2),(29,356261983,242,18,'Focaccia','First Course','Small','None','None',2),(29,356261983,247,18,'Pizza Margherita','Main Course','None','None','None',1),(30,723215237,218,7,'Asian Bun Burger','Main Course','Medium','MR','None',1),(30,723215237,223,7,'Blondies','Dessert','Large','None','None',1),(31,444242372,219,7,'Japanko','Main Course','None','None','None',2),(31,444242372,52,7,'Sprite','Beverage','None','None','None',2),(32,512975368,169,1,'Almond Butter Croissant','Dessert','Large','None','None',3),(32,512975368,146,1,'Espresso','Beverage','Medium','None','None',3),(32,512975368,164,1,'Halumi Sandwich','First Course','Small','None','None',3),(33,666882667,78,10,'Fanta','Beverage','None','None','None',2),(33,666882667,184,10,'Strips Bucket','Main Course','Small','None','None',2),(34,743523654,174,2,'Brownies','Dessert','Large','None','None',4),(34,743523654,167,2,'Halumi Sandwich','First Course','Medium','None','None',2),(34,743523654,166,2,'Omelette Sandwich','First Course','Medium','None','None',2),(35,286495383,235,3,'Shawarma Pita','Main Course','None','None','None',1),(35,286495383,24,3,'Soda','Beverage','None','None','None',1),(36,748043252,23,3,'Grape Juice','Beverage','None','None','None',1),(36,748043252,234,3,'Hummus and Salads','Salad','Medium','None','None',1),(37,768209461,202,13,'McRoyal','Main Course','Large','M','None',1),(38,119757556,210,8,'Crunchy Chicken','First Course','None','None','None',1),(38,119757556,215,8,'Tofu Salad','Salad','Medium','None','None',1),(39,622376411,183,9,'Classic Twister','Main Course','Medium','None','None',2),(39,622376411,189,9,'Milka Donut','Dessert','Small','None','None',2),(40,962034036,182,9,'Colonel Bucket','Main Course','Large','None','None',1),(41,468136505,155,2,'Chicken Salad','Salad','None','None','None',1),(42,667131799,151,1,'Halumi Salad','Salad','None','None','None',1),(42,667131799,158,1,'Shakshuka','Main Course','None','None','None',1),(43,444242372,52,7,'Sprite','Beverage','None','None','None',1),(44,666882667,16,2,'Soda','Beverage','None','None','None',1),(44,666882667,162,2,'Vegan Breakfast','Main Course','None','None','None',1),(45,723215237,193,12,'McFries','First Course','Large','None','None',1),(46,468136505,10,2,'Coca Cola','Beverage','None','None','None',1),(46,468136505,9,2,'Mineral Water','Beverage','None','None','None',1),(46,468136505,166,2,'Omelette Sandwich','First Course','Large','None','None',2),(47,748043252,237,3,'Shawarma Baguette','Main Course','None','None','None',2),(48,286495383,234,3,'Hummus and Salads','Salad','Medium','None','None',1),(49,666882667,185,10,'Colonel Bucket','Main Course','Small','None','None',1),(49,666882667,180,10,'Mozzaerilla Bites','First Course','None','None','None',1),(50,768209461,102,13,'Fanta','Beverage','None','None','None',1),(50,768209461,197,13,'McRings','First Course','Large','None','None',1),(51,970133816,254,4,'Beef Tenderloin','Main Course','None','MR','None',1),(51,970133816,253,4,'Buffalo Chicken Wings','First Course','Small','None','None',1),(52,327655509,255,4,'Dictator Burger','Main Course','Large','M','None',1),(52,327655509,29,4,'Sprite Zero','Beverage','None','None','None',1),(53,962034036,253,4,'Buffalo Chicken Wings','First Course','Large','None','None',1),(54,622376411,228,5,'Carnivore Pizza','Main Course','None','None','None',1),(54,622376411,38,5,'Fanta','Beverage','None','None','None',1),(54,622376411,227,5,'Greek Pizza','Main Course','None','None','None',1),(55,119757556,232,6,'Mini Pancakes','Dessert','None','None','None',1),(56,970133816,181,9,'Strips Bucket','Main Course','Medium','None','None',1),(57,962034036,175,9,'Fries','First Course','Large','None','None',1),(57,962034036,176,9,'Onion Rings','First Course','Large','None','None',1);
/*!40000 ALTER TABLE `items_in_orders` ENABLE KEYS */;
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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `Recipient` varchar(45) NOT NULL,
  `Recipient Phone` varchar(10) NOT NULL,
  `SupplierID` int NOT NULL,
  `City` varchar(15) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Branch` enum('North','Center','South') NOT NULL,
  `SupplyOption` enum('Takeaway','Basic Delivery','Shared Delivery','Robot Delivery') NOT NULL,
  `Type` enum('Pre-order','Regular') NOT NULL,
  `RequestDate` date NOT NULL,
  `RequestTime` time NOT NULL,
  `ApprovalTime` time DEFAULT NULL,
  `ApprovalDate` date DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `ArrivalDate` date DEFAULT NULL,
  `TotalPrice` float NOT NULL,
  `Status` enum('Awaiting','Approved','Ready','On-time','Late') NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `Supplier_city` (`SupplierID`,`City`),
  CONSTRAINT `Supplier_city` FOREIGN KEY (`SupplierID`, `City`) REFERENCES `suppliers_cities` (`SupplierID`, `City`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,557138427,'Yossi Biton','0554272299',2,'Herzliya','Microsoft Herzliya','Center','Shared Delivery','Regular','2024-01-01','10:30:00','09:52:00','2024-01-01','10:32:00','2024-01-01',311,'On-time'),(2,468136505,'Rivka Dahan','0504704917',13,'Givatayim','3 Jabotinsky Street','Center','Basic Delivery','Pre-order','2024-01-01','12:45:00','10:03:00','2024-01-01','13:30:00','2024-01-01',189.864,'Late'),(3,743523654,'Noa Azoulay','0502168113',13,'Ramat Gan','12 Shimon Peres Street','Center','Basic Delivery','Pre-order','2024-01-01','13:00:00','10:21:00','2024-01-01','12:59:00','2024-01-01',119.691,'On-time'),(4,500493076,'Eli Weiss','0522810046',7,'Kiryat Malachi','5 Bialik Street','South','Basic Delivery','Pre-order','2024-01-01','16:00:00','14:02:00','2024-01-01','16:21:00','2024-01-01',226.8,'Late'),(5,119757556,'Leah Berger','0533273154',4,'Kiryat Haim','10 Balfour Street','North','Basic Delivery','Regular','2024-01-01','15:25:00','14:30:00','2024-01-01','15:35:00','2024-01-01',127.99,'Late'),(6,557138427,'Yossi Biton','0554272299',2,'Herzliya','Microsoft Herzliya','Center','Shared Delivery','Pre-order','2024-01-02','09:00:00','20:04:00','2024-01-01','09:19:00','2024-01-02',204.3,'On-time'),(7,649981514,'David Halevi','0515436109',1,'Eilat','9 Ben Gurion Street','South','Basic Delivery','Regular','2024-01-01','16:10:00','15:15:00','2024-01-01','16:17:00','2024-01-01',76,'Late'),(8,131007931,'Oren Cohen','0553960378',6,'Kiryat Motzkin','13 Gordon Street','North','Basic Delivery','Regular','2024-01-01','17:15:00','16:20:00','2024-01-01','17:20:00','2024-01-01',139,'On-time'),(9,748043252,'Yael Goldstein','0508179647',2,'Herzliya','Apple Herzliya','Center','Shared Delivery','Regular','2024-01-02','11:15:00','10:17:00','2024-01-02','11:15:00','2024-01-02',165,'On-time'),(10,743523654,'Noa Azoulay','0502168113',1,'Eilat','12 Hamapilim Street','South','Basic Delivery','Pre-order','2024-01-02','14:00:00','09:30:00','2024-01-02','14:05:00','2024-01-02',69.3,'On-time'),(11,622376411,'David Katz','0587001893',5,'Karmiel','20 Hativat Hanegev Street','North','Basic Delivery','Regular','2024-01-02','20:30:00','19:32:00','2024-01-02','20:25:00','2024-01-02',227.79,'On-time'),(12,128553235,'Yossi Dahan','0578636992',4,'Haifa','17 Dizengoff Street','North','Basic Delivery','Regular','2024-01-03','21:35:00','20:30:00','2024-01-03','21:40:00','2024-01-03',194,'Late'),(13,512975368,'Esther Fridman','0559939320',7,'Ashdod','18 Ha-Rav Kook Street','South','Basic Delivery','Regular','2024-01-03','20:15:00','19:30:00','2024-01-03','20:28:00','2024-01-03',307.97,'On-time'),(14,131007931,'Oren Cohen','0553960378',18,'Kiryat Ata','29 Ofer Elzara Street','North','Basic Delivery','Regular','2024-02-02','14:30:00','13:32:00','2024-02-02','14:35:00','2024-02-02',190.99,'Late'),(15,356261983,'David Cohen','0571266696',8,'Yokneam','Nvidia Yokneam','North','Shared Delivery','Pre-order','2024-02-03','12:30:00','17:24:00','2024-02-02','12:37:00','2024-02-03',180.882,'On-time'),(16,649981514,'David Halevi','0515436109',5,'Misgav','26 David Zorin Street','North','Basic Delivery','Regular','2024-02-05','18:35:00','17:45:00','2024-02-05','19:01:00','2024-02-05',221.7,'Late'),(17,128553235,'Yossi Dahan','0578636992',18,'Haifa','26 Aviv Raz Street','North','Basic Delivery','Regular','2024-02-07','21:00:00','20:01:00','2024-02-07','21:15:00','2024-02-07',207,'Late'),(18,119757556,'Leah Berger','0533273154',9,'Kiryat Bialik','26 Oran Efroni','North','Basic Delivery','Regular','2024-02-08','13:45:00','12:30:00','2024-02-08','13:46:00','2024-02-08',199.8,'Late'),(19,131007931,'Rivka Biton','0531578164',8,'Kiryat Tivon','26 Sagie Yosofov Street','North','Basic Delivery','Regular','2024-02-12','19:00:00','18:00:01','2024-02-12','19:01:00','2024-02-12',72,'On-time'),(20,375818636,'Avi Dahan','0589559021',7,'Kiryat Malachi','14 Norit Street','South','Basic Delivery','Regular','2024-02-16','11:30:00','11:35:00','2024-02-16','12:05:00','2024-02-16',119.99,'On-time'),(21,592186166,'Rivka Levi','0550887717',12,'Kiryat Haim','13 Hazofit','South','Basic Delivery','Pre-order','2024-02-19','15:45:00','15:10:00','2024-02-19','15:59:00','2024-02-19',101.7,'On-time'),(22,520463136,'Moshe Azoulay','0583343893',1,'Eilat','12  Herzel','South','Basic Delivery','Pre-order','2024-02-21','13:00:00','12:45:00','2024-02-21','13:30:00','2024-02-21',170.1,'Late'),(23,510051351,'Rivka Shalom','0558119040',13,'Rishon LeTsiyon','2 Perez','Center','Shared Delivery','Regular','2024-02-22','18:00:00','18:05:00','2024-02-22','18:45:00','2024-02-22',89,'On-time'),(24,986817322,'David Shalom','0518864390',10,'Rishon LeTsiyon','20 Topas','Center','Basic Delivery','Regular','2024-02-24','08:30:00','08:33:00','2024-02-24','09:45:00','2024-02-24',100.99,'Late'),(25,884372702,'Yael Peretz','0599138453',3,'Tel Aviv','6 Dekel','Center','Shared Delivery','Regular','2024-02-24','15:06:00','15:15:00','2024-02-24','15:55:00','2024-02-24',210,'On-time'),(26,286495383,'Moshe Mizrahi','0574988320',2,'Herzliya','16 AhiDekel','Center','Basic Delivery','Regular','2024-02-26','14:05:00','14:09:00','2024-02-26','14:45:00','2024-02-26',91,'On-time'),(27,667131799,'Noa Ohana','0557608006',12,'Kiryat Haim','Hagibor 14','South','Basic Delivery','Regular','2024-03-01','14:30:00','14:35:00','2024-03-01','14:55:00','2024-03-01',92,'On-time'),(28,649981514,'David Halevi','0515436109',6,'Nahariya','2 Tomer Rotman','North','Basic Delivery','Pre-order','2024-03-02','14:44:00','14:47:00','2024-03-02','15:15:00','2024-03-02',33.3,'On-time'),(29,356261983,'David Cohen','0571266696',18,'Haifa','8 Dekel Vaknin','North','Shared Delivery','Regular','2024-03-03','11:45:00','11:51:00','2024-03-03','12:40:00','2024-03-03',169,'On-time'),(30,723215237,'Yael Ohana','0564201683',7,'Gan Yavne','8 Acorn','South','Shared Delivery','Regular','2024-03-07','18:00:00','18:05:00','2024-03-07','18:45:00','2024-03-07',94.99,'On-time'),(31,444242372,'Rivka Mizrahi','0532704990',7,'Gadera','3 Habonim','South','Basic Delivery','Pre-order','2024-03-09','15:45:00','15:10:00','2024-03-09','15:59:00','2024-03-09',116.1,'On-time'),(32,512975368,'Esther Fridman','0559939320',1,'Eilat','12 Oran Efroni Street','South','Basic Delivery','Pre-order','2024-03-15','13:00:00','12:45:00','2024-03-15','13:30:00','2024-03-15',192.6,'Late'),(33,666882667,'Oren Levi','0523098552',10,'Rishon LeTsiyon','20 Avi Sofer','Center','Basic Delivery','Pre-order','2024-03-16','20:15:00','20:21:00','2024-03-16','21:10:00','2024-03-16',229.5,'On-time'),(34,743523654,'Noa Azoulay','0502168113',2,'Herzliya','8 eilia Street','Center','Takeaway','Regular','2024-03-18','17:19:00','17:24:00','2024-03-18','17:33:00','2024-03-18',188,'On-time'),(35,286495383,'Moshe Mizrahi','0574988320',3,'Ramat Gan','19 Shderat Havot','Center','Basic Delivery','Regular','2024-03-19','14:05:00','14:09:00','2024-03-19','14:45:00','2024-03-19',79,'On-time'),(36,748043252,'Yael Goldstein','0508179647',3,'Ramat Gan','20 Haronim','Center','Shared Delivery','Regular','2024-03-23','15:06:00','15:15:00','2024-03-23','15:55:00','2024-03-23',54.99,'On-time'),(37,768209461,'Hannah Schwartz','0579220881',13,'Tel Aviv','15 Katerina Street','Center','Shared Delivery','Pre-order','2024-03-24','14:33:00','14:01:00','2024-03-24','14:58:00','2024-03-24',58.491,'Late'),(38,119757556,'Leah Berger','0533273154',8,'Ramat Yishay','6 Asi Azar','North','Takeaway','Regular','2024-03-26','09:22:00','09:26:00','2024-03-26','09:55:00','2024-03-26',60.99,'On-time'),(39,622376411,'David Katz','0587001893',9,'Kiryat Motzkin','6 Tiran Street','North','Basic Delivery','Regular','2024-03-26','13:11:00','13:17:00','2024-03-26','13:57:00','2024-03-26',49,'On-time'),(40,962034036,'Rivka Biton','0531578164',9,'Kiryat Bialik','19 Peres Street','North','Basic Delivery','Regular','2024-03-26','15:24:00','15:29:00','2024-03-26','16:55:00','2024-03-26',110,'Late'),(41,468136505,'Rivka Dahan','0504704917',2,'Herzliya','19 Herzog','Center','Basic Delivery','Regular','2024-03-28','08:30:00','08:33:00','2024-03-28','09:45:00','2024-03-28',74,'Late'),(42,667131799,'Noa Ohana','0557608006',1,'Eilat','Hagibor 14','South','Basic Delivery','Regular','2024-04-15','11:30:00','11:35:00','2024-04-15','12:05:00','2024-04-15',108,'On-time'),(43,444242372,'Rivka Mizrahi','0532704990',7,'Gan Yavne','3 Habonim','South','Basic Delivery','Pre-order','2024-04-18','15:45:00','15:10:00','2024-04-18','15:59:00','2024-04-18',27,'On-time'),(44,666882667,'Oren Levi','0523098552',2,'Herzliya','12 Oran Efroni Street','Center','Basic Delivery','Pre-order','2024-04-20','13:00:00','12:45:00','2024-04-20','13:30:00','2024-04-20',66.6,'On-time'),(45,723215237,'Yael Ohana','0564201683',12,'Kiryat Haim','8 Acorn','South','Basic Delivery','Regular','2024-04-23','18:00:00','18:05:00','2024-04-23','18:45:00','2024-04-23',50,'On-time'),(46,468136505,'Rivka Dahan','0504704917',2,'Netanya','19 Herzog','Center','Shared Delivery','Regular','2024-04-26','08:30:00','08:33:00','2024-04-26','09:45:00','2024-04-26',100.99,'Late'),(47,748043252,'Yael Goldstein','0508179647',3,'Tel Aviv','20 Haronim','Center','Basic Delivery','Regular','2024-05-10','15:06:00','15:15:00','2024-05-10','15:55:00','2024-05-10',129,'On-time'),(48,286495383,'Moshe Mizrahi','0574988320',3,'Tel Aviv','19 Shderat Havot','Center','Shared Delivery','Regular','2024-05-16','14:05:00','14:09:00','2024-05-16','14:45:00','2024-05-16',45,'On-time'),(49,666882667,'Oren Levi','0523098552',10,'Rishon LeTsiyon','20 Avi Sofer','Center','Basic Delivery','Regular','2024-05-24','14:30:00','14:35:00','2024-05-24','14:55:00','2024-05-24',139.99,'On-time'),(50,768209461,'Hannah Schwartz','0579220881',13,'Rishon LeTsiyon','15 Katerina Street','Center','Basic Delivery','Pre-order','2024-05-27','15:45:00','15:10:00','2024-05-27','15:59:00','2024-05-27',46.8,'On-time'),(51,970133816,'David Azoulay','0569750879',4,'Kiryat Haim','8 eilia Street','North','Shared Delivery','Pre-order','2024-05-28','14:30:00','14:35:00','2024-05-28','14:55:00','2024-05-28',216,'Late'),(52,327655509,'Yossi Biton','0562113172',4,'Kiryat Haim','6 Tiran Street','North','Basic Delivery','Pre-order','2024-06-01','15:45:00','15:10:00','2024-06-01','18:45:00','2024-06-01',117.9,'Late'),(53,962034036,'Rivka Biton','0531578164',4,'Haifa','19 Peres Street','North','Shared Delivery','Regular','2024-06-09','13:00:00','13:05:00','2024-06-09','13:45:00','2024-06-09',61,'On-time'),(54,622376411,'David Katz','0587001893',5,'Misgav','8 Dekel Vaknin','North','Basic Delivery','Regular','2024-06-12','18:00:00','18:05:00','2024-06-12','19:05:00','2024-06-12',211.8,'Late'),(55,119757556,'Leah Berger','0533273154',6,'Nahariya','6 Asi Azar','North','Basic Delivery','Regular','2024-06-12','08:30:00','08:33:00','2024-06-12','08:58:00','2024-06-12',47,'On-time'),(56,970133816,'David Azoulay','0569750879',9,'Kiryat Bialik','7 Avi Sofer','North','Shared Delivery','Regular','2024-06-15','15:06:00','15:15:00','2024-06-15','15:55:00','2024-06-15',130,'On-time'),(57,962034036,'Rivka Biton','0531578164',9,'Kiryat Motzkin','11 Habonim','North','Basic Delivery','Regular','2024-06-20','14:05:00','14:09:00','2024-06-20','14:58:00','2024-06-20',59,'On-time');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_reports`
--

DROP TABLE IF EXISTS `orders_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_reports` (
  `Year` int NOT NULL,
  `Month` int NOT NULL,
  `Branch` enum('North','Center','South') NOT NULL,
  `Category` enum('Salad','First Course','Main Course','Dessert','Beverage') NOT NULL,
  `Orders` int NOT NULL,
  PRIMARY KEY (`Year`,`Month`,`Branch`,`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_reports`
--

LOCK TABLES `orders_reports` WRITE;
/*!40000 ALTER TABLE `orders_reports` DISABLE KEYS */;
INSERT INTO `orders_reports` VALUES (2024,1,'North','Salad',1),(2024,1,'North','First Course',3),(2024,1,'North','Main Course',4),(2024,1,'North','Beverage',2),(2024,1,'Center','Salad',3),(2024,1,'Center','First Course',5),(2024,1,'Center','Main Course',8),(2024,1,'Center','Dessert',2),(2024,1,'Center','Beverage',12),(2024,1,'South','Salad',1),(2024,1,'South','First Course',4),(2024,1,'South','Main Course',6),(2024,1,'South','Dessert',1),(2024,1,'South','Beverage',4),(2024,2,'North','Salad',3),(2024,2,'North','First Course',4),(2024,2,'North','Main Course',7),(2024,2,'North','Dessert',2),(2024,2,'North','Beverage',6),(2024,2,'Center','Salad',1),(2024,2,'Center','First Course',3),(2024,2,'Center','Main Course',5),(2024,2,'Center','Dessert',1),(2024,2,'Center','Beverage',3),(2024,2,'South','First Course',4),(2024,2,'South','Main Course',4),(2024,2,'South','Dessert',1),(2024,2,'South','Beverage',3),(2024,3,'North','Salad',1),(2024,3,'North','First Course',3),(2024,3,'North','Main Course',5),(2024,3,'North','Dessert',2),(2024,3,'North','Beverage',2),(2024,3,'Center','Salad',2),(2024,3,'Center','First Course',4),(2024,3,'Center','Main Course',4),(2024,3,'Center','Dessert',4),(2024,3,'Center','Beverage',4),(2024,3,'South','Salad',1),(2024,3,'South','First Course',3),(2024,3,'South','Main Course',3),(2024,3,'South','Dessert',5),(2024,3,'South','Beverage',6),(2024,4,'Center','First Course',2),(2024,4,'Center','Main Course',1),(2024,4,'Center','Beverage',3),(2024,4,'South','Salad',1),(2024,4,'South','First Course',1),(2024,4,'South','Main Course',1),(2024,4,'South','Beverage',1),(2024,5,'North','First Course',1),(2024,5,'North','Main Course',1),(2024,5,'Center','Salad',1),(2024,5,'Center','First Course',2),(2024,5,'Center','Main Course',3),(2024,5,'Center','Beverage',1),(2024,6,'North','First Course',3),(2024,6,'North','Main Course',4),(2024,6,'North','Dessert',1),(2024,6,'North','Beverage',2);
/*!40000 ALTER TABLE `orders_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_reports`
--

DROP TABLE IF EXISTS `performance_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_reports` (
  `Year` int NOT NULL,
  `Month` int NOT NULL,
  `Branch` enum('North','Center','South') NOT NULL,
  `OnTime` int NOT NULL,
  `Late` int NOT NULL,
  PRIMARY KEY (`Year`,`Month`,`Branch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_reports`
--

LOCK TABLES `performance_reports` WRITE;
/*!40000 ALTER TABLE `performance_reports` DISABLE KEYS */;
INSERT INTO `performance_reports` VALUES (2024,1,'North',2,2),(2024,1,'Center',4,1),(2024,1,'South',2,2),(2024,2,'North',2,4),(2024,2,'Center',3,1),(2024,2,'South',2,1),(2024,3,'North',4,1),(2024,3,'Center',4,2),(2024,3,'South',3,1),(2024,4,'Center',1,1),(2024,4,'South',3,0),(2024,5,'North',0,1),(2024,5,'Center',4,0),(2024,6,'North',4,2);
/*!40000 ALTER TABLE `performance_reports` ENABLE KEYS */;
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
  `ImageURL` varchar(50) NOT NULL DEFAULT '/gui/resource/no-image.jpg',
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
INSERT INTO `suppliers` VALUES ('Aroma@EI',1,'Aroma Eilat','eilat@aroma.co.il','0513602065','123 HaYam Street','Eilat','South','/gui/resource/aroma/aroma.jpg'),('Aroma@NE',2,'Aroma Netanya','netanya@aroma.co.il','0587514121','45 Herzl Street','Netanya','Center','/gui/resource/aroma/aroma.jpg'),('Bambino',3,'Shawarma Bambino','bambino@biteme.co.il','0554110091','20 Ben Gurion Street','Givatayim','Center','/gui/resource/bambino/bambino.jpg'),('Dictator',4,'Dictator Burger','dictator@biteme.co.il','0576976103','87 Carmel Street','Haifa','North','/gui/resource/dictator/dictator.jpg'),('Dominos',5,'Dominos Karmiel','karmiel@dominos.com','0584177868','33 HaCarmel Street','Karmiel','North','/gui/resource/dominos/dominos.jpg'),('Falafel',6,'Yemeni Falafel','falafel@biteme.co.il','0567631435','15 Weizmann Street','Kiryat Motzkin','North','/gui/resource/falafel/falafel.jpg'),('Japanika@AS',7,'Japanika Ashdod','ashdod@japanika.co.il','0526276870','70 HaPardes Street','Ashdod','South','/gui/resource/japanika/japanika.jpg'),('Japanika@RY',8,'Japanika Ramat Yishay','ramaty@japanika.co.il','0556479831','98 HaMaor Street','Ramat Yishay','North','/gui/resource/japanika/japanika.jpg'),('KFC@KR',9,'KFC Krayot','krayot@kfc.com','0554121472','65 HaNeviim Street','Kiryat Bialik','North','/gui/resource/kfc/kfc.jpg'),('KFC@RL',10,'KFC Rishon LeTsyion','rishon@kfc.com','0531549147','110 Herzl Street','Rishon LeTsiyon','Center','/gui/resource/kfc/kfc.jpg'),('Landwer',11,'Landwer Arad','arad@landwer.co.il','0515107501','22 HaNegev Street','Arad','South','/gui/resource/no-image.jpg'),('Mcdonalds@BS',12,'Mcdonalds Beer-Sheva','sheva@mcdonalds.com','0502610591','105 HaNegev Street','Beer Sheva','South','/gui/resource/mcdonalds/mcdonalds.jpg'),('Mcdonalds@TA',13,'Mcdonalds Tel-Aviv','telaviv@mcdonalds.com','0521564678','50 Dizengoff Street','Tel Aviv','Center','/gui/resource/mcdonalds/mcdonalds.jpg'),('Mexicanit',14,'Mexicanit','mexicanit@biteme.co.il','0578418879','38 HaNegev Street','Dimona','South','/gui/resource/no-image.jpg'),('PastaLaVista',15,'Pasta La Vista','pastala@biteme.co.il','0589712568','12 Ben Gurion Street','Ramat Gan','Center','/gui/resource/no-image.jpg'),('Suduch',16,'Suduch','suduch@biteme.co.il','0571196622','77 HaNegev Street','Ofakim','South','/gui/resource/no-image.jpg'),('SushiBar',17,'Sushi Bar','sushi@biteme.co.il','0562932854','62 Ibn Gvirol Street','Tel Aviv','Center','/gui/resource/no-image.jpg'),('Vivino',18,'Vivino Kiryat Ata','ata@vivino.co.il','0597534913','44 HaCarmel Street','Kiryat Ata','North','/gui/resource/vivino/vivino.jpg');
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
INSERT INTO `suppliers_cities` VALUES (14,'Arad'),(7,'Ashdod'),(14,'Beer Sheva'),(14,'Dimona'),(1,'Eilat'),(7,'Gadera'),(7,'Gan Yavne'),(3,'Givatayim'),(13,'Givatayim'),(15,'Givatayim'),(17,'Givatayim'),(4,'Haifa'),(18,'Haifa'),(2,'Herzliya'),(17,'Herzliya'),(3,'Holon'),(5,'Karmiel'),(6,'Kiryat Ata'),(18,'Kiryat Ata'),(6,'Kiryat Bialik'),(9,'Kiryat Bialik'),(18,'Kiryat Bialik'),(4,'Kiryat Haim'),(12,'Kiryat Haim'),(18,'Kiryat Haim'),(7,'Kiryat Malachi'),(6,'Kiryat Motzkin'),(9,'Kiryat Motzkin'),(18,'Kiryat Motzkin'),(8,'Kiryat Tivon'),(6,'Kiryat Yam'),(11,'Kiryat Yam'),(5,'Misgav'),(6,'Nahariya'),(2,'Netanya'),(16,'Netivot'),(16,'Ofakim'),(3,'Petah Tikvah'),(15,'Petah Tikvah'),(3,'Ramat Gan'),(13,'Ramat Gan'),(15,'Ramat Gan'),(17,'Ramat Gan'),(8,'Ramat Yishay'),(10,'Rishon LeTsiyon'),(13,'Rishon LeTsiyon'),(16,'Sderot'),(3,'Tel Aviv'),(13,'Tel Aviv'),(15,'Tel Aviv'),(17,'Tel Aviv'),(8,'Yokneam');
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
INSERT INTO `users` VALUES ('Aroma@EI','ar0ma',0,'Supplier',1),('Aroma@NE','C4fe',0,'Supplier',1),('Bambino','Sh0wa',0,'Supplier',1),('C1','pass1',1,'Customer',1),('C10','pass10',0,'Customer',1),('C11','pass11',0,'Customer',1),('C12','pass12',0,'Customer',1),('C13','pass13',0,'Customer',1),('C14','pass14',0,'Customer',1),('C15','pass15',0,'Customer',1),('C16','pass16',0,'Customer',1),('C17','pass17',0,'Customer',1),('C18','pass18',0,'Customer',1),('C19','pass19',0,'Customer',1),('C2','pass2',0,'Customer',1),('C20','pass20',0,'Customer',1),('C21','pass21',0,'Customer',1),('C22','pass22',0,'Customer',1),('C23','pass23',0,'Customer',1),('C24','pass24',0,'Customer',1),('C25','pass25',0,'Customer',1),('C26','pass26',0,'Customer',1),('C27','pass27',0,'Customer',1),('C28','pass28',0,'Customer',1),('C29','pass29',0,'Customer',1),('C3','pass3',0,'Customer',1),('C30','pass30',0,'Customer',1),('C31','pass31',0,'Customer',1),('C32','pass32',0,'Customer',1),('C33','pass33',0,'Customer',1),('C34','pass34',0,'Customer',1),('C35','pass35',0,'Customer',1),('C36','pass36',0,'Customer',1),('C37','pass37',0,'Customer',1),('C38','pass38',0,'Customer',1),('C39','pass39',0,'Customer',1),('C4','pass4',0,'Customer',1),('C40','pass40',0,'Customer',1),('C41','pass41',0,'Customer',1),('C42','pass42',0,'Customer',1),('C43','pass43',0,'Customer',1),('C44','pass44',0,'Customer',1),('C45','pass45',0,'Customer',1),('C5','pass5',0,'Customer',1),('C6','pass6',0,'Customer',1),('C7','pass7',0,'Customer',1),('C8','pass8',0,'Customer',1),('C9','pass9',0,'Customer',1),('Center','Center',0,'Manager',1),('CEO','CEO',0,'Manager',1),('Check','a',0,'Supplier',1),('Dictator','Korea321',0,'Supplier',1),('Dominos','Pi314',0,'Supplier',1),('E@Aroma1','pass123',0,'Employee',1),('E@Aroma2','pass456',0,'Employee',1),('E@Bambino','pass789',0,'Employee',1),('E@Dictator','pass101',0,'Employee',1),('E@Dominos','pass202',0,'Employee',1),('E@Falafel','pass303',0,'Employee',1),('E@Japanika1','pass404',0,'Employee',1),('E@Japanika2','pass505',0,'Employee',1),('E@KFC1','pass606',0,'Employee',1),('E@KFC2','pass707',0,'Employee',1),('E@Landwer','pAss',0,'Employee',1),('E@Mcdonalds1','p4ss',0,'Employee',1),('E@Mcdonalds2','pass300',0,'Employee',1),('E@Mexicanit','1234',0,'Employee',1),('E@Pasta','Mac',0,'Employee',1),('E@Suduch','h0t',0,'Employee',1),('E@Sushi','4sia',0,'Employee',1),('E@Vivino','ch33',0,'Employee',1),('Falafel','Hutim',0,'Supplier',1),('Japanika@AS','cba123',0,'Supplier',1),('Japanika@RY','Oshi',0,'Supplier',1),('KFC@KR','12345',0,'Supplier',1),('KFC@RL','1111',0,'Supplier',1),('Landwer','C0ffee',0,'Supplier',1),('Mcdonalds@BS','qw3rty',0,'Supplier',1),('Mcdonalds@TA','abc123',0,'Supplier',1),('Mexicanit','Tac0',0,'Supplier',1),('North','North',0,'Manager',1),('PastaLaVista','C4rb@',0,'Supplier',1),('South','South',0,'Manager',1),('Suduch','Sud#',0,'Supplier',1),('SushiBar','T4tam1',0,'Supplier',1),('Vivino','Viv@',0,'Supplier',1);
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

-- Dump completed on 2024-08-13 23:10:08
