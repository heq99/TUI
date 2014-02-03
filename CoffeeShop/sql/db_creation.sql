DROP TABLE IF EXISTS PRODUCT_ATTRIBUTE_VALUE;
DROP TABLE IF EXISTS PRODUCT_ATTRIBUTE;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS PRODUCT_TYPE;
DROP TABLE IF EXISTS PRODUCT_BRAND;

CREATE TABLE PRODUCT_TYPE (
		ID INTEGER PRIMARY KEY,
		NAME VARCHAR(32),
		DESCRIPTION VARCHAR(1024)
	);

CREATE TABLE PRODUCT_BRAND (
		ID INTEGER PRIMARY KEY,
		NAME VARCHAR(16),
		LOCATION VARCHAR(255)
	);

CREATE TABLE PRODUCT (
		ID INTEGER PRIMARY KEY,
		NAME VARCHAR(32),
		DESCRIPTION VARCHAR(1024),
		DEFAULT_PRICE INTEGER NOT NULL,
		PRODUCT_BRAND_ID INTEGER,
		PRODUCT_TYPE_ID INTEGER,
		FOREIGN KEY (PRODUCT_BRAND_ID) REFERENCES PRODUCT_BRAND(ID),
		FOREIGN KEY (PRODUCT_TYPE_ID) REFERENCES PRODUCT_TYPE(ID)
	);

CREATE TABLE PRODUCT_ATTRIBUTE (
		ID INTEGER PRIMARY KEY,
		NAME VARCHAR(32),
		DESCRIPTION VARCHAR(1024),
		MANDATORY BOOLEAN,
		PRODUCT_ID INTEGER,
		FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID)
	);

CREATE TABLE PRODUCT_ATTRIBUTE_VALUE (
		ID INTEGER PRIMARY KEY,
		VALUE VARCHAR(128),
		DESCRIPTION VARCHAR(1024),
		PRICE INTEGER,
		PRODUCT_ATTRIBUTE_ID INTEGER,
		FOREIGN KEY (PRODUCT_ATTRIBUTE_ID) REFERENCES PRODUCT_ATTRIBUTE(ID)
	);

insert into PRODUCT_BRAND ("ID", "NAME", "LOCATION") values(1, 'Costa', '/resources/pic/costa.jpg');
insert into PRODUCT_BRAND ("ID", "NAME", "LOCATION") values(2, 'Nero', '/resources/pic/nero.jpg');

insert into PRODUCT_TYPE ("ID", "NAME", "DESCRIPTION") values(1, 'Coffee', 'Coffee');
insert into PRODUCT_TYPE ("ID", "NAME", "DESCRIPTION") values(2, 'Cake', 'Delicious cake');

insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(1, 'Flat White', 'A rich, full-flavoured coffee with a velvety, smooth texture finished with a distinctive leaf pattern.',0 , 1, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(2, 'Cappuccino', 'Espresso with steamed, frothy milk and chocolate dusting, perfect to enjoy at any time of day',0 , 1, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(3, 'Caffé Latte', 'It''s simply made with espresso and fresh steamed milk, It''s also simply delicious.',0 , 1, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(4, 'Americano', 'A smooth coffee that mixes shots of espresso with hot water. Add milk if you like.',0 , 1, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(5, 'Espresso', 'Small in stature but intense in taste, our perfectly poured espresso packs a mighty punch.',0 , 1, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(6, 'Belgian Chocolate Teacake', 'Cakes', 199, 1, 2);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(7, 'Chocolate Orange Window Cake', 'Cakes', 199, 1, 2);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(8, 'Layered Carrot Cake', 'Cakes', 199, 1, 2);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(9, 'Lemon Cake', 'Cakes', 199, 1, 2);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(10, 'Espresso', 'The heart of every Caffè Nero coffee drink and one of the hardest to get right. A single espresso consists of 7 grams of coffee, tamped just right. The espresso should pour out of the handle like ''honey off a spoon'' -not too fast and not too slow. When our baristas train in making espresso they time their pour. The perfect espresso will have a good golden brown ''crema'' which reforms when stirred.', 0, 2, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(11, 'Cappuccino', 'The classic Italian morning tradition. Our unique blend of espresso combined with steamed velvety milk and sealed with a frothy dome. And yes you can have a light dusting of chocolate powder which provides an optional finishing touch although most Italians would refrain!', 0, 2, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(12, 'Caffé Latte', 'The all day classic. A strong base of our rich and tasty espresso, blended with plenty of steamed milk and finished with a layer of milk froth, creates a wonderful flavour. ', 0, 2, 1);
insert into PRODUCT ("ID", "NAME", "DESCRIPTION", "DEFAULT_PRICE", "PRODUCT_BRAND_ID", "PRODUCT_TYPE_ID") values(13, 'Caffé Mocha', 'This indulgent coffee features a strong base of our distinctively rich espresso, blended with rich chocolate and steamed milk, topped with cream, then dusted with chocolate. ', 0, 2, 1);

insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(1, 'Milk', 'Milk of a coffee, skimmed, soya milk etc', 1, 1);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(2, 'Size', 'Size of the cup of a coffee.', 1, 2);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(3, 'Milk', 'Milk of a coffee, skimmed, soya milk etc', 1, 2);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(4, 'Size', 'Size of the cup of a coffee.', 1, 3);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(5, 'Milk', 'Milk of a coffee, skimmed, soya milk etc', 1, 3);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(6, 'Size', 'Size of the cup of a coffee.', 1, 4);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(7, 'Milk', 'Milk of a coffee, skimmed, soya milk etc', 1, 4);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(8, 'Size', 'Size of the cup of a coffee.', 1, 5);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(9, 'Size', 'Size of the cup of a coffee.', 1, 11);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(10, 'Milk', 'Milk of a coffee, skimmed, soya milk etc', 1, 11);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(11, 'Size', 'Size of the cup of a coffee.', 1, 12);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(12, 'Milk', 'Milk of a coffee, skimmed, soya milk etc', 1, 12);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(13, 'Size', 'Size of the cup of a coffee.', 1, 13);
insert into PRODUCT_ATTRIBUTE ("ID", "NAME", "DESCRIPTION", "MANDATORY", "PRODUCT_ID") values(14, 'Milk', 'Milk of a coffee, skimmed, soya milk etc', 1, 13);

insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(1, 'None', 'No milk', null, 1);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(2, 'Skimmed', 'Skimmed milk', null, 1);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(3, 'Full Fat', 'Full Fat milk', null, 1);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(4, 'Soya', 'Soya milk', null, 1);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(5, 'Primo', 'Small size', 205, 2);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(6, 'Medio', 'Medium size', 235, 2);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(7, 'Massimo', 'Large size', 275, 2);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(8, 'None', 'No milk', null, 3);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(9, 'Skimmed', 'Skimmed milk', null, 3);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(10, 'Full Fat', 'Full Fat milk', null, 3);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(11, 'Soya', 'Soya milk', null, 3);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(12, 'Primo', 'Small size', 205, 4);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(13, 'Medio', 'Medium size', 235, 4);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(14, 'Massimo', 'Large size', 275, 4);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(15, 'None', 'No milk', NULL, 5);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(16, 'Skimmed', 'Skimmed milk', NULL, 5);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(17, 'Full Fat', 'Full Fat milk', NULL, 5);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(18, 'Soya', 'Soya milk', NULL, 5);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(19, 'Primo', 'Small size', 215, 6);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(20, 'Medio', 'Medium size', 245, 6);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(21, 'Massimo', 'Large size', 285, 6);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(22, 'None', 'No milk', NULL, 7);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(23, 'Skimmed', 'Skimmed milk', NULL, 7);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(24, 'Full Fat', 'Full Fat milk', NULL, 7);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(25, 'Soya', 'Soya milk', NULL, 7);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(26, 'Solo', 'Solo size', 225, 8);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(27, 'Doppio', 'Doppio size', 295, 8);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(28, 'Regular', 'Regular size', 225, 9);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(29, 'Grande', 'Grande size', 265, 9);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(30, 'None', 'No milk', NULL, 10);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(31, 'Skimmed', 'Skimmed milk', NULL, 10);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(32, 'Soya', 'Soya milk', NULL, 10);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(33, 'Regular', 'Regular size', 225, 11);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(34, 'Grande', 'Grande size', 265, 11);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(35, 'None', 'No milk', NULL, 12);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(36, 'Skimmed', 'Skimmed milk', NULL, 12);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(37, 'Soya', 'Soya milk', NULL, 12);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(38, 'Regular', 'Regular size', 255, 13);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(39, 'None', 'No milk', NULL, 14);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(40, 'Skimmed', 'Skimmed milk', NULL, 14);
insert into PRODUCT_ATTRIBUTE_VALUE ("ID", "VALUE", "DESCRIPTION", "PRICE", "PRODUCT_ATTRIBUTE_ID") values(41, 'Soya', 'Soya milk', NULL, 14);

