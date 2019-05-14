defmodule BankAccountCharts.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :access_token, :string, null: false
      add :item_id, :string, null: false

      timestamps()
    end
  end
end
