
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

drop view cart_cout;



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


drop table user_table;


/

create table user_table
(
u_id number(30),
u_password varchar2(50),
u_address varchar2(50) ,
u_email varchar2(50) unique,
u_mobile number(30) ,
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





commit;







