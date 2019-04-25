DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `review`(IN `uid` INT, IN `pid` INT, IN `rev_text` VARCHAR(50), IN `rev_date` DATE)
BEGIN

DECLARE rev_id INT;
DECLARE status VARCHAR(20);
SET status = 'DONE';

SELECT review_id INTO rev_id FROM `review` WHERE product_id = pid and user_id = uid;

IF rev_id IS NOT NULL
THEN

UPDATE `review` SET `review_text`= rev_text ,`review_date`= rev_date WHERE product_id= pid AND user_id= uid;

SELECT status;


ELSE

INSERT INTO `review`( `review_text`, `review_date`, `product_id`, `user_id`) VALUES (rev_text , rev_date , pid , uid ) ; 

SELECT status;

END IF;

END$$
DELIMITER ;



CREATE OR REPLACE PROCEDURE ADD_REVIEW(
	uid IN review.user_id%type , 
	pid IN review.product_id%type ,
	rev_text IN  review.review_text%type,
	status OUT VARCHAR)
	
	IS

rev_id  review.review_id%type;

BEGIN
status := 'done'; 

SELECT review_id INTO rev_id FROM review WHERE product_id = pid and user_id = uid;


IF rev_id IS NOT NULL
THEN

UPDATE review SET review_text= rev_text , review_date= to_char(sysdate) WHERE product_id= pid AND user_id= uid;
status := 'updated';


END IF;



Exception
when no_data_found THEN
status := 'no data found , new_added';


INSERT INTO review( review_text, review_date, product_id, user_id) VALUES (rev_text , to_char(sysdate) , pid , uid ) ; 



when others THEN
status := 'others exception'; 

END;





declare
status Varchar(50);
rev_id number(2) ; 
begin

add_review(1,1, 'gae' , status);
DBMS_OUTPUT.put_line(status);

DBMS_OUTPUT.put_line('helllow');




end;

select review_id into rev_id from review;