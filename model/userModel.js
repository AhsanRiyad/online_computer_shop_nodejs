var db = require('./db');
var oracledb = require('oracledb');

module.exports={	
	validate: function(user, callback){
		var sql1 = "select * from user where u_email='"+user.email+"' and u_password='"+user.password+"' ";
		
		var sql = "select * from user_table where u_email=:email and u_password=:password ";

		/*var params = {
			email: { val: user.email },
			password: { val: user.password }
		} */

		var params = [ user.email , user.password ];
		

		db.getResult(sql , params ,  callback);
	},
	registration: function(user, callback){

		var dob = user.year+'/'+user.month+'/'+user.day;
		console.log(user.day);
		console.log(user.month);
		console.log(user.year);
		console.log(dob);

		var sql1 = "INSERT INTO `user`( `u_password`,  `u_email`, `u_mobile`, `dob`, `u_status`, `u_type`) VALUES ('"+user.password+"','"+user.email+"',"+user.phone+",'"+dob+"','"+user.user_type+"','valid', '"+dob+"')";
		

//to_char(sysdate , 'MM-DD-YYYY')


		//var  sql = "INSERT INTO user_table(u_id , u_password, u_email, u_mobile, dob, u_status, u_type, last_name) VALUES (:password,:email,:phone,to_char( sysdate , 'MM-DD-YYYY'),'valid',:type,:last_name)";



		var sql = " INSERT INTO user_table(u_id ,  u_password, u_email, u_mobile, dob, u_status, u_type, last_name) VALUES (reg_seq.nextval ,  :password,:email,:phone,TO_DATE(:dob, 'yyyy/mm/dd'),'valid',:type,:last_name)";


		var params = {
			password : { val: user.password },
			email : { val: user.email },
			phone : { val: user.phone},
			dob : { val: dob },
			type : { val: user.user_type },
			last_name : { val: user.last_name },
			//password : { val: user.password},
		}

		




		console.log('sql block');
		console.log(sql);

		db.execute(sql, params ,  callback);


	},
	updateprofile: function(user , callback){
		var sql1 = "UPDATE `user` SET `u_password`= '"+user.password+"' ,`u_email`= '"+user.email+"' ,`u_mobile`= "+user.mobile+" WHERE u_id= "+user.u_id+"";

		var sql = "UPDATE user_table SET u_password=:password ,u_email=:email ,u_mobile=:phone WHERE u_id=:uuid";
		var params = 
		[
		user.password , user.email , user.mobile , user.u_id 
		]

		db.execute(sql , params ,  callback);
	},
	addUser: function(user , callback){

		
		var sql = "INSERT INTO `user`( `u_password`,  `u_email`, `u_mobile`, `u_status`, `u_type`, `last_name`) VALUES ('"+user.user_password+"','"+user.user_email+"',"+user.user_mobile+",'"+user.user_type+"','"+user.user_status+"', '"+user.user_name+"')" ; 



		var sql="INSERT INTO user_table(u_id, u_password,  u_email, u_mobile,u_status,u_type,last_name) VALUES (REG.nextval,:password,:email,:phone,:status,:type,:lastname)";

		var params = 
		[
		user.user_password , user.user_email , user.user_mobile , user.user_status , user.user_type ,  user.user_name
		];

		console.log(sql);

		db.execute(sql , params ,callback);



	}, 
	viewUser: function(callback){
		var sql = "select * from user_table";
		console.log(sql);
		//callback([]);
		db.getResult(sql , [] ,  callback);
	},
	deleteuser: function(userid , callback){
		// var sql = "DELETE FROM user_table WHERE u_id="+userid+"";
		var sql = "DELETE FROM user_table WHERE u_id=:uuid";
		
		console.log(sql);

		db.execute(sql, [userid] ,callback);

	},
	updateuser: function(user , callback){

		
		/*var sql = "INSERT INTO `user`( `u_password`,  `u_email`, `u_mobile`, `u_status`, `u_type`, `last_name`) VALUES ('"+user.user_password+"','"+user.user_email+"',"+user.user_mobile+",'"+user.user_type+"','"+user.user_status+"', '"+user.user_name+"')" ; */


		//var sql =  "UPDATE `user_table` SET `u_password`='"+user.user_password+"',`u_email`='"+user.user_email+"',`u_mobile`="+user.user_mobile+",`u_status`='"+user.user_status+"',`u_type`='"+user.user_type+"',`last_name`='"+user.user_name+"' WHERE `u_id`="+user.user_id+"" ; 
		var sql =  "UPDATE user_table SET u_password=:pass,u_email=:email,u_mobile=:mobile,u_status=:status,u_type=:type,last_name=:last_name WHERE u_id=:uuid" ;


		var params = 
		[
		user.user_password , user.user_email , user.user_mobile , user.user_status , user.user_type , user.user_name , user.user_id
		];


		console.log(sql);
		//callback(false);
		db.execute(sql , params , callback);



	}, 

	viewTrigger: function(callback){
		var sql = 'SELECT * FROM USER_TRIGGERS';

		var params = [];

		db.getResult(sql , params , callback)
	},

	enableTrigger: function(triggerName ,  callback){
		var sql = "BEGIN enable_trigger(:triggerName1); END;"
		console.log(triggerName);
		//return ;
		var params = 
		{ 
			
			triggerName1 : triggerName
		};

		db.execute(sql , params , callback);
	},

	disableTrigger: function(triggerName ,  callback){
		/*var sql = 
		`BEGIN 
		:status := disable_trigger(:triggerName); 
		END;`;*/

		var sql = "BEGIN disable_trigger(:triggerName1); END;"
		console.log(triggerName);
		//return ;
		var params = 
		{ 
			
			triggerName1 : triggerName
		};

		db.execute(sql , params , callback);
	},

	customTrigger: function( table_name ,  start_time , end_time , callback){
		/*var sql = 
		`BEGIN 
		:status := disable_trigger(:triggerName); 
		END;`;*/

		var sql = "BEGIN custome_trigger_p(:tn , :st , :et); END;"
		//console.log(triggerName);
		//return ;

		var sql = "create or replace trigger custom_trigger before insert or update or delete ON "+table_name+" begin if to_char(sysdate , 'HH24') not between '"+start_time+"' and '"+end_time+"' then raise_application_error(-2345  , 'restricted' ); end if; end custom_trigger;";

		var params = 
		{ 
			tn: table_name ,
			st: start_time , 
			et: end_time
		};

		console.log(params);
		console.log(sql);

		db.execute(sql , [] , callback);
	}

}



