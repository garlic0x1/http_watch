defmodule HttpWatch.Scanner do
  import HttpWatch.Scanner.{Poet, Courier, Oracle, Recorder}
  import HttpWatch.Notify.Discord

  def scan_endpoint(ep) do
    record(observe(ep), ep)
    t = changed? ep

    if t, do: send_discord(":#{to_string(t)} `#{ep.url}`")
  end

  defp run() do
    for ep <- endpoints(), do: scan_endpoint(ep)
  end

  def child_spec(_arg) do
    Periodic.child_spec(
      id: __MODULE__,
      run: &run/0,
      every: :timer.hours(1)
    )
  end
end
