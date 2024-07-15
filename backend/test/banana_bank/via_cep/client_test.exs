defmodule BananaBank.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias BananaBank.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "successfully returns cep info", %{bypass: bypass} do
      cep = "04816100"
      body = ~s({
        "bairro": "Jardim Satélite",
        "cep": "04816-100",
        "complemento": "",
        "ddd": "11",
        "gia": "1004",
        "ibge": "3550308",
        "localidade": "São Paulo",
        "logradouro": "Praça Almirante Pena Botto",
        "siafi": "7107",
        "uf": "SP",
        "unidade": ""
      })

      expected_response = {:ok, %{"bairro" => "Jardim Satélite", "cep" => "04816-100",
      "complemento" => "", "ddd" => "11", "gia" => "1004", "ibge" => "3550308",
      "localidade" => "São Paulo", "logradouro" => "Praça Almirante Pena Botto",
      "siafi" => "7107", "uf" => "SP", "unidade" => ""}}

      Bypass.expect(bypass, fn "GET", "/04816100/json" ->
        conn
        |> Plug.Conn.put_resp_content_type("application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.call(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
