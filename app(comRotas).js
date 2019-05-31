/*var express = require('express');
var app = express();
app.set('view engine', 'ejs');
app.get('/tecnologia',function(req, res){
	res.send("<html><body>Noticias de Tecnologia</body></html>");
});*/

var app = require('./config/server');

//Antes de utilizar o consign era necessário incluir as rotas uma por uma

//var rotaNoticias = require('./app/routes/noticias')(app);
//var rotaFormulario = require('./app/routes/formulario_inclusao_noticia')(app);
//var rotaHome = require('./app/routes/home')(app);

app.listen(3000,function(){
	console.log('Servidor On');
});