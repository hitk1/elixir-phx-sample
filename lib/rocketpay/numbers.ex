defmodule Rocketpay.Numbers do
	def sumFromFile(filename) do
		"#{filename}.csv"
		|> File.read()
		|> handleFile()
	end

	#Essa é uma definição de função com syntax sugar, e o retorno dessas é esta descrito depois de [do:]
	#Como a função [sumFromFile] pode retornar um erro, por isso há 2 declarações de funções que lidam com a leitura do arquivo
	#Onde houver pattern match, a função será chamada. Por isso há 2 declarações de funções
	# defp handleFile({ :ok, file}), do: file

	defp handleFile({:ok, file}) do
		result = file
		|> String.split(",")
		|> Stream.map(fn item -> String.trim(item) end)
		|> Stream.map(fn item -> String.to_integer(item) end)
		|> Enum.sum()

		{:ok, %{result: result}}
	end

	defp handleFile({:error, _reason}), do: {:error, %{message: "Invalid file name!"}}
end
