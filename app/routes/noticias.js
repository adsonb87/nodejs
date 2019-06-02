//var dbConnection = require('../../config/dbConnection');
module.exports = function(app){

	app.get('/noticias',function(req, res){
		
		var connection = app.config.dbConnection();
		var noticiasDao = new app.app.models.NoticiasDAO(connection);

		noticiasDao.getNoticias(function(erro, result){
			res.render("noticias/noticias",{noticias : result});
		});
	});
};