defmodule HttpWatch.Poet do
  alias HttpWatch.{Repo, Repo.Endpoint}
  import Ecto.Query

  @moduledoc """
  Generate endpoints to test
  """

  def endpoints do
    Repo.all(from(ep in Endpoint, where: ep.active == true))
  end
end
