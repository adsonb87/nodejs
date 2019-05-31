var mysql = require('mysql');

var connMySQL = function(){
	console.log('Conexão com bd online');
	return mysql.createConnection({
		host : 'localhost',
		user : 'root',
		password : 'password',
		database : 'portal_noticias'
	});
}

module.exports = function () {
	console.log('Autoload carregou o modulo de conexao com o bd');
	return connMySQL;
}