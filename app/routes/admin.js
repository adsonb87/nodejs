module.exports = function(app){
	app.get('/formulario_inclusao_noticia',function(req, res){
		res.render("admin/form_add_noticia");
	});

	app.post('/noticias/salvar',function(req,res){
		var noticia = req.body;
	
		var connection = app.config.dbConnection();
		var noticiasDao = new app.app.models.NoticiasDAO(connection);

		noticiasDao.salvarNoticia(noticia, function(error, result){
			res.redirect('/noticias');
		});
	});
};