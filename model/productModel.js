var db = require('./db');
var oracledb = require('oracledb');

module.exports={	
	addPromo: function(promo , callback){

		console.log(promo.promo_desc);

		console.log('user id promo block ' + promo.u_id);
		var sql1 = "INSERT INTO `promo`(`promo_desc`,  `promo_percentage`, `promo_status`, `promo_limit`, `promo_use_count`, `a_id` , `Promo_expiry`) VALUES ('"+promo.promo_desc+"' , "+promo.promo_percentage+" , '"+promo.promo_status+"' ,"+promo.promo_limit+","+promo.promo_use_count+" , "+promo.user_id+" , '"+promo.promo_expiry+"' )";


        var sql="INSERT INTO promo(promo_id,promo_desc,  promo_percentage, promo_status, promo_limit, promo_use_count, a_id, Promo_expiry) VALUES (ID.nextval,:pr_desc ,:pr_percentage,:pr_status,:pr_limit, :use_count  ,  :uuid, TO_DATE(:pr_expiry, 'yyyy/mm/dd'))";

        var params = 
        {
         pr_desc:  promo.promo_desc, 
         pr_percentage: promo.promo_percentage,
         pr_status: promo.promo_status,
         pr_limit: promo.promo_limit,
         use_count : promo.promo_use_count,
         uuid :  promo.user_id,
         pr_expiry : promo.promo_expiry

		};

		console.log(sql);

		db.execute(sql , params ,callback);



	},
	getPromo: function(callback){
		var sql = "select * from promo";
		console.log(sql);
		db.getResult(sql, callback);

	},
	deletePromo: function(promoid , callback){
		var sql = "DELETE FROM `promo` WHERE promo_id="+promoid+"";
		
		console.log(sql);

		db.execute(sql, callback);

	},
	updatePromo: function(promo , callback){
		sql = "UPDATE `promo` SET `promo_desc`='"+promo.promo_desc+"',`promo_percentage`="+promo.promo_percentage+" ,`promo_status`='"+promo.promo_status+"',`promo_limit`="+promo.promo_limit+",`promo_use_count`="+promo.promo_use_count+" WHERE promo_id = "+promo.promo_id+"";
		db.execute(sql , callback);

		console.log(sql);
	},
	getAllProduct: function(callback){
		sql = "select * from products where rownum <= 12";
		var params = {} ; 
		db.getResult(sql , params,  callback);
	},
	searchProduct: function(searchDetails , callback){
		console.log('product model '+ searchDetails.searchText);
		//var pname ='%' + searchDetails.searchText + '%' ;
		var pname =searchDetails.searchText ;

		var catName = searchDetails.category ;
		console.log('p'+' '+pname , 'c'+' '+catName );
		if(catName == 'all'){
			//var sql1 = "select `product_name` from products where product_name like '"+pname+"' ";

			//var sql="select product_name from products where product_name like :pname";

			var sql= "select product_name from products where regexp_like(product_name, :pname , 'i')";


			db.getResult(sql, [pname] ,callback);

		}else{
			//var sql1 = "select `product_name` from products where product_name like '"+pname+"' and category_name = '"+catName+"' ";

			//var sql="select product_name from products where product_name like :pname and category_name = :cname";


			var sql= "select product_name from products where regexp_like(product_name, :pname , 'i') and regexp_like(category_name, :cname, 'i')";

			db.getResult(sql, [ pname , catName ] ,callback);


		}


		
		console.log(sql);

		//db.getResult(sql, callback);

	},
	searchPage: function(searchDetails , callback){
		console.log('product model submit button '+ searchDetails.searchText);
		//var pname ='%' + searchDetails.searchText + '%' ;
		var pname =searchDetails.searchText ;

		var catName = searchDetails.category ;
		console.log('p'+' '+pname , 'c'+' '+catName );
		if(catName == 'all'){
			//var sql1 = "select `product_name` from products where product_name like '"+pname+"' ";

			//var sql="select product_name from products where product_name like :pname";

			var sql= "select * from products where regexp_like(product_name, :pname , 'i')";


			db.getResult(sql, [pname] ,callback);

		}else{
			//var sql1 = "select `product_name` from products where product_name like '"+pname+"' and category_name = '"+catName+"' ";

			//var sql="select product_name from products where product_name like :pname and category_name = :cname";


			var sql= "select * from products where regexp_like(product_name, :pname , 'i') and regexp_like(category_name, :cname, 'i')";

			db.getResult(sql, [ pname , catName ] ,callback);


		}


		
		console.log(sql);

	},
	getProductDetails: function(productid, callback){
		console.log(productid);
		var sql = "select * from products where product_id = :pid";
		console.log(sql);
		db.getResult(sql, { pid: productid } , callback);	
	},
	recommendProduct: function(visitTable , callback){
		var sql = "select * from visit where product_id=:pid and user_ip=:ip";

		

		var params = { 
			pid :  visitTable.productid , 
			ip: visitTable.ip
		} ;

		console.log(sql);
		db.getResult(sql , params ,  callback);
	},
	insertIp: function(ip , callback){
		var sql = "INSERT INTO visit(product_id,user_ip) VALUES (:pid , :ip)";

		console.log(sql);
		var params = { 
			pid: { val: ip.productid }  , 
			ip: { val: ip.ip }
		};
		//params = ['3' , ip.ip];
		console.log(params);

		db.execute(sql , params ,  callback);

	},
	getRecommendedProduct : function(ip , callback){
		//var sql = "SELECT p.* FROM visit v INNER JOIN products p ON p.product_id=v.product_id where v.user_ip = '"+ip+"'";


		var sql = "SELECT p.* FROM visit v  , products p where p.product_id=v.product_id and v.user_ip = :ip" ; 

		var params = { ip: ip }

		console.log(sql);
		console.log(ip);
		db.getResult(sql, params , callback);

	},
	addToCart: function(info , callback){
		console.log('in the model');
		//var sql = "INSERT INTO `cart`(  `user_id`,  `product_id` , `quantity`) VALUES ("+info.uid+","+info.pid+" , "+info.qntity+" ) where user_id not in ("+info.uid+") and product_id in ("+info.pid+")";
		var sql1 = "call cart("+Number(info.pid)+" , "+Number(info.uid)+" , "+Number(info.qntity)+" );";
		
		var sql = 
		`BEGIN
		add_to_cart(:pid , :u_id , :qntity , :cart_count , :status);
		END;`;

		var params = {

			u_id :  Number(info.uid) ,
			pid :  Number(info.pid) ,
			qntity :  Number(info.qntity) ,
			status : { type: oracledb.VARCHAR , dir: oracledb.BIND_OUT } , 
			cart_count : { type: oracledb.NUMBER , dir: oracledb.BIND_OUT } 

		}

		console.log(sql);
		db.getResult(sql, params ,  callback);
		console.log(info);
	},
	cart_count: function(uid , callback){
		
		var sql1 = "SELECT COUNT(*) as cart_count FROM `cart` WHERE user_id = "+uid+";"


		var sql = "SELECT COUNT(*) as cart_count  FROM cart WHERE user_id =:uuid";


		console.log('cart_count'+' ' + uid);
		console.log(sql);
		var params = {
			uuid : { 
				val : uid 
			}
		};

		db.getResult(sql ,  params ,  callback);


	},
	getCartProduct: function(uid , callback){
		//var sql = "call cartPage("+uid+")";
		

		var sql = "select p.product_id , pr.product_name , pr.product_price , p.product_qntity , pr.DESCRIPTIONS ,  (pr.product_price*p.product_qntity) as total from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = :uuid";
		console.log(sql);
		var params = [ uid ];

		db.getResult(sql , params , callback);

	},
	getCartTotal: function(uid , callback){
		//var sql = "call cartPage("+uid+")";
		

		var sql = "select SUM(pr.product_price*p.product_qntity) as total from cart c , p_include_cart p , products pr where p.cart_id = c.cart_id and p.product_id = pr.product_id and c.user_id = :uuid";
		console.log(sql);
		var params = [ uid ];

		db.getResult(sql , params , callback);

	},
	addReview: function(revInfo , callback){

		//var sql1 = "call review("+revInfo.user_id+" , "+revInfo.productId+" , '"+revInfo.rev_text+"' , '"+revInfo.rev_date+"');";

		var sql = 
		`begin
		add_review(:u_id , :pid , :rev_text, :status); 
		end;` ;


		var params = {

			u_id : { val : revInfo.user_id },
			pid : { val : revInfo.productId },
			rev_text : { val : revInfo.rev_text },
			status : { type: oracledb.VARCHAR , dir: oracledb.BIND_OUT }

		}


		console.log(sql);
		console.log(params);
		//return;
		db.execute(sql , params ,  callback);


	},
	getReview: function(pid , callback){
		var sql = "SELECT review_id, review_text, review_status, review_date, product_id, user_id FROM review WHERE product_id =:pid ";

		db.getResult(sql , {pid : pid} ,  callback);

		console.log(sql);
	},
	deleteReview: function(rev_id , callback){
		var sql = "DELETE FROM `review` WHERE review_id="+rev_id+"";
		console.log(sql);
		db.execute(sql , callback);



	},
	searchCat: function(catName , subCat , callback){

		//var sql = "select * from products where  category_name='"+catName+"' and sub_category='"+subCat+"' " ; 

		var sql="select * from products where  category_name=:cname and sub_category=:scat ";


		console.log(sql);


		db.getResult(sql , [ catName , subCat ] ,callback);



	}


}

