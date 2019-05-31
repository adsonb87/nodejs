var http = require('http'); /* Vai ler na varíavel http a biblioteca http*/

//Vai criar o servidor que espera um argumento que está sendo passado através da function, que espera uma
//requisição e uma resposta

var server = http.createServer(function(req,res){

	//Vai receber a request dá página
	var categoria = req.url;

	if(categoria == '/tecnologia'){
		//Fornecendo a resposta do servidor, passando pelo método end a resposta do servidor.
		res.end("<html><body>Noticias de tecnologia</body></html>");

	}else if(categoria == '/moda'){
		res.end("<html><body>Noticias de moda</body></html>");

	}if(categoria == '/beleza'){
		res.end("<html><body>Noticias de beleza</body></html>");

	}else{
		res.end("<html><body>Portal de Noticias</body></html>");

	}
		  

});

//Faz a varíavel server, responsável pela criação do servidor escutar a porta 3000
server.listen(3000);