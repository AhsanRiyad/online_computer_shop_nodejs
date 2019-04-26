var db = require('./db');
var oracledb = require('oracledb');



module.exports = {
	confirmOrder: function(orderInfo  , callback){

		console.log('order model');

		var sql1 = "call order_t("+orderInfo.uid+" , '"+orderInfo.order_date+"' , '"+orderInfo.payment_method+"');";

		var sql = 
		`begin
		make_order(:uuid , :payment_method , :status);
		end;
		`;

		var params = {
			uuid : orderInfo.uid,
			payment_method : orderInfo.payment_method,
			status : { type: oracledb.VARCHAR , dir: oracledb.BIND_OUT } 
		}

		db.getResult(sql, params , callback);

		console.log(sql);

	}
}