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





#cart page

DELIMITER $$
CREATE OR REPLACE PROCEDURE cartPage(IN uid INT)
BEGIN
select p.product_id , pr.product_name , pr.product_price , p.product_qntity from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

select SUM(pr.product_price) from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

END $$