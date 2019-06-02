module.exports.buscarNoticias = function(app,req,res){
	res.render("noticias/buscarNoticias");
}

module.exports.noticiasBuscar = function(app, req, res){
	var idNoticia = req.body;
 	var connetion = app.config.dbConnection();
 	var noticiasDao = new app.app.models.NoticiasDAO(connetion);

	noticiasDao.getNoticia(idNoticia, function(error, result){
		res.render("noticias/noticia", {noticia : result});
	});
}

module.exports.noticias = function(app,req,res){
	var connection = app.config.dbConnection();
	var noticiasDao = new app.app.models.NoticiasDAO(connection);

	noticiasDao.getNoticias(function(erro, result){
		res.render("noticias/noticias",{noticias : result});
	});
}
