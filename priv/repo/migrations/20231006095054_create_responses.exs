defmodule HttpWatch.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :endpoint_id, references(:endpoints)
      add :status, :integer
      add :headers, :text
      add :body, :text
      add :req_time, :integer
      add :error, :string

      timestamps()
    end
  end
end
