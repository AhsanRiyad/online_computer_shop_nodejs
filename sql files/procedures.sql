-- run procedures individually

-- cart procedure starts

/

drop function enable_trigger;

/

drop function disable_trigger;

/






/



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


END add_to_cart;

-- cart procedure ends



-- cart procedure test starts
/*DECLARE
cart_count  number(10);
status  VARCHAR(50);

BEGIN
add_to_cart(1 ,1 , 1 , cart_count , status);
DBMS_OUTPUT.put_line(status);
END;*/

-- cart procedure test ends

/



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

END make_order;
-- oracle make_order procedure ends




/




-- add_review procedure starts

CREATE OR REPLACE PROCEDURE ADD_REVIEW(
  uid IN review.user_id%type , 
  pid IN review.product_id%type ,
  rev_text IN  review.review_text%type,
  status OUT VARCHAR)
  
  IS

rev_id  review.review_id%type;

BEGIN
status := 'DONE'; 

SELECT review_id INTO rev_id FROM review WHERE product_id = pid and user_id = uid;


IF rev_id IS NOT NULL
THEN

UPDATE review SET review_text= rev_text , review_date= to_char(sysdate) WHERE product_id= pid AND user_id= uid;
status := 'UPDATED';


END IF;



Exception
when no_data_found THEN
status := 'NO DATA FOUND , NEW_ADDED';


INSERT INTO review(review_id ,  review_text, review_date, product_id, user_id) VALUES (review_seq.nextval ,  rev_text , to_char(sysdate) , pid , uid ) ; 



when others THEN
status := 'OTHERS EXCEPTION'; 

END ADD_REVIEW;


/
-- add_review procedure ends


-- test case

/*declare
status Varchar(50);
rev_id number(2) ; 
begin

add_review(1,1, 'gae' , status);
DBMS_OUTPUT.put_line(status);

DBMS_OUTPUT.put_line('helllow');

end;

select review_id into rev_id from review;*/


create or replace procedure disable_trigger(triggerName IN varchar)
IS
begin
EXECUTE IMMEDIATE 'ALTER trigger ' || triggerName || ' disable';
end;


/


create or replace procedure enable_trigger(triggerName IN varchar)
IS
begin
EXECUTE IMMEDIATE 'ALTER trigger ' || triggerName || ' enable';
end;


/



/*
begin
disable_trigger('NEG_PRICE');
end;
*/


/*
create or replace procedure custome_trigger_p(start_time IN number , end_time IN number)
is
begin

EXECUTE IMMEDIATE 'create or replace trigger custom_trigger  before insert or update or delete on user_table
begin
if to_char(sysdate ,' || 'HH24'||') not between' || start_time || 'and' || end_time
|| 'then' ||
'raise_application_error(' || '-20201' ||  ',' || 'restricted' ||');' ||
'end if;
end custom_trigger;';


end;
*/


drop function valid_status;
/

create or replace function valid_status(descrip in promo.promo_desc%type)
return boolean
is
cursor c1
is
select PROMO_DESC from promo;
begin
for i in c1 loop
if i.PROMO_DESC =descrip then
return true;
end if;
end loop;
return false;
end;


/


create or replace procedure perc(descrip in promo.promo_desc%type,percentage out promo.promo_percentage%type)
is
begin
if valid_status(descrip) then

select promo_percentage into percentage from promo where promo_desc=descrip;
else
percentage:=0;
end if;
end;

/

/*
declare
descrip promo.promo_desc%type:=:value_p;
percentage promo.promo_percentage%type;
begin
perc(descrip,percentage);
dbms_output.put_line(percentage);
end;

SET SERVEROUTPUT ON


*/



commit;