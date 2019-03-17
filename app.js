//DECLARATION
var express = require('express');
var bodyParser = require('body-parser');
var exSession = require('express-session');
var cookieParser = require('cookie-parser');
var dashboard = require.main.require('./controller/dashboard');
var product = require.main.require('./controller/product');
var productModel = require.main.require('./model/productModel');
var authentication = require.main.require('./controller/authentication');
var user = require.main.require('./controller/user');


var app = express();
var port = 3000;

var authenticationArray = ['/auth'];


var title = {
	title: 'index', 
	justInProduct: [] , 
	RecommendedProduct : []

}

//CONFIGURATION
app.set('view engine' , 'ejs');



//MIDDLEWARES
app.use(exSession({secret: 'my top secret code', saveUninitialized: true, resave: false}));
app.use(bodyParser.urlencoded({extended: true}));
app.use(cookieParser());

app.use( authenticationArray , authentication);
app.use('/dashboard' , dashboard);
app.use('/product' , product);
app.use('/user' , user);

app.use('/lib/img', express.static(__dirname + '/lib/img/'));
app.use('/lib/js', express.static( __dirname + '/lib/js/'));
app.use('/lib/css', express.static( __dirname + '/lib/css/'));





//ROUTES
app.get('/' , (req,res)=>{

	var ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;

	

	productModel.getRecommendedProduct(ip , function(result){

		if(result.length<1){
			console.log('recommended not found');
		}else{
			console.log('recommended block');
			console.log(result);
			title.RecommendedProduct = result;
		}

		


	});



	productModel.getAllProduct(function(result){
		title.justInProduct = result;
		console.log(result);

		if(req.session.email){
		title.loginStatus = true;
		}else{
		title.loginStatus = false;
		}
		console.log(title);
		res.render('index' , title);
	});


	

}
);


//SERVER STARTUP
app.listen(port, ()=>console.log('server started at port '+port));