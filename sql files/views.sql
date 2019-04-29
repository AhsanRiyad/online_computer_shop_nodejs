
/

drop view cart_count;

/


create or replace view cart_count as
select count(*) as "cart item" from cart
select * from cart_count;

/


commit;


