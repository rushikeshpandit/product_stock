defmodule ProductStock do
  def handle_stock(stock) do
    receive do
      {:add, from, product} ->
        stock_update = [product] ++ stock
        log(from, :add)
        send(from, stock_update)
        handle_stock(stock_update)

      {:status, from} ->
        log(from, :status)
        send(from, stock)
        handle_stock(stock)
    end
  end

  def log(pid, :add), do: IO.inspect("#{:erlang.pid_to_list(pid)} added new item to the stack ")

  def log(pid, :status),
    do: IO.inspect("#{:erlang.pid_to_list(pid)} checked the stack ")
end
