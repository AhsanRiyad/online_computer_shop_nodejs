DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_t`(IN `uid` INT, IN `o_date` DATE, IN `p_method` VARCHAR(20))
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
END$$
DELIMITER ;





-- oracle make_order procedure starts


CREATE OR REPLACE PROCEDURE make_order(
uid IN cart.USER_ID%type,
p_method IN order_t.payment_method%type,
status OUT varchar
)
IS

p_id cart.product_id%type;
qntity cart.quantity%type;
o_no order_t.order_id%type;

CURSOR cur_1
is
SELECT product_id , quantity FROM CART WHERE user_id = uid;



BEGIN

select max(order_id) into o_no from order_t;

IF o_no is NULL THEN
o_no:=1;
END if;

INSERT INTO order_t(order_id, order_date, payment_method,  user_id) VALUES (o_no+1 , to_char(sysdate) , p_method , uid );

for i in cur_1 loop

INSERT INTO order_includ_product(order_id, product_id, qntity) VALUES (o_no+1 , i.product_id , i.quantity);


END LOOP;

DELETE FROM cart WHERE user_id = uid;

status :='data found , added';





EXCEPTION
when no_data_found THEN
o_no := 0;




INSERT INTO order_t(order_id, order_date, payment_method,  user_id) VALUES (o_no+1 , to_char(sysdate) , p_method , uid );


for i in cur_1 loop

INSERT INTO order_includ_product(order_id, product_id, qntity) VALUES (o_no+1 , i.product_id , i.quantity);


END LOOP;

DELETE FROM cart WHERE user_id = uid;


status := 'no data found , inserted';

when others THEN
status := 'other EXCEPTION ';

END;
-- oracle make_order procedure ends