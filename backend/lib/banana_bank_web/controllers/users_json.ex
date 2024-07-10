defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  def create(%{user: user}), do: %{message: "Usuário criado com sucesso!", data: data(user)}
  def delete(%{user: user}), do: %{message: "Usuário excluído com sucesso!", data: data(user)}
  def update(%{user: user}), do: %{message: "Usuário atualizado com sucesso!", data: data(user)}
  def get(%{user: user}), do: %{data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name,
    }
  end
end
