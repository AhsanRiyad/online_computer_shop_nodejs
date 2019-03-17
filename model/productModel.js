var db = require('./db');

module.exports={	
	addPromo: function(promo , callback){

		console.log(promo.promo_desc);

		console.log('user id promo block ' + promo.u_id);
		var sql = "INSERT INTO `promo`(`promo_desc`,  `promo_percentage`, `promo_status`, `promo_limit`, `promo_use_count`, `a_id` , `Promo_expiry`) VALUES ('"+promo.promo_desc+"' , "+promo.promo_percentage+" , '"+promo.promo_status+"' ,"+promo.promo_limit+","+promo.promo_use_count+" , "+promo.user_id+" , '"+promo.promo_expiry+"' )";

		console.log(sql);

		db.execute(sql , callback);



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
		sql = "select * from products";
		db.getResult(sql , callback);
	},
	searchProduct: function(productname , callback){
		console.log('product model '+ productname);
		var pname = productname + '%' ; 
		var sql = "select `product_name` from products where product_name like '"+pname+"' ";
		console.log(sql);

		db.getResult(sql, callback);

	},
	searchPage: function(productname , callback){
		console.log('search model '+ productname);
		var pname = productname + '%' ; 
		var sql = "select * from products where product_name like '"+pname+"' ";
		console.log(sql);

		db.getResult(sql, callback);

	},
	getProductDetails: function(productid, callback){
		console.log(productid);
		var sql = "select * from products where product_id = "+productid+"";
		console.log(sql);
		db.getResult(sql, callback);	
	},
	recommendProduct: function(visitTable , callback){
		var sql = "select * from visit where product_id="+visitTable.productid+" and user_ip='"+visitTable.ip+"'";
		console.log(sql);
		db.getResult(sql, callback);
	},
	insertIp: function(ip , callback){
		var sql = "INSERT INTO `visit`(`product_id`,`user_ip`) VALUES ("+ip.productid+" , '"+ip.ip+"')";

		console.log(sql);

		db.execute(sql , callback);

	},
	getRecommendedProduct : function(ip , callback){
		var sql = "SELECT p.* FROM visit v INNER JOIN products p ON p.product_id=v.product_id where v.user_ip = '"+ip+"'";

		console.log(sql);
		db.getResult(sql, callback);

	},
	addToCart: function(info , callback){
		console.log('in the model');
		var sql = "INSERT INTO `cart`(  `user_id`,  `product_id` , `quantity`) VALUES ("+info.uid+","+info.pid+" , "+info.qntity+" ) where user_id not in ("+info.uid+") and product_id ("+info.pid+")";

		console.log(sql);

		console.log(info);
	}

}

