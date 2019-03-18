#working // add to cart
DELIMITER $$
CREATE OR REPLACE PROCEDURE cart(IN pid INT , IN uid INT , IN qnt INT)
BEGIN
DECLARE p_id , c_id , cart_count int; 
DECLARE status VARCHAR(20);

SELECT cart_id  into c_id  FROM `CART` WHERE product_id = pid AND user_id = uid ;
select c_id;
if c_id IS NOT NULL
then
UPDATE `p_include_cart` SET `product_qntity`= product_qntity + qnt WHERE cart_id = c_id;
SET status = 'updated' ; 
select status;
SELECT COUNT(*) into cart_count FROM `cart` WHERE user_id = uid;
select cart_count;
else
INSERT INTO `cart`( `cart_status`, `user_id`,  `product_id`) VALUES ('cart' , uid , pid); 
select max(cart_id) into c_id from cart;
INSERT INTO `p_include_cart`(`cart_id`, `product_id`, `product_qntity`) VALUES (c_id , pid , qnt);
SET status = 'added' ; 
select status;
SELECT COUNT(*) into cart_count FROM `cart` WHERE user_id = uid;
select cart_count;
end if;
END $$








#######################################################
#working // add to cart // latest

DELIMITER $$
CREATE OR REPLACE PROCEDURE cart(IN pid INT , IN uid INT , IN qnt INT)
BEGIN
DECLARE p_id , c_id , cart_count int; 
DECLARE status VARCHAR(20);

SELECT cart_id  into c_id  FROM `CART` WHERE product_id = pid AND user_id = uid ;
select c_id;
if c_id IS NOT NULL
then
UPDATE `p_include_cart` SET `product_qntity`= product_qntity + qnt WHERE cart_id = c_id;
UPDATE `CART` SET `quantity`= quantity + qnt WHERE cart_id = c_id;
SET status = 'updated' ; 
select status;
SELECT COUNT(*) into cart_count FROM `cart` WHERE user_id = uid;
select cart_count;
else
INSERT INTO `cart`( `cart_status`, `user_id`,  `product_id` , `quantity` ) VALUES ('cart' , uid , pid , qnt); 
select max(cart_id) into c_id from cart;
INSERT INTO `p_include_cart`(`cart_id`, `product_id`, `product_qntity`) VALUES (c_id , pid , qnt);
SET status = 'added' ; 
select status;
SELECT COUNT(*) into cart_count FROM `cart` WHERE user_id = uid;
select cart_count;
end if;
END $$









#############################################################
#cart page

DELIMITER $$
CREATE OR REPLACE PROCEDURE cartPage(IN uid INT)
BEGIN
select p.product_id , pr.product_name , pr.product_price , p.product_qntity from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

select SUM(pr.product_price) as total from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

END $$



######################################################
CALL order_t(2 , '2019/12/03' , 'CASH');

#order page
DELIMITER $$
CREATE OR REPLACE PROCEDURE order_t(IN uid INT , IN o_date DATE , IN p_method VARCHAR(20))
BEGIN
DECLARE o_no, p_id , qntity INT;
SELECT MAX(order_id) INTO o_no FROM ORDER_T;
SELECT o_no;
SELECT o_date;
END $$


DELIMITER $$
CREATE OR REPLACE PROCEDURE order_t(IN uid INT , IN o_date DATE , IN p_method VARCHAR(20))
BEGIN
DECLARE o_no, p_id , qntity INT;
DECLARE b INT DEFAULT 0;
DECLARE cur_1 CURSOR FOR 
SELECT product_id FROM CART WHERE user_id = uid;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
SELECT MAX(order_id) INTO o_no FROM ORDER_T;
OPEN cur_1;
REPEAT FETCH cur_1 INTO p_id ; 
END $$







DELIMITER $$
CREATE OR REPLACE PROCEDURE order_t(IN uid INT , IN o_date DATE , IN p_method VARCHAR(20))
BEGIN
DECLARE o_no, p_id , qntity, b INT;
DECLARE cur_1 CURSOR FOR
SELECT * FROM CART WHERE user_id = UID;
SELECT MAX(order_id) INTO o_no FROM ORDER_T;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
OPEN cur_1;
REPEAT FETCH cur_1 INTO p_id ; 
UNTIL b=1
END REPEAT
CLOSE cur_1;
END $$


#########################################################
#WORKING
DELIMITER $$
CREATE OR REPLACE PROCEDURE order_t(IN uid INT , IN o_date DATE , IN p_method VARCHAR(20))
BEGIN
DECLARE o_no, p_id , qntity INT;
DECLARE b INT DEFAULT 0;
DECLARE cur_1 CURSOR FOR 
SELECT product_id FROM CART WHERE user_id = uid;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;
SELECT MAX(order_id) INTO o_no FROM ORDER_T;
OPEN cur_1;
REPEAT FETCH cur_1 INTO p_id ;
UNTIL b = 1
END REPEAT;
CLOSE cur_1;
END $$



##################################################
# working

DELIMITER $$
CREATE OR REPLACE PROCEDURE order_t(IN uid INT , IN o_date DATE , IN p_method VARCHAR(20))
BEGIN
DECLARE o_no, p_id , qntity INT;
DECLARE status VARCHAR(20);
DECLARE b INT DEFAULT 0;
DECLARE cur_1 CURSOR FOR 
SELECT product_id , quantity FROM CART WHERE user_id = uid;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;

SELECT MAX(order_id) INTO o_no FROM ORDER_T;
INSERT INTO `order_t`(`order_id`, `order_date`, `payment_method`,  `user_id`) VALUES (o_no+1 , o_date , p_method , uid );

OPEN cur_1;
REPEAT FETCH cur_1 INTO p_id , qntity ;

INSERT INTO `order_includ_product`(`order_id`, `product_id`, `qntity`) VALUES (o_no+1 , p_id ,qntity);


SELECT p_id , qntity;

UNTIL b = 1
END REPEAT;
CLOSE cur_1;
SET status = 'done' ;
DELETE FROM `cart` WHERE user_id = uid;
SELECT status;
END $$


