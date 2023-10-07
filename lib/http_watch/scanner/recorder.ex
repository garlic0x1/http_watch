defmodule TupleEncoder do
  defimpl Jason.Encoder, for: Tuple do
    def encode(data, options) when is_tuple(data) do
      data
      |> Tuple.to_list()
      |> Jason.Encoder.List.encode(options)
    end
  end
end

defmodule HttpWatch.Scanner.Recorder do
  alias HttpWatch.{Repo, Repo.Response}

  @moduledoc """
  Functions for inserting Finch response
  """

  def record({:ok, response}, endpoint) do
    Repo.insert(%Response{
      endpoint: endpoint,
      status: response.status,
      body: response.body,
      headers: Jason.encode!(response.headers)
    })
  end

  def record({:error, err}, endpoint) do
    Repo.insert(%Response{
      endpoint: endpoint,
      error: inspect(err)
    })
  end
end
