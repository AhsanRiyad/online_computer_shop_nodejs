var mysql = require('mysql');

var config = {
	host: '127.0.0.1',
	user: 'root',
	password: '',
	database: 'node_project',
	multipleStatements: true
};


function getConnection(){
	var connection = mysql.createConnection(config);
	connection.connect(function(err){
		if(err){
			console.log(err.stack);
		}
		console.log('connection id is: '+ connection.threadId);
	});
	return connection;
}


//var pool  = mysql.createPool(config);


module.exports = {
	getResult: function(sql , callback){
		var connection = getConnection();
		
		connection.query(sql , function(err, result){
			if(err){
				callback([]);
			}else{

				callback(result);
			}
		});
		connection.end(function(error){
			console.log('connection ending ...');
				//console.log('connection ending ...');
			});
	},

	execute: function(sql , callback){
		var connection = getConnection();
		connection.query(sql , function(err, status){
			if(err){
				console.log('promo error block');
				console.log(err);
				callback(false);
			}else{
				console.log('promo block');

				console.log(status.protocol41);
				callback(status.protocol41);
			}
		});



		connection.end(function(error){
			console.log('connection ending ...');
				//console.log('connection ending ...');
			});



	}



}




