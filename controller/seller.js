var express = require('express');
var sellerModel = require.main.require('./model/seller-model');
var router = express.Router();



// router.get('*', function(req, res, next){
// 		if(req.session.name != null){
// 			next();
// 		}else{
// 			res.redirect('/login');
// 		}
// });

router.get('/', (req, res)=>{
		var result1 = req.session.userinfo;
		var user = {
			name: result1[0].first_name //name: req.session.name
		};
		res.render('seller/index', user);
});	

//showing product list
router.get('/productlist', (req, res)=>{
	var result1 = req.session.userinfo;
	
	sellerModel.getAll(function(results){
		if(results.length > 0){
			
			var user = {
				name: result1[0].first_name, //name: req.session.name,
				pList: results
			};
			res.render('seller/productlist', user);
		}
	});	
});

//showing order page
router.get('/orderd_products', (req, res)=>{
	var result1 = req.session.userinfo;
	
	sellerModel.getAllorderd_products(function(results){
		if(results.length > 0){
			
			var user = {
				name: result1[0].first_name, //name: req.session.name,
				pList: results
			};
			res.render('seller/orderd_products', user);
		}
	});	
});


//return request
router.get('/return_request', (req, res)=>{
	var result1 = req.session.userinfo;

	
	sellerModel.getAllreturn_request(result1[0].u_id, function(results){   //req.session.uid
		if(results.length > 0){
			
			var user = {
				name: result1[0].first_name, //name: req.session.name,
				pList: results
			};
			res.render('seller/return_request', user);
		}
	});	
});

router.post('/return_request', (req,res)=>{
	var result1 = req.session.userinfo;


	sellerModule.delete_return_request(result1[0].u_id,function(results){     //req.session.uid
		if(success){
			res.redirect('/seller/return_request');
		}else{
			res.redirect("seller/return_request/"+req.params.id);
		}
	});
});

//show profile
router.get('/profile', (req, res)=>{
	var result1 = req.session.userinfo;


	sellerModel.get(result1[0].u_id, function(result){    //req.session.uid

		if(result.length > 0){
			res.render('seller/profile', result[0]);
		}
	});	
});

//adding new product
router.get('/addproduct', (req, res)=>{
	var result1 = req.session.userinfo;

	res.render('seller/addproduct');
});	

router.post('/addproduct', (req, res)=>{
	var result1 = req.session.userinfo;

	
	var product ={
		product_name : req.body.product_name,
		product_price : req.body.product_price,
		product_avlble : req.body.product_avlble,
		product_sell_price : req.body.product_sell_price,
		product_original_price : req.body.product_original_price,
		category_id : req.body.category_id
	};
	
	sellerModel.insert(product, function(success){
	var result1 = req.session.userinfo;

		if(success){
			res.redirect('/seller/productlist');
		}else{
			res.render("/seller/addproduct");
		}
	});
});

//edeting product
router.get('/edit/:id', (req, res)=>{
	var result1 = req.session.userinfo;


	sellerModel.getProduct(req.params.id, function(result){
		if(result.length >0 ){
			res.render('seller/edit', result[0]);
			console.log('edit ifff');
		}else{
			console.log('edit isss');
			res.redirect('/seller/productlist');
		}
	});
});

router.post('/edit/:id', (req, res)=>{
	var result1 = req.session.userinfo;

	
	var product ={
		productId: req.params.id,
		productName : req.body.product_name1,
		productPrice : req.body.product_price1,
		productAvlble : req.body.product_avlble1,
		productSellPrice : req.body.product_sell_price1,
		productOriginalPrice : req.body.product_original_price1,
		categoryId : req.body.category_id1
	};
	
	sellerModel.update(product, function(success){
		if(success){
			res.redirect('/seller/productlist');
		}else{
			res.render("/seller/edit/"+req.params.id);
		}
	});
});

//deleting product

router.get('/delete/:id', (req, res)=>{
	var result1 = req.session.userinfo;


	sellerModel.getProduct(req.params.id, function(result){
		if(result.length >0 ){
			res.render('seller/delete', result[0]);
		}else{
			res.redirect('/seller/productlist');
		}
	});
});

router.post('/delete/:id', (req, res)=>{
	var result1 = req.session.userinfo;

	
	sellerModel.delete(req.params.id, function(success){
		if(success){
			res.redirect('/seller/productlist');
		}else{
			res.redirect("/seller/delete/"+req.params.id);
		}
	});
});

//confirming order

router.get('/confirm_orderd_products/:id', (req, res)=>{
	var result1 = req.session.userinfo;


	sellerModel.get_confirming_orderd_products(req.params.id, function(result){
		if(result.length >0 ){
			res.render('seller/confirm_orderd_products', result[0]);
		}else{
			res.redirect('/seller/orderd_products');
		}
	});
});

router.post('/confirm_orderd_products/:id', (req, res)=>{
	var result1 = req.session.userinfo;

	
	sellerModel.delete_confirmed_order_from_database(req.params.id, function(success){
		if(success){
			res.redirect('/seller/orderd_products');
		}else{
			res.redirect("seller/confirm_orderd_products"+req.params.id);
		}
	});
});
module.exports = router;