defmodule ProductStockTest do
  use ExUnit.Case
  doctest ProductStock

  test "greets the world" do
    assert ProductStock.hello() == :world
  end
end
