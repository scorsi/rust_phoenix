defmodule RustPhoenixWeb.PageLive do
  use RustPhoenixWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, result} = RustPhoenix.RustHelloWorld.add(0, 0)
    {:ok, assign(socket, a: 0, b: 0, result: result)}
  end

  @impl true
  def handle_event(
        "compute",
        _,
        %{assigns: %{a: a, b: b}} = socket
      ) do
    {:ok, result} = RustPhoenix.RustHelloWorld.add(a, b)
    {:noreply, assign(socket, result: result)}
  end

  @impl true
  def handle_event(
        "change",
        %{"a" => a, "b" => b},
        socket
      ) do
    {a, _} = Integer.parse(a)
    {b, _} = Integer.parse(b)
    {:noreply, assign(socket, a: a, b: b)}
  end
end
