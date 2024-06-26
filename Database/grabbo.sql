SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `grabbo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `grabbo`;

DELIMITER //
CREATE PROCEDURE `Search` (IN `searchTerm` VARCHAR(255))   BEGIN
    DECLARE tableName VARCHAR(255);
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT table_name FROM information_schema.tables WHERE table_schema = 'grabbo';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS SearchResults (
    id VARCHAR(255),
    name VARCHAR(255),
    price float,
    quantity int,
    url VARCHAR(255)
         -- Add other columns you want to retrieve
       );
    
       OPEN cur;
    
       read_loop: LOOP
         FETCH cur INTO tableName;
         IF done THEN
           LEAVE read_loop;
         END IF;
    
         SET @sql = CONCAT('INSERT INTO SearchResults SELECT id, name,price,quantity,url FROM ', tableName, ' WHERE name LIKE ?');
         SET @param = CONCAT('%', searchTerm, '%');
         PREPARE stmt FROM @sql;
         EXECUTE stmt USING @param;
         DEALLOCATE PREPARE stmt;
       END LOOP;
    
       CLOSE cur;
    
       SELECT * FROM SearchResults;
    
       DROP TEMPORARY TABLE IF EXISTS SearchResults;
     END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE add_item (
    IN tblnm VARCHAR(50),
    IN p_id VARCHAR(15),
    IN p_name VARCHAR(100),
    IN p_quantity INT,
    IN p_price FLOAT,
    IN p_class VARCHAR(30),
    IN p_subclass VARCHAR(50),
    IN p_url VARCHAR(255)
)
BEGIN
    SET @table = tblnm;
    SET @sql_text = CONCAT('INSERT INTO ', @table, ' VALUES (p_id, p_name, p_quantity, p_price, p_class, p_subclass,p_url)');
    PREPARE stmt FROM @sql_text;
    EXECUTE stmt;
END;

//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE update_quantity (
    IN tblnm VARCHAR(50),
    IN p_id VARCHAR(15),
    IN new_quantity INT
)
BEGIN
    SET @table = tblnm;
    SET @sql_text = CONCAT('UPDATE ', @table, ' SET Quantity = ', new_quantity, ' WHERE ID = ', p_id);
    PREPARE stmt FROM @sql_text;
    EXECUTE stmt;
END;

//

DELIMITER ;


DELIMITER //
CREATE PROCEDURE update_price(
    IN tblnm VARCHAR(50),
    IN p_id VARCHAR(15),
    IN new_price INT
)
BEGIN
    SET @table = tblnm;
    SET @sql_text = CONCAT('UPDATE ', @table, ' SET Price = ', new_price, ' WHERE ID = ', p_id);
    PREPARE stmt FROM @sql_text;
    EXECUTE stmt;
end;//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE insert_data (
    IN tblnm VARCHAR(50),
    IN p_id VARCHAR(15),
    IN p_name VARCHAR(100),
    IN p_quantity INT,
    IN p_price FLOAT,
    IN p_class VARCHAR(30),
    IN p_subclass VARCHAR(50),
    IN p_url VARCHAR(255)
)
BEGIN
    SET @table = tblnm;
    SET @sql_text = CONCAT('INSERT INTO ', @table, ' VALUES (?, ?, ?, ?, ?, ?, ?)');
    PREPARE stmt FROM @sql_text;
    SET @id = p_id;
    SET @name = p_name;
    SET @quantity = p_quantity;
    SET @price = p_price;
    SET @class = p_class;
    SET @subclass = p_subclass;
    SET @url = p_url;
    EXECUTE stmt USING @id, @name, @quantity, @price, @class, @subclass, @url;
    DEALLOCATE PREPARE stmt;
END;

//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE create_table (IN tblnm VARCHAR(50))
BEGIN
    SET @table = tblnm;
    SET @sql_text = CONCAT('CREATE TABLE ', @table, ' (
        ID VARCHAR(15) PRIMARY KEY,
        Name VARCHAR(100),
        Quantity INT,
        Price FLOAT,
        Class VARCHAR(30),
        Sub_Class VARCHAR(50)
    )');
    PREPARE stmt FROM @sql_text;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;

//

DELIMITER ;





CREATE TABLE `beverages` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `beverages` (`ID`, `Name`, `Quantity`, `Price`, `Class`, `Sub_Class`, `url`) VALUES
('amul100', 'Amul Masti Buttermilk', 56, 15, 'Liquid', 'Buttermilk', 'https://www.bigbasket.com/media/uploads/p/l/161899-2_9-amul-masti-buttermilk-spice.jpg'),
('amul101', 'Amul Kool Cafe', 32, 25, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/l/20005989_2-amul-kool-cafe.jpg'),
('amul105', 'Amul Lassi', 25, 20, 'Liquid', 'Buttermilk Curd', 'https://cdn.dotpe.in/longtail/store-items/7917426/SNaOuRlE.jpeg'),
('amul108', 'Amul Kool Kesar', 8, 25, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/xxl/40005022_4-amul-kool-kesar.jpg'),
('ca100', 'Cavins Strawberry Milk', 12, 30, 'Liquid', 'Flavoured Milk', 'https://m.media-amazon.com/images/I/51rkjvXIQ4L.jpg'),
('ca101', 'Cavins Chocolate Milk', 14, 30, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/l/1207041-2_3-cavins-milkshake-chocolate.jpg'),
('dab100', 'Real Fruit Juice Mixed Fruit', 15, 20, 'Juice', 'Mixed Fruit', 'https://m.media-amazon.com/images/I/71+GPiOPr1L.jpg'),
('dab101', 'Real Fruit Juice Apple', 15, 20, 'Juice', 'Apple', 'https://listerr.in/wp-content/uploads/2021/06/1622714725_Real_Fruit_Juice_Apple_180ml.jpg'),
('hind100', 'Coca-Cola', 17, 35, 'Soft-drinks', 'cola', 'https://m.media-amazon.com/images/I/51bslV43gqL._AC_UF1000,1000_QL80_.jpg'),
('hind101', 'Coca-Cola Zero Sugar', 10, 40, 'Soft-drinks', 'cola', 'https://www.jiomart.com/images/product/original/492862377/coca-cola-zero-sugar-750-ml-product-images-o492862377-p591273718-0-202205232013.jpg?im=Resize=(1000,1000)'),
('hind102', 'Thums Up', 12, 35, 'Soft-drinks', 'cola', 'https://m.media-amazon.com/images/I/51y5jzm5JHL._AC_UF1000,1000_QL80_.jpg'),
('hind103', 'Limca Lime \'n\' Lemon', 6, 30, 'Soft-drinks', 'lemon', 'https://m.media-amazon.com/images/I/61OVoWc8e6L._AC_UF1000,1000_QL80_.jpg'),
('md100', 'Mother Dairy Buttermilk', 12, 14, 'Liquid', 'Buttermilk', 'https://m.media-amazon.com/images/I/71DG4sVoGzL.jpg'),
('par105', 'Appy FIZZ', 10, 15, 'Juice', 'Apple', 'https://dailygrowcer.com/wp-content/uploads/2022/04/appy-fizz-apple-juice-based-drink250ml3.jpg'),
('pepsi100', '7 up Nimbooz', 20, 20, 'Soft-drinks', 'lemon', 'https://media.starquik.com/catalog/product/SQ105015.jpg'),
('pepsi101', 'Pepsi', 15, 35, 'Soft-drinks', 'cola', 'https://m.media-amazon.com/images/I/51pGxfs4w1L.jpg');

CREATE TABLE `biscuits` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `biscuits` (`ID`, `Name`, `Quantity`, `Price`, `Class`, `Sub_Class`, `url`) VALUES
('brit100', 'Britannia Tiger Krunch Chocochips', 24, 10, 'Sweet', 'Chocolate', 'https://www.bigbasket.com/media/uploads/p/l/40001621-2_7-britannia-tiger-krunch-chocochip-biscuits.jpg'),
('brit101', 'Britannia Jim-Jam', 38, 35, 'Sweet', 'Vanilla Cream', 'https://m.media-amazon.com/images/I/61m7bY5QG6L.jpg'),
('brit102', 'Britannia Milk Bikis', 26, 50, 'Sweet', 'Plain', 'https://m.media-amazon.com/images/I/71Wp9Qnc4vL.jpg'),
('brit103', 'Britannia Good Day Pista Badam', 25, 10, 'Sweet', 'Nuts', 'https://www.bigbasket.com/media/uploads/p/l/40075985-2_6-britannia-good-day-pista-badam-cookies.jpg'),
('cad100', 'Cadbury Oreo Chocolate Biscuits', 40, 10, 'Sweet', 'Chocolate Cream', 'https://m.media-amazon.com/images/I/711k69NXI7L.jpg'),
('cad101', 'Cadbury Oreo Vanilla Biscuits', 30, 10, 'Sweet', 'Vanilla Cream', 'https://www.bigbasket.com/media/uploads/p/l/100423120_37-cadbury-oreo-creame-biscuit-vanilla.jpg'),
('cad102', 'Cadbury Bournvita Biscuits', 12, 10, 'Sweet', 'Chocolate Glucose', 'https://m.media-amazon.com/images/I/61yelFwXpPL.jpg'),
('lot100', 'Lotte Choco Pie', 30, 10, 'Sweet', 'Chocolate Vanilla', 'https://rukminim2.flixcart.com/image/850/1000/kingqkw0-0/cookie-biscuit/w/u/h/336-chocopie-12-pcs-28gram-x-12-lotte-original-imafyeahyqhpr8ak.jpeg?q=90'),
('par100', 'Parle G', 50, 5, 'Sweet', 'Glucose', 'https://m.media-amazon.com/images/I/71bufOt9zAL._AC_UF1000,1000_QL80_.jpg'),
('par101', 'Parle Hide & Seek', 28, 30, 'Sweet', 'Chocolate', 'https://5.imimg.com/data5/CO/RU/MF/SELLER-107310956/parle-hide-and-seek-chocolate-chip-cookies-biscuit.jpg'),
('par102', 'Parle Marie Gold', 15, 40, 'Sweet', 'Plain', 'https://m.media-amazon.com/images/I/619MnBrITbL.jpg'),
('par103', 'Parle Krackjack Butter Masala', 22, 20, 'Masala', 'Sweet & Salty', 'https://m.media-amazon.com/images/I/71knH3S9QML.jpg'),
('par104', 'Parle Monaco', 20, 15, 'Masala', 'Sweet & Salty', 'https://m.media-amazon.com/images/I/51lyJwurJjL._AC_UF1000,1000_QL80_.jpg'),
('sun100', 'Sunfeast Glucose Plus', 31, 10, 'Sweet', 'Glucose', 'https://m.media-amazon.com/images/I/81hcNWDLlOL._AC_UF1000,1000_QL80_.jpg'),
('sun101', 'Sunfeast Dark Fantasy Coffee Fills', 15, 20, 'Sweet', 'Chocolate Cream', 'https://www.jiomart.com/images/product/original/490935070/sunfeast-dark-fantasy-coffee-fills-cookie-75-g-product-images-o490935070-p490935070-1-202207041225.jpg?im=Resize=(1000,1000)'),
('uni100', 'Unibic Sugar-Free Cashew', 10, 35, 'Sweet', 'Nuts', 'https://www.bigbasket.com/media/uploads/p/l/30004676_7-unibic-sugar-free-cashew-cookies.jpg');

CREATE TABLE `dairy` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `dairy` (`ID`, `Name`, `Quantity`, `Price`, `Class`, `Sub_Class`, `url`) VALUES
('amul100', 'Amul Masti Buttermilk', 56, 15, 'Liquid', 'Buttermilk', 'https://www.bigbasket.com/media/uploads/p/l/161899-2_9-amul-masti-buttermilk-spice.jpg'),
('amul101', 'Amul Kool Cold Cafe', 32, 25, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/l/20005989_2-amul-kool-cafe.jpg'),
('amul108', 'Amul Kool Kesar', 8, 25, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/xxl/40005022_4-amul-kool-kesar.jpg'),
('amul102', 'Amul Paneer 200g', 10, 80, 'Solid', 'Cheese', 'https://www.jiomart.com/images/product/original/490174895/amul-fresh-paneer-200-g-pack-product-images-o490174895-p490174895-0-202203170432.jpg?im=Resize=(1000,1000)'),
('amul103', 'Amul Milk - Toned', 20, 54, 'Liquid', 'Milk', 'https://www.jiomart.com/images/product/original/590049234/amul-toned-fresh-milk-500-ml-pouch-0-20210118.jpg?im=Resize=(1000,1000)'),
('amul104', 'Amul Milk - Full Cream Tetra Pack', 15, 76, 'Liquid', 'Milk', 'https://www.bigbasket.com/media/uploads/p/l/104707_8-amul-homogenised-standardised-milk.jpg'),
('amul105', 'Amul Lassi', 25, 20, 'Liquid', 'Buttermilk Curd', 'https://www.jiomart.com/images/product/original/491209195/amul-lassi-250-ml-tetra-pak-product-images-o491209195-p590086916-0-202203150032.jpg?im=Resize=(1000,1000)'),
('amul106', 'Amul Curd', 11, 40, 'Liquid', 'Yogurt', 'https://www.jiomart.com/images/product/original/491321585/amul-masti-dahi-400-g-cup-product-images-o491321585-p590032907-0-202203160141.jpg?im=Resize=(1000,1000)'),
('amul107', 'Amul Butter', 19, 55, 'Solid', 'Butter', 'https://m.media-amazon.com/images/I/51KrxEKN58L.jpg\r\n'),
('amul108', 'Amul Kool Kesar', 8, 25, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/m/40005022_4-amul-kool-kesar.jpg'),
('an100', 'Ananda Paneer 370g', 5, 82, 'Solid', 'Cheese', 'https://www.jiomart.com/images/product/original/492507118/ananda-premium-paneer-370-g-pack-product-images-o492507118-p590840990-0-202210061716.jpg?im=Resize=(1000,1000)'),
('ca100', 'Cavins Strawberry Milk', 12, 30, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/l/1203536-2_3-cavins-milkshake-strawberry.jpg'),
('ca101', 'Cavins Chocolate Milk', 14, 30, 'Liquid', 'Flavoured Milk', 'https://www.bigbasket.com/media/uploads/p/l/1207041-2_3-cavins-milkshake-chocolate.jpg'),
('md100', 'Mother Dairy Buttermilk', 12, 14, 'Liquid', 'Buttermilk', 'https://m.media-amazon.com/images/I/61f3yvwghdL.jpg'),
('md101', 'Mother Dairy Toned Milk', 7, 58, 'Liquid', 'Milk', 'https://daily.myindianbrand.com/wp-content/uploads/2023/01/Mother-Dairy-Toned-Milk-1l.webp'),
('md102', 'Mother Dairy Curd', 7, 35, 'Liquid', 'Yogurt', 'https://www.bigbasket.com/media/uploads/p/l/40004532_8-mother-dairy-dahi-made-from-toned-milk.jpg'),
('nu100', 'Nutrilite Butter 100g', 5, 45, 'Solid', 'Butter', 'https://m.media-amazon.com/images/I/71zFOihKNTL.jpg');

CREATE TABLE `household` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `household` (`ID`, `Name`, `Quantity`, `Price`, `Class`, `Sub_Class`, `url`) VALUES
('class100', 'Classmate Notebook', 12, 150, 'Stationary', 'Notebook', 'https://5.imimg.com/data5/ZQ/ZU/WY/SELLER-76577611/classmate-notebook.jpg'),
('dura100', 'Duracell Battery 4 pack', 10, 190, 'Battery', 'Battery', 'https://m.media-amazon.com/images/I/716LbzifAgL.jpg'),
('gn100', 'Good Knight Mosquito Repellent Refill', 30, 80, 'Repellent', 'Repellent', 'https://www.bigbasket.com/media/uploads/p/l/199522-2_2-good-knight-power-activ-mosquito-repellent-refill.jpg'),
('gn101', 'Good Knight Mosquito Repellent Coil', 14, 39, 'Repellent', 'Repellent', 'https://m.media-amazon.com/images/I/51cLjLQPsIL._AC_UF1000,1000_QL80_.jpg'),
('surf100', 'Surf Excel Liquid Detergent', 5, 490, 'Detergent', 'Laundry', 'https://cdn.shopify.com/s/files/1/0523/9934/1736/products/40077760_8-surf-excel-matic-liquid-top-load.jpg?v=1636611334'),
('surf101', 'Tide Matic Liquid Detergent', 8, 430, 'Detergent', 'Laundry', 'https://m.media-amazon.com/images/I/61HyGPPY0cL._AC_UF894,1000_QL80_.jpg'),
('surf102', 'Rin Detergent Bar', 41, 25, 'Detergent', 'Laundry', 'https://m.media-amazon.com/images/I/81ZYhx-q7tL.jpg'),
('tiss100', 'Tissue 100 pc', 25, 42, 'Tissue', 'Tissue', 'https://lh3.googleusercontent.com/vz8shnS5A_Psnf1aIP8HGtkVMbDGtppQdLqf1em3_8Q5oZhC-_maIraVOqznnSWI7SwM18zJqSoIM-KLBknSp88NtP4ROpYsP2kAkenm_w=w400-rw'),
('tiss101', 'Toilet Paper roll', 17, 70, 'Tissue', 'Tissue', 'https://5.imimg.com/data5/YB/OP/MY-16233208/toilet-tissue-paper.jpg'),
('vim100', 'Vim Lemon Dishwash Liquid Soap', 11, 125, 'Detergent', 'Utensil', 'https://ml0co0iaphua.i.optimole.com/w:1000/h:1000/q:mauto/f:avif/https://gharstuff.com/wp-content/uploads/2018/11/Vim-Lemon-Dishwash-Gel-250-ml.jpg'),
('vim101', 'Vim Lemon Dishwash Bar', 22, 21, 'Detergent', 'Utensil', 'https://res.fkhealthplus.com/incom/images/product/Vim-Lemons-Dishwash-Bar-1635397830-10092500-1.jpg');

CREATE TABLE `instant_food` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `instant_food` (`ID`, `Name`, `Quantity`, `Price`, `Class`, `Sub_Class`, `url`) VALUES
('maggi100', 'Maggi Masala Noodles', 40, 12, 'Noodles', 'Noodles', 'https://fetchnbuy.in/cdn/shop/products/81RW3B40z0S._SL1500_7e461e21-b5fc-4caf-a865-cca5db33fdb9_grande.jpg?v=1647334133'),
('maggi101', 'Maggi Masala Cuppa Cup Noodles', 30, 50, 'Noodles', 'Noodles', 'https://m.media-amazon.com/images/I/812ySd81W+L.jpg'),
('maggi102', 'Maggi Cheese Pasta', 10, 32, 'Noodles', 'Pasta', 'https://m.media-amazon.com/images/I/814IwSgAHQL._AC_UF1000,1000_QL80_.jpg'),
('nis100', 'Nissin Masala Cup Noodles', 25, 50, 'Noodles', 'Noodles', 'https://cdn.dotpe.in/longtail/store-items/CM_7005/4688.jpg'),
('nognshim100', 'Nongshim Shin Ramyun Noodles', 10, 120, 'Noodles', 'Noodles', 'https://www.chennaigrocers.com/cdn/shop/products/NONGSHIM-SHIN-RAMYUN-NOODLE-SOUP-120G.jpg?v=1653371969'),
('sun100', 'Sunfeast Yippie Magic Masala Noodles', 14, 12, 'Noodles', 'Noodles', 'https://m.media-amazon.com/images/I/81crqoNuDPL.jpg'),
('sun101', 'Sunfeast Masala Tricolor Pasta', 9, 28, 'Noodles', 'Pasta', 'https://m.media-amazon.com/images/I/81T7leUDxFL._AC_UF1000,1000_QL80_.jpg');

CREATE TABLE `personal_care` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `personal_care` (`ID`, `Name`, `Quantity`, `Price`, `Class`, `Sub_Class`, `url`) VALUES
('cinthol100', 'Cinthol Fresh Lime Bath Soap', 15, 25, 'Bath', 'Soap', 'https://m.media-amazon.com/images/I/51FDCPRU6mL.jpg'),
('cinthol101', 'Cinthol Cool Bath Soap', 16, 25, 'Bath', 'Soap', 'https://www.bigbasket.com/media/uploads/p/l/100610249-2_6-cinthol-cool-bathing-soap-with-menthol-active-deo-fragrance-provides-germ-protection.jpg'),
('col100', 'Colgate Strong Teeth', 23, 55, 'Toothpaste', 'Fresh', 'https://m.media-amazon.com/images/I/51fkA5yY2rL._AC_SS300_.jpg'),
('col101', 'Colgate Vedshakti', 12, 212, 'Toothpaste', 'Ayurvedic', 'https://m.media-amazon.com/images/I/61XXPTT0fIL._AC_UF1000,1000_QL80_.jpg'),
('dab102', 'Dabur Red', 11, 60, 'Toothpaste', 'Ayurvedic', 'https://m.media-amazon.com/images/I/71yOuMXIRYL._AC_UF1000,1000_QL80_.jpg'),
('dettol100', 'Dettol Original Hand Wash', 12, 75, 'Handwash', 'Handwash', 'https://m.media-amazon.com/images/I/51WU9rX6HfL.jpg'),
('dettol101', 'Dettol Sensitive Hand Wash', 9, 75, 'Handwash', 'Handwash', 'https://m.media-amazon.com/images/I/4141kbYhM4L.jpg'),
('dettol103', 'Dettol Cool Hand Wash', 10, 75, 'Handwash', 'Handwash', 'https://m.media-amazon.com/images/I/51NOg+tTypL.jpg'),
('dove100', 'Dove Cream Beauty Bathing Soap', 13, 40, 'Bath', 'Soap', 'https://m.media-amazon.com/images/I/51nf-MK31vL.jpg'),
('dove101', 'Dove Hair Fall Rescue Shampoo', 10, 150, 'Bath', 'Shampoo', 'https://m.media-amazon.com/images/I/41nqkG-bxLL.jpg'),
('dove102', 'Dove Deep Moisture Body Wash', 16, 199, 'Bath', 'Shower gel', 'https://m.media-amazon.com/images/I/51d-5vxGytL.jpg'),
('durex100', 'Durex Air Ultra Thin Condom', 14, 90, 'Wellness', 'sexual', 'https://m.media-amazon.com/images/I/61YU3TyIjJL.jpg'),
('durex101', 'Durex Skin-on-skin real feel Condom', 9, 165, 'Wellness', 'sexual', 'https://m.media-amazon.com/images/I/61rPL3Lm6rL.jpg'),
('gil100', 'Gillette Guard One time Razor', 40, 15, 'Grooming', 'Shave', 'https://m.media-amazon.com/images/I/619P0O-EOdL.jpg'),
('gil101', 'Gillette Regular Shaving Foam', 20, 90, 'Grooming', 'Shave', 'https://m.media-amazon.com/images/I/51jUiFsguvL.jpg'),
('him100', 'Himalaya Neem Facewash', 19, 199, 'Bath', 'Facewash', 'https://m.media-amazon.com/images/I/51V1zNFpLFL.jpg'),
('john100', 'Johnson\'s Baby Shampoo', 8, 185, 'Bath', 'Shampoo', 'https://m.media-amazon.com/images/I/41o5uaNcVrL._AC_UF894,1000_QL80_.jpg'),
('kama100', 'Kamasutra Dotted Condom', 11, 90, 'Wellness', 'sexual', 'https://m.media-amazon.com/images/I/615PwFJeGaL.jpg'),
('khadi100', 'Khadi Essentials Aloe Vera Shampoo', 7, 120, 'Bath', 'Shampoo', 'https://cdn.grofers.com/app/images/products/full_screen/pro_461311.jpg?ts=1685979846'),
('khadi101', 'Khadi Neem & Tea Tree Facewash', 11, 119, 'Bath', 'Facewash', 'https://m.media-amazon.com/images/I/51VxQ5H-t1L._AC_UF1000,1000_QL80_.jpg'),
('nivea100', 'Nivea Body Milk Nourishing Lotion', 9, 110, 'Grooming', 'Cream', 'https://m.media-amazon.com/images/I/71x9rDuE3oL.jpg'),
('nivea101', 'Nivea Cocoa Nourish Body Lotion', 12, 125, 'Grooming', 'Cream', 'https://cdn01.pharmeasy.in/dam/products_otc/I40912/nivea-cocoa-nourish-body-lotion-bottle-of-400-ml-2-1679372252.jpg'),
('nivea102', 'Nivea Men Pure Impact Shower Gel', 8, 180, 'Bath', 'Shower gel', 'https://m.media-amazon.com/images/I/61t4ulzaJ0L.jpg'),
('nivea103', 'Nivea Waterlily & Oil Shower Gel', 7, 190, 'Bath', 'Shower gel', 'https://m.media-amazon.com/images/I/61CPQ4ZL4wL.jpg'),
('nivea104', 'Nivea Men Fresh Active Roll on', 8, 150, 'Grooming', 'Fragrance', 'https://m.media-amazon.com/images/I/413r20qx3tL._AC_UF1000,1000_QL80_.jpg'),
('nivea105', 'Nivea Women Smooth Skin Roll on', 6, 150, 'Grooming', 'Fragrance', 'https://m.media-amazon.com/images/I/51GPoF39hUL.jpg'),
('nivea106', 'Nivea Men Fresh Active Deo Spray', 13, 125, 'Grooming', 'Fragrance', 'https://m.media-amazon.com/images/I/51QvV1HZo7L._AC_UF1000,1000_QL80_.jpg'),
('nivea107', 'Nivea Women Pearl & Beauty Deo Spray', 15, 125, 'Grooming', 'Fragrance', 'https://assets.ajio.com/medias/sys_master/root/20230117/CRVQ/63c6487ff997dd708e0c172f/-473Wx593H-4906803900-multi-MODEL.jpg'),
('para100', 'Parachute 100% Pure Coconut Oil', 13, 60, 'Oil', 'Coconut', 'https://m.media-amazon.com/images/I/51zTPT5QTCL.jpg'),
('siro100', 'Sirona Premium Tampons', 10, 199, 'Wellness', 'tampons', 'https://cdn01.pharmeasy.in/dam/products_otc/I48474/sirona-premium-digital-tampon-heavy-flow-packet-of-20-2-1652368490.jpg'),
('stay100', 'Stayfree Secure Nights Sanitary Pads', 18, 130, 'Wellness', 'pads', 'https://www.jiomart.com/images/product/original/492172032/stayfree-secure-nights-cottony-soft-comfort-sanitary-napkin-20-pads-product-images-o492172032-p590361094-0-202303241242.jpg?im=Resize=(420,420)'),
('whis100', 'Whisper Choice Sanitary Pads', 20, 99, 'Wellness', 'pads', 'https://m.media-amazon.com/images/I/41TOfYCmKvL.jpg');

CREATE TABLE `snacks` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Class` varchar(30) DEFAULT NULL,
  `Sub_Class` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `snacks` (`ID`, `Name`, `Quantity`, `Price`, `Class`, `Sub_Class`, `url`) VALUES
('act100', 'Act II Butter Popcorn', 40, 25, 'Namkeen', 'Snacks', 'https://ml0co0iaphua.i.optimole.com/w:1000/h:1000/q:mauto/f:avif/https://gharstuff.com/wp-content/uploads/2020/08/Act-II-Butter-Popcorn-27g.jpg'),
('bik100', 'Bikano Bikaneri Bhujia', 14, 59, 'Namkeen', 'Namkeen', 'https://rukminim2.flixcart.com/image/850/1000/xif0q/snack-savourie/h/n/3/-original-imaghhngyszjj9fa.jpeg?q=90'),
('bing100', 'Bingo Mad Angles Tomato Madness', 10, 25, 'Namkeen', 'Snacks', 'https://fetchnbuy.in/cdn/shop/products/Bingo-Tomato-Madness._grande.jpg?v=1637485784'),
('choco103', 'Cadbury Silk Oreo', 23, 85, 'Chocolate', 'Sweet', 'https://m.media-amazon.com/images/I/51A11QM92LL._AC_UF1000,1000_QL80_.jpg'),
('hald100', 'Haldiram\'s Plain Bhujia', 7, 56, 'Namkeen', 'Namkeen', 'https://www.gargstore.com/wp-content/uploads/2021/10/HALBHP401-1.jpg'),
('hald101', 'Haldiram\'s Punjabi Tadka', 8, 56, 'Namkeen', 'Namkeen', 'https://dbigmart.com/wp-content/uploads/2021/02/Haldirams-Punjabi-tadka.jpg'),
('hald102', 'Haldiram\'s Aloo Bhujia', 12, 55, 'Namkeen', 'Namkeen', 'https://www.bigbasket.com/media/uploads/p/xxl/70000800_3-haldirams-namkeen-aloo-bhujia-del.jpg'),
('kurk100', 'Kurkure Puffcorn', 11, 20, 'Namkeen', 'Snacks', 'https://m.media-amazon.com/images/I/81wJJZZ7XuL.jpg'),
('kurk101', 'Kurkure Masala Munch Chips', 23, 20, 'Namkeen', 'Snacks', 'https://m.media-amazon.com/images/I/71sOPzrW0mL._AC_UF1000,1000_QL80_.jpg'),
('lays100', 'Lays Magic Masala Chips', 40, 20, 'Namkeen', 'Snacks', 'https://m.media-amazon.com/images/I/71HyeSkXm0L._UF1000,1000_QL80_.jpg'),
('lays101', 'Lays Cream & Onion Chips', 33, 20, 'Namkeen', 'Snacks', 'https://m.media-amazon.com/images/I/71kOsITKSkL._UF1000,1000_QL80_.jpg'),
('unc100', 'Uncle Chips Spicy Treat', 14, 30, 'Namkeen', 'Snacks', 'https://m.media-amazon.com/images/I/71D-uHUk7OL.jpg'),
('unc101', 'Uncle Chips Plain Salted', 14, 30, 'Namkeen', 'Snacks', 'https://m.media-amazon.com/images/I/71y5vh3UxCL.jpg');


ALTER TABLE `beverages`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `biscuits`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `dairy`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `household`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `instant_food`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `personal_care`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `snacks`
  ADD PRIMARY KEY (`ID`);
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
