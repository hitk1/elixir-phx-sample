# A criação de um novo modulo, neste caso o controller, é feito da seguinte maneira























# o Nome do modulo segue, sempre por padrão, o nome do seu arquivo [welcomeController] => WelcomeController
# É necessario, sempre colocar em qual contexto esse modulo esta inserido, no caso RocketpayWeb

# Os contextos disponíveis são os diretórios disponíveis dentro de [lib]
defmodule RocketpayWeb.WelcomeController do
	#é necessario indicar que esse modulo é um controller, sendo feito da seguinte maneira
	use RocketpayWeb, :controller

	alias Rocketpay.Numbers

	# Definição de funções
	# toda funções de controllers, recebem a conexão como primeiro parametro
	# o segundo paramentros, como não sera utilizar, é indicado com um underline [_params]
	def index(conn, %{"filename" => filename}) do
		filename
		|> Numbers.sumFromFile()
		|> handleResponse(conn)
	end

	defp handleResponse({:ok, %{result: result}}, conn) do
		conn
		|> put_status(:ok)
		|> json(%{ message: "Welcome to Rocketpay API, here is your number: #{result}"})
	end

	defp handleResponse({:error, reason}, conn) do
		conn
		|> put_status(:bad_request)
		|> json(reason)
	end
end
