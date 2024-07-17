defmodule BananaBankWeb.UsersControllersTest do
  use BananaBankWeb.ConnCase

  import Mox

  alias BananaBank.Users
  alias Users.User

  setup do
    params = %{
      "name" => "Victor",
      "cep" => "04816100",
      "email" => "victor@gmail.com",
      "password" => "123456"
    }

    body = %{
      "bairro" => "Jardim Satélite",
      "cep" => "04816-100",
      "complemento" => "",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça Almirante Pena Botto",
      "siafi" => "7107",
      "uf" => "SP",
      "unidade" => ""
    }

    {:ok, %{user_params: params, body: body}}
  end

  describe "create/2" do
    test "successfully creates an user", %{conn: conn, body: body, user_params: params} do
      expect(BananaBank.ViaCep.ClientMock, :call, fn "04816100" ->
        {:ok, body}
       end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

        assert %{
          "data" => %{"cep" => "04816100", "email" => "victor@gmail.com", "id" => _id, "name" => "Victor"},
          "message" => "Usuário criado com sucesso!"
          } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: nil,
        cep: "12",
        email: "victor@gmail.com",
        password: "123456"
      }

      expect(BananaBank.ViaCep.ClientMock, :call, fn "12" ->
        {:ok, ""}
       end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

        expected_response = %{"errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}}

        assert response == expected_response
    end
  end

  describe "delete/2" do
    test "successfully deletes an user", %{conn: conn, body: body, user_params: params} do
      expect(BananaBank.ViaCep.ClientMock, :call, fn "04816100" ->
        {:ok, body}
       end)

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

        assert %{
          "data" => %{"cep" => "04816100", "email" => "victor@gmail.com", "id" => _id, "name" => "Victor"},
          "message" => "Usuário excluído com sucesso!"
          } = response
    end

  end
end
