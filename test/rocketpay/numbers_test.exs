defmodule Rocketpay.NumbersTest do
  use ExUnit.Case   #Todo arquivo de teste precisa explicar essa linha que o indica como test

  alias Rocketpay.Numbers

  #Descrição do teste unitario, o numero separado por barra no final, indica a aridade da função, ou seja, quantos argumentos ela espera
  describe "sumFromFile/1" do
    #Descricao do test
    test "When there is a file with the given numbers, return the sum of then" do
      response = Numbers.sumFromFile("numbers")

      expectedReponse = {:ok, %{result: 37}}

      assert response == expectedReponse
    end

    test "When there is no file with the giver numbers, return an error" do
      response = Numbers.sumFromFile("test")

      expectedResponse = {:error, %{message: "Invalid file name!"}}

      assert response == expectedResponse
    end
  end
end
