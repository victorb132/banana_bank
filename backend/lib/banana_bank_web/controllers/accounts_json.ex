defmodule BananaBankWeb.AccountsJSON do
  alias BananaBank.Accounts.Account

  def create(%{account: account}),
    do: %{message: "Conta criada com sucesso!", data: data(account)}

  def transaction(%{transaction: %{withdraw: from_account, deposit: to_account}}),
    do: %{
      message: "Transferência realizada!",
      from_account: data(from_account),
      to_account: data(to_account)
    }

  defp data(%Account{} = account) do
    %{
      id: account.id,
      balance: account.balance
    }
  end
end
