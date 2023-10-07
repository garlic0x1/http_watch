defmodule HttpWatch.Notify.Discord do
  @dev_hook Application.compile_env(:http_watch, __MODULE__)[:dev_discord]
  @json [{"Content-Type", "application/json"}]

  @moduledoc """
  Send notifications to myself or others
  """

  def send_discord(msg, url \\ @dev_hook) do
    payload = %{username: "PhoenixBot", content: msg}

    Finch.build(:post, url, @json, Jason.encode_to_iodata!(payload))
    |> Finch.request(HttpWatch.Finch)
  end
end
