
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

drop sequence reg;





-- user table





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



INSERT INTO products (product_id,
product_name,
product_price,
product_avlble,
product_sell_price,
product_original_price,
category_id,
descriptions,
category_name,
sub_category) VALUES
(1, 'Monitor LG', 33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg');




INSERT INTO products (product_id,
product_name,
product_price,
product_avlble,
product_sell_price,
product_original_price,
category_id,
descriptions,
category_name,
sub_category) VALUES
(2, 'Monitor Samsung ', 343, 34, 235, 2356, 346, 'useful for home', 'monitor', 'samsung');





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


create SEQUENCE reg
INCREMENT by 1
start with 1
maxvalue 100
NOCACHE
NOCYCLE ;


-- UPDATE user_table SET u_password= 'faerf' ,u_email= 'farefa' ,u_mobile= '5556644' WHERE u_id= 1;


-- UPDATE user_table SET u_password= :pass ,u_email= :email ,u_mobile= :mob WHERE u_id= :id;



commit;







