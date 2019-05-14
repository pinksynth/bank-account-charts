defmodule BankAccountCharts.Accounts.User do
  @derive [Poison.Encoder]
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :access_token, :string
    field :item_id, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :access_token, :item_id])
    |> validate_required([:username, :access_token, :item_id])
  end
end
