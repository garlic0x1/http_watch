defmodule HttpWatchTest do
  use ExUnit.Case
  doctest HttpWatch

  test "greets the world" do
    assert HttpWatch.hello() == :world
  end
end
