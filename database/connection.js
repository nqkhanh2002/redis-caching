const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', // demo purposes only
    database: 'redis_session_demo'
});
 

mysqlConnection.connect(function(err) {
  if (err) {
    console.log('error connecting to mysql: ' + err.stack);
    return;
  }
});

module.exports = mysqlConnection;
