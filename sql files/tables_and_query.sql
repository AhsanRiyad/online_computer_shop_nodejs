
-- drop table

drop table user_table;

drop table products;

drop table visit;

drop table cart;

drop table categories;

drop table give_review;

drop table order_includ_product;

drop table promo;

drop table review;

drop table p_include_cart;

drop table order_t;

drop sequence reg_seq;

drop sequence id;

drop sequence product_seq;

drop sequence review_seq;





-- user table

create SEQUENCE id
INCREMENT by 1
start with 1
maxvalue 1000
NOCACHE
NOCYCLE ;

create SEQUENCE review_seq
INCREMENT by 1
start with 1
maxvalue 1000
NOCACHE
NOCYCLE ;



create SEQUENCE reg_seq
INCREMENT by 1
start with 1
maxvalue 100
NOCACHE
NOCYCLE ;


create SEQUENCE product_seq
INCREMENT by 1
start with 1
maxvalue 100
NOCACHE
NOCYCLE ;




/*
select sequence_name ,   min_value , min_value , max_value , increment_by , last_number
 from user_sequences;*/





create table user_table
(
u_id number(5),
u_password varchar2(50),
u_address varchar2(50) ,
u_email varchar2(50) unique,
u_mobile number(11) ,
dob date ,
u_status varchar2(50) ,
first_name varchar2(50) ,
last_name varchar2(50) ,
u_type varchar2(50) ,
constraint  g_user_pk primary key(u_id)
);



insert into user_table (u_id, u_password, u_address, u_email, u_mobile, dob, u_status, first_name, last_name , u_type) values('1', '12' , 'tangail' , 'riyad298@gmail.com' , '01919448787' , (TO_DATE('2003/05/03', 'yyyy/mm/dd')) , 'valid' , 'Aiyad' , 'Riyad' , 'admin');


-- products

CREATE TABLE products (
  product_id number(5) ,
  product_name varchar2(50) ,
  product_price number(5) ,
  product_avlble number(5) ,
  product_sell_price number(5) ,
  product_original_price number(5) ,
  category_id number(5) ,
  descriptions varchar2(500) ,
  category_name varchar2(50) ,
  sub_category varchar2(50) 
) ;


INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Monitor LG', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Monitor Samsung ', 343, 34, 235, 2356, 346, 'useful for home', 'monitor', 'samsung');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Monitor Walton', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'walton');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'hard disk 1TB', 343, 34, 235, 2356, 346, 'useful for home', 'hdd', 'toshiba');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'hard disk 2TB', 33, 33, 33, 34, 34, 'useful for home', 'hdd', 'western_digital');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'hard disk 4TB', 33, 33, 33, 34, 34, 'useful for home', 'hdd', 'adata');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Printer Canon', 343, 34, 235, 2356, 346, 'useful for home', 'printer', 'canon');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Printer HP', 33, 33, 33, 34, 34, 'useful for home', 'printer', 'hp');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Ram Transcend', 343, 34, 235, 2356, 346, 'useful for home', 'ram', 'transcend');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Ram Adata', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'adata');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Ram Razor', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'razor');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Motherboard GigaByte', 343, 34, 235, 2356, 346, 'useful for home', 'motherboard', 'gigabyte');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Motherboard Asus', 33, 33, 33, 34, 34, 'useful for home', 'motherboard', 'asus');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Motherboard Intel', 343, 34, 235, 2356, 346, 'useful for home', 'motherboard', 'intel');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Processor Intel', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Processor AMD', 33, 34, 235, 34, 34, 'Computer processor , high quality', 'processor', 'amd');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Monitor LG Full HD', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Monitor LG Full HD', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Monitor Samsung 4K', 343, 34, 235, 2356, 346, 'useful for home', 'monitor', 'samsung');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Monitor Walton Plasma', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'walton');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'hard disk 1TB 5400rpm', 343, 34, 235, 2356, 346, 'useful for home', 'hdd', 'toshiba');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'hard disk 4TB 7200rpm', 33, 33, 33, 34, 34, 'useful for home', 'hdd', 'adata');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Printer Canon For Photos', 343, 34, 235, 2356, 346, 'useful for home', 'printer', 'canon');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Ram Adata 8GB', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'adata');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Ram Razor 16GB', 33, 33, 33, 34, 34, 'useful for home', 'ram', 'razor');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Printer HP 1080P', 33, 33, 33, 34, 34, 'useful for home', 'printer', 'hp');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Motherboard Intel Gaming', 343, 34, 235, 2356, 346, 'useful for home', 'motherboard', 'intel');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Processor Intel Core i3', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Processor Intel Core i5', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel');

INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
(PRODUCT_SEQ.nextval, 'Processor Intel Core i9', 33, 33, 33, 34, 34, 'useful for home', 'processor', 'intel');


-- visit


CREATE TABLE visit (
  product_id number(5) ,
  user_id number(5) ,
  user_ip varchar2(50) ,
  hit_count number(5) ,
  counter number(8) 
) ;


INSERT INTO visit (product_id, user_id, user_ip, hit_count, counter) VALUES
(2, 0, '::1', 0, 20);



-- cart


CREATE TABLE cart (
  cart_id number(5) ,
  cart_status varchar2(50) ,
  user_id number(5) ,
  g_u_type varchar2(50) ,
  order_id number(5) ,
  product_id number(5) ,
  quantity number(5) 
);

-- p_include_cart

CREATE TABLE p_include_cart (
  cart_id number(5) ,
  product_id number(5) ,
  product_qntity number(5) ,
  counter number(8) 
) ;

-- categories



CREATE TABLE categories (
  category_id number(5) ,
  category_name varchar2(50) 
);



-- give_review


CREATE TABLE give_review (
  review_id number(5) ,
  user_id number(5) ,
  seller_id number(5) 
);


-- order_includ_product


CREATE TABLE order_includ_product (
  order_id number(8) ,
  product_id number(8) ,
  qntity number(8) ,
  counter number(8) 
);



-- order_t table starts

CREATE TABLE order_t (
  order_id number(5) default 0,
  order_date date ,
  payment_method varchar(50) ,
  payment_status varchar(50) ,
  return_id number(5) ,
  user_id number(8) ,
  counter number(8) 
);


-- promo


CREATE TABLE promo (
  promo_id number(5) ,
  promo_desc varchar2(50) ,
  Promo_expiry date ,
  promo_percentage number(20) ,
  promo_status varchar2(50) ,
  promo_limit number(5) ,
  promo_use_count number(5) ,
  a_id number(5) 
);


-- review


CREATE TABLE review (
  review_id number(5) ,
  review_text varchar(50) ,
  review_status varchar(50) ,
  review_date date ,
  product_id number(5) ,
  user_id number(8) 
);


-- UPDATE user_table SET u_password= 'faerf' ,u_email= 'farefa' ,u_mobile= '5556644' WHERE u_id= 1;


-- UPDATE user_table SET u_password= :pass ,u_email= :email ,u_mobile= :mob WHERE u_id= :id;



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



-- cart procedure test starts
/*DECLARE
cart_count  number(10);
status  VARCHAR(50);

BEGIN
add_to_cart(1 ,1 , 1 , cart_count , status);
DBMS_OUTPUT.put_line(status);
END;*/

-- cart procedure test ends





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

END;



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






commit;







