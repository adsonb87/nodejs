 module.exports = function(app){
 	app.get('/noticia', function(req,res){
 		
 		var connetion = app.config.dbConnection();
 		var noticiasModel = app.app.models.noticiasModel;

 		noticiasModel.getNoticia(connetion, function(error, result){
 			res.render("noticias/noticia", {noticia : result});
 		});
 	});
 };