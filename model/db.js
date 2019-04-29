
var oracledb = require('oracledb');

var config = {
	user          : 'riyad',
    password      : '448787' ,
    connectString : 'localhost:1521/xe'
}



function doRelease(connection) {
  connection.close(
    function(err) {
      if (err) {
        console.error(err.message);
      }
    });
}

module.exports ={
getResult: function(sql , params,  callback){

oracledb.getConnection(
  config,
  function(err, connection) {
    if (err) {
      console.error(err.message);
      //return;
    }
    connection.execute(
    
      sql,
      params,
      //{ outFormat: oracledb.OBJECT }, this also works
      { outFormat: oracledb.OBJECT , autoCommit: true },
      
      
      
      function(err, result) {
        if (err) {
          console.error(err.message);
          doRelease(connection);
          callback([]);
          //return;
        }
        
        //console.log(result.rows);   
        
        // callback(result.rows);
        callback(result);
        doRelease(connection);
      });
  });

},



execute: function(sql , params , callback){
oracledb.getConnection(
  config,
  function(err, connection) {
    if (err) {
      console.error(err.message);
      //return;
    }

    try{

      connection.execute(
    
      sql,
      params,
      //{ autoCommit: true }, //this also works
      { outFormat: oracledb.OBJECT , autoCommit: true },
   
      function(err, status) {
        if (err) {
          console.error(err.message);
          console.error(err);
          doRelease(connection);
          callback(false);
          //return;
        }else{
          console.log(status);    
        doRelease(connection);
        callback(status);
        }
        
        
      });




    }catch (err) {


      console.log('error block try catch');

      //callback(false);



    } finally{

      console.log('finally block try catch');

      //callback(false);

    }


    
  });
}

}

