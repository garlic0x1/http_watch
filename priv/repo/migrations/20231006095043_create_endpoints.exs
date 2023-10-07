defmodule HttpWatch.Repo.Migrations.CreateEndpoints do
  use Ecto.Migration

  def change do
    create table(:endpoints) do
      add :url, :string
      add :method, :string, default: "GET"
      add :active, :bool, default: true

      timestamps()
    end
  end
end
