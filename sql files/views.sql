
/

drop view cart_count;

/


create or replace view cart_count as
select count(*) as "cart item" from cart;


/


/

drop view cart_products;

/

create or replace view cart_products as
select c.user_id as uuid ,  p.product_id , pr.product_name , pr.product_price , p.product_qntity , pr.DESCRIPTIONS ,  (pr.product_price*p.product_qntity) as total from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id; 



/




commit;


