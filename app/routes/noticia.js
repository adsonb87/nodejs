 module.exports = function(app){
 	
 	app.get('/buscarNoticias',function(req, res){
		app.app.controllers.noticias.buscarNoticias(app,req,res);
	});

 	
 	app.post('/noticias/buscar', function(req,res){
 		app.app.controllers.noticias.noticiasBuscar(app,req,res);
 	});

 	app.get('/noticias',function(req, res){
		app.app.controllers.noticias.noticias(app,req,res);
	});

 	/*app.get('/noticia', function(req,res){
 		
 		var connetion = app.config.dbConnection();
 		var noticiasModel = app.app.models.noticiasModel;

 		noticiasModel.getNoticia(connetion, function(error, result){
 			res.render("noticias/noticia", {noticia : result});
 		});
 	});*/
 };