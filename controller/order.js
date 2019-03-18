var express = require('express');

var productModel = require.main.require('./model/productModel');
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

	obj.loginStatus = true;

	obj.user_id = req.session.userinfo;
		console.log(obj.user_id[0].u_id);
		obj.user_id_P = obj.user_id[0].u_id;
	
	productModel.cart_count(obj.user_id_P , function(result){
			console.log('cart count result');
			console.log(result[0].cart_count);
			obj.cart_count = result[0].cart_count;
		});




	res.render('Order/confirm_order' , obj);
});



module.exports = router;