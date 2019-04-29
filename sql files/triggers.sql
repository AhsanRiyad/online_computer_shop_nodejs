-- 1.
/

drop table USERINFO_LOG ; 

/

drop function enable_trigger;

/

drop function disable_trigger;


/
create or replace trigger neg_price
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

commit;