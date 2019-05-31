 module.exports = function(app){
 	
 	app.get('/buscarNoticias',function(req, res){
		res.render("noticias/buscarNoticias");
	});

 	
 	app.post('/noticias/buscar', function(req,res){
 		var id_noticia = req.body;
 		res.send(id_noticia);
 	});


 	app.get('/noticia', function(req,res){
 		
 		var connetion = app.config.dbConnection();
 		var noticiasModel = app.app.models.noticiasModel;

 		noticiasModel.getNoticia(connetion, function(error, result){
 			res.render("noticias/noticia", {noticia : result});
 		});
 	});
 };