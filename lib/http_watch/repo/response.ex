defmodule HttpWatch.Repo.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    belongs_to :endpoint, HttpWatch.Repo.Endpoint

    field :error, :string
    field :status, :integer
    field :headers, :string
    field :body, :string
    field :req_time, :integer

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:endpoint, :status, :headers, :body, :req_time])
    |> validate_required([:endpoint])
  end
end
