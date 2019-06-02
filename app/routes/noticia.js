 module.exports = function(app){
 	
 	app.get('/buscarNoticias',function(req, res){
		res.render("noticias/buscarNoticias");
	});

 	
 	app.post('/noticias/buscar', function(req,res){
 		var idNoticia = req.body;
 		var connetion = app.config.dbConnection();
 		var noticiasDao = new app.app.models.NoticiasDAO(connetion);

 		noticiasDao.getNoticia(idNoticia, function(error, result){
 			res.render("noticias/noticia", {noticia : result});
 		});

 	});


 	/*app.get('/noticia', function(req,res){
 		
 		var connetion = app.config.dbConnection();
 		var noticiasModel = app.app.models.noticiasModel;

 		noticiasModel.getNoticia(connetion, function(error, result){
 			res.render("noticias/noticia", {noticia : result});
 		});
 	});*/
 };