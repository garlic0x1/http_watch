defmodule HttpWatch.Repo.Endpoint do
  use Ecto.Schema
  import Ecto.Changeset

  schema "endpoints" do
    field :url, :string
    field :method, :string
    field :active, :boolean

    has_many :responses, HttpWatch.Repo.Response

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :method, :active])
    |> validate_required([:url])
  end
end
