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
var order = require.main.require('./controller/order');

var oracledb = require('oracledb');

var db = require.main.require('./model/db');


var app = express();
var port = 3000;

var authenticationArray = ['/auth'];


var title = {
	title: 'index', 
	justInProduct: [] , 
	RecommendedProduct : [] , 
	cart_count : 0 

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
app.use('/order' , order);


app.use('/lib/img', express.static(__dirname + '/lib/img/'));
app.use('/lib/js', express.static( __dirname + '/lib/js/'));
app.use('/lib/css', express.static( __dirname + '/lib/css/'));





//ROUTES
app.get('/' , (req,res)=>{



	

	var sql = `
      begin
       p1(:a , :b);
      end;` ; 

      var params = {
      a: 20,
      b:  { type: oracledb.NUMBER, dir: oracledb.BIND_OUT }

      }

		console.log(sql);


		db.getResult(sql , params , function(results){
			console.log(results);
			console.log(results.outBinds);


		});

	
}
);


//SERVER STARTUP
app.listen(port, ()=>console.log('server started at port '+port));