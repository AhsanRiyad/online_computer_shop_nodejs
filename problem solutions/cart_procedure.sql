-- mysql

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cart`(IN `pid` INT, IN `uid` INT, IN `qnt` INT)
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
END$$
DELIMITER ;



-- oracle

-- cart procedure starts


CREATE OR REPLACE PROCEDURE add_to_cart(
pid IN cart.PRODUCT_ID%type,
uid IN cart.USER_ID%type,
qnt IN cart.QUANTITY%type,
cart_count OUT number,
status OUT VARCHAR
)
IS
c_id  cart.CART_ID%type;

BEGIN

SELECT cart_id  into c_id  FROM CART WHERE product_id = pid AND user_id = uid ;


UPDATE p_include_cart SET product_qntity= product_qntity + qnt WHERE cart_id = c_id;
UPDATE CART SET quantity= quantity + qnt WHERE cart_id = c_id;
status :='updated';
SELECT COUNT(*) into cart_count FROM cart WHERE user_id = uid;



EXCEPTION
when no_data_found THEN


INSERT INTO cart(CART_ID ,  cart_status, user_id,  product_id , quantity ) VALUES ( ID.nextval , 'cart' , uid , pid , qnt); 
select max(cart_id) into c_id from cart;
INSERT INTO p_include_cart(cart_id, product_id, product_qntity) VALUES (c_id , pid , qnt);

SELECT COUNT(*) into cart_count FROM cart WHERE user_id = uid;

status:='added';

when others THEN

status:='others';


END;

-- cart procedure ends



-- cart procedure test
DECLARE
cart_count  number(10);
status  VARCHAR(50);

BEGIN
add_to_cart(1 ,1 , 1 , cart_count , status);
DBMS_OUTPUT.put_line(status);
END;

