DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cartPage`(IN `uid` INT)
BEGIN
select p.product_id , pr.product_name , pr.product_price , p.product_qntity from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

select SUM(pr.product_price) as total from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = uid;

END$$
DELIMITER ;