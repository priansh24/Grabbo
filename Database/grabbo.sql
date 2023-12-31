-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: grabbo
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beverages`
--

DROP TABLE IF EXISTS `beverages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beverages` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beverages`
--

LOCK TABLES `beverages` WRITE;
/*!40000 ALTER TABLE `beverages` DISABLE KEYS */;
INSERT INTO `beverages` VALUES ('amul100','Amul Masti Buttermilk',56,15,'Liquid','Buttermilk',NULL),('amul101','Amul Kool Cold Coffee',32,25,'Liquid','Flavoured Milk',NULL),('amul105','Amul Lassi',25,20,'Liquid','Buttermilk Curd',NULL),('amul108','Amul Kool Kesar Pista',8,25,'Liquid','Flavoured Milk',NULL),('ca100','Cavins Strawberry Milk',12,30,'Liquid','Flavoured Milk',NULL),('ca101','Cavins Chocolate Milk',14,30,'Liquid','Flavoured Milk',NULL),('dab100','Real Fruit Juice Mixed Fruit',15,20,'Juice','Mixed Fruit',NULL),('dab101','Real Fruit Juice Apple',15,20,'Juice','Apple',NULL),('hind100','Coca-Cola',17,35,'Soft-drinks','cola',NULL),('hind101','Coca-Cola Zero Sugar',10,40,'Soft-drinks','cola',NULL),('hind102','Thumbs Up',12,35,'Soft-drinks','cola',NULL),('hind103','Limca Lime \'n\' Lemon',6,30,'Soft-drinks','lemon',NULL),('md100','Mother Dairy Buttermilk',12,14,'Liquid','Buttermilk',NULL),('par105','Appy Apple Juice',10,15,'Juice','Apple',NULL),('pepsi100','7 up Nimbooz',20,20,'Soft-drinks','lemon',NULL),('pepsi101','Pepsi',15,35,'Soft-drinks','cola',NULL);
/*!40000 ALTER TABLE `beverages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biscuits`
--

DROP TABLE IF EXISTS `biscuits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biscuits` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biscuits`
--

LOCK TABLES `biscuits` WRITE;
/*!40000 ALTER TABLE `biscuits` DISABLE KEYS */;
INSERT INTO `biscuits` VALUES ('brit100','Britannia Tiger Krunch Chocochips',24,10,'Sweet','Chocolate',NULL),('brit101','Britannia Jim-Jam',32,20,'Sweet','Vanilla Cream',NULL),('brit102','Britannia Milk Bikis',26,15,'Sweet','Plain',NULL),('brit103','Britannia Good Day Pista Badam',25,10,'Sweet','Nuts',NULL),('cad100','Cadburry Oreo Chocolate',40,10,'Sweet','Chocolate Cream',NULL),('cad101','Cadburry Oreo Vanilla',30,10,'Sweet','Vanilla Cream',NULL),('cad102','Cadburry Bournvita',12,10,'Sweet','Chocolate Glucose',NULL),('lot100','Lotte ChocoPie',30,10,'Sweet','Chocolate Vanilla',NULL),('par100','Parle G',50,5,'Sweet','Glucose',NULL),('par101','Parle Hide & Seek',28,30,'Sweet','Chocolate',NULL),('par102','Parle Marie Gold',15,40,'Sweet','Plain',NULL),('par103','Parle Krack-Jack Butter Masala',22,20,'Masala','Sweet & Salty',NULL),('par104','Parle Monaco',20,15,'Masala','Sweet & Salty',NULL),('sun100','Sunfeast Glucose Plus',31,10,'Sweet','Glucose',NULL),('sun101','Sunfeast Dark Fantasy',15,20,'Sweet','Chocolate Cream',NULL),('uni100','Unibic Sugar-Free Cashew',10,35,'Sweet','Nuts',NULL);
/*!40000 ALTER TABLE `biscuits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dairy`
--

DROP TABLE IF EXISTS `dairy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dairy` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dairy`
--

LOCK TABLES `dairy` WRITE;
/*!40000 ALTER TABLE `dairy` DISABLE KEYS */;
INSERT INTO `dairy` VALUES ('amul100','Amul Masti Buttermilk',56,15,'Liquid','Buttermilk','https://www.bigbasket.com/media/uploads/p/l/161899-2_9-amul-masti-buttermilk-spice.jpg'),('amul101','Amul Kool Cold Coffee',31,25,'Liquid','Flavoured Milk','https://www.bigbasket.com/media/uploads/p/l/20005989_2-amul-kool-cafe.jpg'),('amul102','Amul Paneer',10,75,'Solid','Cheese','https://www.jiomart.com/images/product/original/490174895/amul-fresh-paneer-200-g-pack-product-images-o490174895-p490174895-0-202203170432.jpg?im=Resize=(1000,1000)'),('amul103','Amul Milk - Tonned',20,54,'Liquid','Milk','https://static.wixstatic.com/media/2f3275_8bd3d2f85e8248ba9927d077893dfb4a~mv2.jpg/v1/fill/w_560,h_560,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/2f3275_8bd3d2f85e8248ba9927d077893dfb4a~mv2.jpg'),('amul104','Amul Milk - Full Cream',15,65,'Liquid','Milk','https://www.tradeindia.com/_next/image/?url=https%3A%2F%2Ftiimg.tistatic.com%2Ffp%2F1%2F007%2F600%2F100-pure-fresh-nutrient-enriched-amul-gold-pasteurised-full-cream-milk-359.jpg&w=750&q=75'),('amul105','Amul Lassi',25,20,'Liquid','Buttermilk Curd','https://cdn.dotpe.in/longtail/store-items/7917426/SNaOuRlE.jpeg'),('amul106','Amul Curd',11,40,'Liquid','Yogurt','https://m.media-amazon.com/images/I/61yGKFuNTNL.jpg'),('amul107','Amul Butter',19,55,'Solid','Butter','https://m.media-amazon.com/images/I/51KrxEKN58L.jpg'),('amul108','Amul Kool Kesar',8,25,'Liquid','Flavoured Milk','https://www.bigbasket.com/media/uploads/p/xxl/40005022_4-amul-kool-kesar.jpg'),('an100','Ananda Paneer',5,82,'Solid','Cheese','https://m.media-amazon.com/images/I/61DA0mrzskL.jpg'),('ca100','Cavins Strawberry Milk',12,30,'Liquid','Flavoured Milk','https://www.jiomart.com/images/product/original/491296641/cavin-s-strawberry-milkshake-1-l-tetra-pak-product-images-o491296641-p590087037-1-202307260226.jpg?im=Resize=(420,420)'),('ca101','Cavins Chocolate Milk',14,30,'Liquid','Flavoured Milk','https://www.bigbasket.com/media/uploads/p/l/1207041-2_3-cavins-milkshake-chocolate.jpg'),('md100','Mother Dairy Buttermilk',12,14,'Liquid','Buttermilk','https://m.media-amazon.com/images/I/71DG4sVoGzL.jpg'),('md101','Mother Dairy Milk',7,58,'Liquid','Milk','https://jagsfresh-storage.s3.amazonaws.com/media/package/img_one/2020-04-13/MOther_Dairy_Toned_Milk_1ltr.jpg'),('md102','Mother Dairy Curd',7,35,'Liquid','Yogurt','https://www.jiomart.com/images/product/original/490887479/mother-dairy-curd-400-g-pouch-product-images-o490887479-p590086871-0-202203151139.jpg?im=Resize=(1000,1000)'),('nu100','Nutrilite Butter',5,45,'Solid','Butter','https://www.jiomart.com/images/product/original/490001426/nutralite-rich-in-omega3-vitamins-vegetable-fat-spread-100-g-carton-product-images-o490001426-p490001426-0-202211151711.jpg?im=Resize=(1000,1000)');
/*!40000 ALTER TABLE `dairy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household`
--

DROP TABLE IF EXISTS `household`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `household` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household`
--

LOCK TABLES `household` WRITE;
/*!40000 ALTER TABLE `household` DISABLE KEYS */;
INSERT INTO `household` VALUES ('class100','Classmate Notebook',12,150,'Stationary','Notebook','https://m.media-amazon.com/images/I/61NUA0O7WTL.jpg'),('dura100','Duracell Battery 4 pack',10,190,'Battery','Battery','https://rukminim2.flixcart.com/image/850/1000/xif0q/battery/w/c/j/-original-imagnqjtjzztdqry.jpeg?q=20'),('gn100','Good Knight Mosquito Repellent Refill',30,80,'Repellent','Repellent','https://www.bigbasket.com/media/uploads/p/xxl/199522-2_2-good-knight-power-activ-mosquito-repellent-refill.jpg'),('gn101','Good Knight Mosquito Repellent Coil',14,39,'Repellent','Repellent','https://www.bigbasket.com/media/uploads/p/s/40020149_2-good-knight-smoke-coil-advanced-low.jpg'),('surf100','Surf Excel Liquid Detergent',5,490,'Detergent','Laundry','https://driftbasket.com/wp-content/uploads/2020/05/Surf-Excel-Easy-Wash-Liquid.jpg'),('surf101','Tide Matic Liquid Detergent',8,430,'Detergent','Laundry','https://m.media-amazon.com/images/I/61HyGPPY0cL._AC_UF894,1000_QL80_.jpg'),('surf102','Rin Detergent Bar',41,25,'Detergent','Laundry','https://www.bigbasket.com/media/uploads/p/l/40002071-3_6-rin-rin-detergent-bar.jpg'),('tiss100','Tissue 100 pc',25,42,'Tissue','Tissue','https://5.imimg.com/data5/SELLER/Default/2023/10/351554211/ZC/VX/MV/19341229/2-500x500.jpg'),('tiss101','Toilet Paper roll',0,70,'Tissue','Tissue','https://5.imimg.com/data5/HV/MT/MY-4289528/toilet-paper-roll.jpg'),('vim100',' Vim Lemon Dishwash Liquid Soap',11,125,'Detergent','Utensil','https://bigoffers.co.in/wp-content/uploads/2020/12/Vim-Dishwash-Liquid-Gel-Lemon-250ml-Bottle.jpg'),('vim101','Vim Lemon Dishwash Bar',22,21,'Detergent','Utensil','https://m.media-amazon.com/images/I/61BYqhOPA2L.jpg');
/*!40000 ALTER TABLE `household` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instant_food`
--

DROP TABLE IF EXISTS `instant_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instant_food` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instant_food`
--

LOCK TABLES `instant_food` WRITE;
/*!40000 ALTER TABLE `instant_food` DISABLE KEYS */;
INSERT INTO `instant_food` VALUES ('maggi100','Maggi Masala Noodles',40,12,'Noodles','Noodles','https://images-cdn.ubuy.co.in/633add938c15806e1255f41f-maggi-masala-2-minute-noodles-india.jpg'),('maggi101','Maggi Cuppa Cup Noodles',30,50,'Noodles','Noodles','https://m.media-amazon.com/images/I/81J1FthPH3L.jpg'),('maggi102','Maggi Cheese Pasta',17,35,'Noodles','Pasta','https://m.media-amazon.com/images/I/819l7A3FoSL._AC_UF1000,1000_QL80_.jpg'),('nis100','Nissin Masala Cup Noodles',25,50,'Noodles','Noodles','https://www.bigbasket.com/media/uploads/p/xxl/40052969_5-nissin-cup-noodles-mazedar-masala.jpg'),('nognshim100','Nongshim Shin Ramyun Noodles',10,120,'Noodles','Noodles','https://images-cdn.ubuy.co.in/633aafd36c94345f036f7f3d-nongshim-shin-ramyun-noodle-soup.jpg'),('sun100','Sunfeast Yippie Magic Masala Noodles',14,12,'Noodles','Noodles','https://rukminim2.flixcart.com/image/850/1000/xif0q/noodle/l/k/4/-original-imags23cvm5nggvf.jpeg?q=90'),('sun101','Sunfeast Masala Pasta',9,28,'Noodles','Pasta','https://m.media-amazon.com/images/I/81lfiYWJvPL.jpg');
/*!40000 ALTER TABLE `instant_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_care`
--

DROP TABLE IF EXISTS `personal_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_care` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_care`
--

LOCK TABLES `personal_care` WRITE;
/*!40000 ALTER TABLE `personal_care` DISABLE KEYS */;
INSERT INTO `personal_care` VALUES ('cinthol100','Cinthol Fresh Lime Bath Soap',15,25,'Bath','Soap',NULL),('cinthol101','Cinthol Cool Bath Soap',16,25,'Bath','Soap',NULL),('col101','Colgate Vedshakti',12,70,'Toothpaste','Ayurvedic',NULL),('dab102','Dabur Red',11,60,'Toothpaste','Ayurvedic',NULL),('dettol100','Dettol Original Hand Wash',12,75,'Handwash','Handwash','https://m.media-amazon.com/images/I/51WU9rX6HfL.jpg'),('dettol101','Dettol Lavendar Hand Wash',9,75,'Handwash','Handwash','https://media.nedigital.sg/fairprice/fpol/media/images/product/XL/13015850_XL1_20211014.jpg?w=1200&q=70'),('dettol103','Dettol Cool Hand Wash',10,75,'Handwash','Handwash','https://pngfile.net/download/mHqrkXWuizUFM2IgzYjjSZev8IPBMqlgeOHFEfHeisi851LzyXYmWgtRdrpCqzarBPL0pvStNKkOXLDgw7DncJ5PguhkyMCmsbjRDX0kmpmFIDym3l6at7HDbiWzsU6sflbQ3ghaHEuFPb0DcUlLE9gFuFlH1wq6YbRb3o8XdVICzIqvnbJM8O6TvOXYILBDNPY6OHcr/large'),('dove100','Dove Cream Beauty Bathing Soap',13,40,'Bath','Soap','https://m.media-amazon.com/images/I/51nf-MK31vL.jpg'),('dove101','Dove Hair Fall Rescue Shampoo',10,150,'Bath','Shampoo','https://m.media-amazon.com/images/I/41nqkG-bxLL.jpg'),('dove102','Dove Deep Moisture Body Wash',16,199,'Bath','Shower gel','https://m.media-amazon.com/images/I/71d9GBFEitL.jpg'),('durex100','Durex Air Ultra Thin Condom',14,90,'Wellness','sexual','https://www.unionchemistspharmacy.lk/wp-content/uploads/2022/11/Durex-air-ultra-thin.jpg'),('durex101','Durex Skin-on-skin real feel Condom',20,165,'Wellness','sexual','https://m.media-amazon.com/images/I/610m29-wWEL.jpg'),('facewash101','Garnier Men Acno Fight Facewash',9,191,'Facewash','Bath','https://www.netmeds.com/images/product-v1/600x600/1020731/garnier_men_acno_fight_anti_pimple_facewash_for_acne_prone_skin_150_gm_332281_1_2.jpg'),('gil100','Gillette Guard One time Razor',40,15,'Grooming','Shave','https://www.bigbasket.com/media/uploads/p/xxl/40019007-2_4-gillette-razor-guard.jpg'),('gil101','Gillette Regular Shaving Foam',20,90,'Grooming','Shave',NULL),('him100','Himalaya Neem Facewash',19,199,'Bath','Facewash',NULL),('john100','Johnsons Baby Shampoo',8,185,'Bath','Shampoo',NULL),('kama100','Kamasutra Dotted Condom',11,90,'Wellness','sexual',NULL),('khadi100','Khadi Essentials Aloe Vera Shampoo',7,120,'Bath','Shampoo',NULL),('khadi101','Khadi Neem Facewash',11,119,'Bath','Facewash',NULL),('nivea100','Nivea Body Milk Nourishing Lotion',9,110,'Grooming','Cream',NULL),('nivea101','Nivea Cocoa Nourish Body Lotion',12,125,'Grooming','Cream',NULL),('nivea102','Nivea Men Pure Impact Shower Gel',8,180,'Bath','Shower gel',NULL),('nivea103','Nivea Waterlily & Oil Shower Gel',7,190,'Bath','Shower gel',NULL),('nivea104','Nivea Men Fresh Active Roll on',8,150,'Grooming','Fragrance',NULL),('nivea105','Nivea Women Smooth Skin Roll on',6,150,'Grooming','Fragrance',NULL),('nivea106','Nivea Men Fresh Active Deo Spray',13,125,'Grooming','Fragrance',NULL),('nivea107','Nivea Women Pearl & Beauty Deo Spray',15,125,'Grooming','Fragrance',NULL),('para100','Parachute 100% Pure Coconut Oil',13,60,'Oil','Coconut',NULL),('siro100','Sirona Premium Tampons',10,199,'Wellness','tampons',NULL),('stay100','Stayfree Secure Nights Sanitary Pads',18,130,'Wellness','pads',NULL),('vicks101','Vicks Inhaler',30,65,'medicine','inhaler','https://www.bigbasket.com/media/uploads/p/xl/40019207_6-vicks-inhaler-provides-instant-relief-from-blocked-nose.jpg'),('vicks102','Vicks VapoRub',23,45,'medicine','Vaporub','https://res.fkhealthplus.com/incom/images/product/Vicks-VapoRub-1605609314-10024680-1.jpg');
/*!40000 ALTER TABLE `personal_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snacks`
--

DROP TABLE IF EXISTS `snacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snacks` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snacks`
--

LOCK TABLES `snacks` WRITE;
/*!40000 ALTER TABLE `snacks` DISABLE KEYS */;
INSERT INTO `snacks` VALUES ('act100','Act II Butter Popcorn',40,25,'Namkeen','Snacks','https://ml0co0iaphua.i.optimole.com/w:1000/h:1000/q:mauto/f:avif/https://gharstuff.com/wp-content/uploads/2020/08/Act-II-Butter-Popcorn-27g.jpg'),('bik100','Bikano Bikaneri Bhujia',14,59,'Namkeen','Namkeen','https://lh3.googleusercontent.com/nXf-LwKNaNa-sD_89CfeyxUv0PCqHcCV4Cd4eCx5Bu_zifQVChj-Z6O1X9BSQnKGjxBwU4mIsYzsYsCOm2OenfMIbgw1piK-xe1YCzI-=w400-rw'),('bing100','Bingo Mad Angles Achari Masti',10,20,'Namkeen','Snacks','https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/sliding_image/35373a.jpg?ts=1697025794'),('hald100','Haldiram\'s Plain Bhujia',7,56,'Namkeen','Namkeen','https://www.jiomart.com/images/product/original/490866829/haldiram-s-plain-bhujia-200-g-product-images-o490866829-p590033225-0-202307131820.jpg?im=Resize=(420,420)'),('hald101',' Haldiram\'s Punjabi Tadka',8,56,'Namkeen','Namkeen','https://ml0co0iaphua.i.optimole.com/w:1000/h:1000/q:mauto/f:avif/https://gharstuff.com/wp-content/uploads/2020/07/Haldirams-Punjabi-Tadka-Namkeen-200g.jpg'),('hald102',' Haldiram\'s Aloo Bhujia',0,55,'Namkeen','Namkeen','https://dookan.com/cdn/shop/products/1W69d3bB4ism8jRUlbVL8YQg29VvXfjx7_d027ff06-bb2a-4387-8d48-11c15ffc4316.png?v=1693910841'),('kurk100','Kurkure Puffcorn',11,20,'Namkeen','Snacks','https://m.media-amazon.com/images/I/81wJJZZ7XuL._AC_UF1000,1000_QL80_.jpg'),('kurk101','Kurkure Masala Munch Chips',23,20,'Namkeen','Snacks','https://m.media-amazon.com/images/I/817rZ3BUkdL.jpg'),('lays100','Lays Magic Masala Chips',32,25,'Namkeen','Snacks','https://m.media-amazon.com/images/I/71HyeSkXm0L._UF1000,1000_QL80_.jpg'),('lays101','Lays Cream & Onion Chips',33,20,'Namkeen','Snacks','https://m.media-amazon.com/images/I/71kOsITKSkL._UF1000,1000_QL80_.jpg'),('lays102','Lays Classic Salted',14,20,'namkeen','snacks','https://m.media-amazon.com/images/I/71oPL6sEwHL._UF1000,1000_QL80_.jpg'),('uncle100','Uncle Chips Plain Salted',23,20,'namkeen','snacks','https://m.media-amazon.com/images/I/71ixTdzDdLL.jpg'),('uncle101','Uncle Chips Spicy Treat',25,20,'namkeen','snacks','https://rukminim2.flixcart.com/image/850/1000/xif0q/chips/i/e/k/-original-imaggpg3z6kshykw.jpeg?q=20');
/*!40000 ALTER TABLE `snacks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 17:15:00
