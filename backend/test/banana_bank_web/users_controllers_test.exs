defmodule BananaBankWeb.UsersControllersTest do
  use BananaBankWeb.ConnCase

  alias BananaBank.Users
  alias Users.User

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      params = %{
        "name" => "Victor",
        "cep" => "12345678",
        "email" => "victor@gmail.com",
        "password" => "123456"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

        assert %{
          "data" => %{"cep" => "12345678", "email" => "victor@gmail.com", "id" => _id, "name" => "Victor"},
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

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

        assert %{"errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}} = response
    end
  end

  describe "delete/2" do
    test "successfully deletes an user", %{conn: conn} do
      params = %{
        "name" => "Victor",
        "cep" => "12345678",
        "email" => "victor@gmail.com",
        "password" => "123456"
      }

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

        assert %{
          "data" => %{"cep" => "12345678", "email" => "victor@gmail.com", "id" => id, "name" => "Victor"},
          "message" => "Usuário excluído com sucesso!"
          } = response
    end

  end
end
