defmodule HttpWatch.Scanner.Oracle do
  alias HttpWatch.{Repo, Repo.Response}
  import Ecto.Query

  @moduledoc """
  Logic for deciding if a response has changed
  """

  defp different?(a, b) do
    tests = [
      status: fn ->
        if a.status != b.status, do: :status
      end,
      headers: fn ->
        [aa, bb] =
          Enum.map(
            [a, b],
            fn it ->
              if it.headers, do: it.headers |> Jason.decode!() |> Enum.map(&hd/1)
            end
          )

        IO.puts("headers:")
        IO.inspect(a)
        IO.inspect(b)

        if aa != bb, do: :headers
      end,
      body_length: fn ->
        if a.body && b.body do
          al = String.length(a.body)
          bl = String.length(b.body)
          tolerance = 0.10 * max(al, bl)
          if abs(al - bl) > tolerance, do: :body_length
        end
      end
    ]

    if a && b do
      case Enum.find(tests, fn {_, f} -> f.() end) do
        {res, _} -> res
        _ -> nil
      end
    end
  end

  def different(a, b) do
    false
  end

  @doc """
  Checks last two responses of the given `endpoint` for changes.

  Returns `bool`.
  """
  def changed?(endpoint) do
    rows =
      Repo.all(
        from(resp in Response,
          where: resp.endpoint_id == ^endpoint.id,
          order_by: [desc: resp.inserted_at],
          limit: 2
        )
      )

    case rows do
      [a, b | _] -> different?(a, b)
      _ -> false
    end
  end
end
