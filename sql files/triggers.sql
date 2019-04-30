-- 1.
/

drop table USERINFO_LOG ; 

/

drop function enable_trigger;

/

drop function disable_trigger;


/


drop trigger neg_price_cart;

create or replace trigger neg_price_cart
    before update or insert on cart
    for each row
    begin
    if :new.quantity <= 0 then
    raise_application_error(-20201,'quantity can not be negative');
    end if;
    end;
/
    insert into cart values (1,'kcd',2,'user',2,5,0)
        insert into cart values (1,'kcd',2,'user',2,5,-4)

            INSERT INTO products (product_id,product_name,product_price,product_avlble,product_sell_price,product_original_price,category_id,descriptions,category_name,sub_category) VALUES
            (PRODUCT_SEQ.nextval, 'Monitor LG', -33, 33, 33, 34, 34, 'useful for home', 'monitor', 'lg');


/
-- 2.

/

drop table userinfo_log;

/

CREATE TABLE USERINFO_LOG
   (u_id NUMBER(30),
    oldpass VARCHAR2(50),
    newpass VARCHAR2(50),
    oldemail VARCHAR2(50),
    newemail VARCHAR2(50),
    oldadd VARCHAR2(50),
    newadd VARCHAR2(50),
    oldphone NUMBER(30),
    newphone NUMBER(30),
    oldfname VARCHAR2(50),
    newfname VARCHAR2(50),
    oldlname VARCHAR2(50),
    newlname VARCHAR2(50),
    oldtype VARCHAR2(50),
    newtype VARCHAR2(50),
    time date );
/

drop trigger user_info_up;

create or replace trigger user_info_up
    after update of u_password,u_address,u_email,u_mobile,first_name,last_name,u_type on user_table
    for each row
    begin
    insert into userinfo_log values(:new.u_id,:old.u_password,:new.u_password,:old.u_address,:new.u_address,:old.u_email,:new.u_email,:old.u_mobile,:new.u_mobile,:old.first_name,:new.first_name,:old.last_name,:new.last_name,:old.u_type,:new.u_type,sysdate);
end;

-- UPDATE user_table SET u_password='1234',u_email='bbb',u_mobile=017951234,u_status='valid',u_type='user50',last_name='jannat21' WHERE u_id=12

-- select * from userinfo_log


-- 3.


/

drop trigger restrict_adminaw;

create or replace trigger restrict_adminaw
    before update or insert on user_table
    for each row
    begin
    if inserting then
    raise_application_error(-20202,'not inserted');
    elsif updating then
    raise_application_error(-20203,'not updated');
    elsif deleting then
    raise_application_error(-20204,'not deleted');
    end if;
    end;

    /




/
drop table REVIEW_LOG;

CREATE TABLE REVIEW_LOG
   (review_id NUMBER(5),
    oldtext VARCHAR2(50),
    newtext VARCHAR2(50),
    oldstatus VARCHAR2(50),
    newstatus VARCHAR2(50),
    olddate date,
    newdate date,
    time date );

/
drop trigger review_up;
/
create or replace trigger review_up
after update of review_text,review_status,review_date,product_id,user_id on review
for each row
begin
insert into review_log values(:new.review_id,:old.review_text,:new.review_text,:old.review_status,:new.review_status,:old.review_date,:new.review_date,sysdate);
end;

/





drop trigger neg_price_promo;

/


create or replace trigger neg_price_promo
before update or insert on promo
for each row
begin
if :new.promo_percentage <= 0 then
raise_application_error(-2345,'promo percentage can not be negative');
end if;
end;


/

-- insert into promo values (5,'abc',to_date('17-12-1980','dd-mm-yyyy'),-6,'invalid',3,4,8);


/*insert into review(review_id,review_text,review_status,review_date,product_id,user_id) values (2,'good','done',to_date('9-6-1981','dd-mm-yyyy'),2,3);

update review set review_text='bad', review_date=to_date('9-6-2019','dd-mm-yyyy') where review_id=2;

*/
-- select * from user_triggers
commit;