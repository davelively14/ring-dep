defmodule Ring do

  # Create n number of processes that each run the loop function. Returns
  # a list of spawned pids.
  def create_processes(n) do
    1..n |> Enum.map(fn _ -> spawn(fn -> loop end) end)
  end

  def loop do
    receive do
      {:link, link_to} when is_pid(link_to) ->
        Process.link(link_to)
        loop
      :crash ->
        1/0
    end
  end
end
