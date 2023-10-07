defmodule HttpWatch.Courier do
  @moduledoc """
  HTTP client controls for observing endpoints
  """

  def observe(endpoint) do
    Finch.build(endpoint.method, endpoint.url)
    |> Finch.request(HttpWatch.Finch)
  end
end
