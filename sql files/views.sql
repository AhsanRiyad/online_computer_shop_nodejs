
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

drop view cart_count;

/
create or replace view cart_count as
select user_id ,  count(*) as cart_count from cart group by user_id;


/


select cart_count from cart_count where USER_ID = 1;

/

/

drop view cart_total_amount;
/
create or replace view cart_total_amount as
select c.user_id as uuid , SUM(pr.product_price*p.product_qntity) as total from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id group by c.user_id;


/

select * from cart_total_amount where uuid = 1;


/

drop view review_view;
/

create or replace view review_view as
select * from review;
/
-- /
-- select * from review_view;
/
-- delete from review_view where review_id = 2









commit;


