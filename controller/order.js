var express = require('express');

var productModel = require.main.require('./model/productModel');
var orderModel = require.main.require('./model/orderModel');

var router = express.Router();


var obj = {
	title: 'order' ,
	msg: '',
	promoArray: ['far' , 'faerf'],
	userinfo: [{ last_name: 'Riyad' }],
	loginStatus: false,
	cart_count : 0
}


router.get('*', function(req, res, next){
	if(req.session.email != null){
		next();
	}else{
		res.redirect('/auth');
	}
});

router.get('/' , function(req, res){
	res.send('order page');
});


router.get('/confirm' , function(req, res){
	// session
	if(req.session.email){
		obj.loginStatus = true;

		obj.user_id = req.session.userinfo;
		console.log(obj.user_id.U_ID);
		obj.user_id_P = obj.user_id.U_ID;

		productModel.cart_count(obj.user_id_P , function(result){
			console.log('cart count result');
			console.log(result.rows[0].CART_COUNT);
			
			console.log(result.rows[0].CART_COUNT);
			obj.cart_count = result.rows[0].CART_COUNT;
		});


		productModel.getCartProduct(obj.user_id_P , function(result){
			console.log(result.rows);
			//return;
			

			obj.products = result.rows;
			productModel.getCartTotal(obj.user_id_P , function(result){
				console.log(result.rows[0].TOTAL);
			//return;
			
			


			
			obj.total = result.rows[0].TOTAL;
			res.render('Order/confirm_order' , obj);

		});


		});



	}else{
		obj.loginStatus = false;
		res.redirect('/auth');
	}

	
});



router.post('/confirm' , function(req, res){

	if(req.session.email){
		obj.loginStatus = true;

		obj.user_id = req.session.userinfo;
		console.log(obj.user_id.U_ID);
		obj.user_id_P = obj.user_id.U_ID;

		productModel.cart_count(obj.user_id_P , function(result){
			console.log('cart count result');
			console.log(result.rows[0].CART_COUNT);
			
			console.log(result.rows[0].CART_COUNT);
			obj.cart_count = result.rows[0].CART_COUNT;
		});


		productModel.getCartProduct(obj.user_id_P , function(result){
			console.log(result.rows);
			//return;
			

			obj.products = result.rows;
			productModel.getCartTotal(obj.user_id_P , function(result){
				console.log(result.rows[0].TOTAL);
			//return;
			
			


			
			obj.total = result.rows[0].TOTAL;
			//res.render('Order/confirm_order' , obj);




			var d = new Date();
			var day = d.getDate();
			var month = d.getMonth();
			var year  = d.getFullYear();

			var date = year+'-'+month+'-'+day;

			var orderInfo = {
				uid: obj.user_id_P ,
				order_date: date ,
				payment_method : req.body.optradio 
			}

			orderModel.confirmOrder(orderInfo , function(result){


				console.log(result);
				//return;
				res.render('Order/done' , obj);

			});








		});


		});



	}else{
		obj.loginStatus = false;
		res.redirect('/auth');
	}




	


		//console.log(orderInfo);






	//res.render('Order/confirm_order' , obj);
});













module.exports = router;