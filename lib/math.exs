defmodule Math do
  def add(a, b) do
    receive do
      senders_pid ->
        send(senders_pid, a + b)
    end
  end

  def double(n) do
    spawn(Math, :add, [n, n])
    |> send(self())

    receive do
      doubled ->
        doubled
    end
  end
end
