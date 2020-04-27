defmodule CookpodWeb.DemoChannel do
  use CookpodWeb, :channel

  require Logger

  def join("demo:" <> id, payload, socket) do
    if authorized?(payload) do
      {:ok, assign(socket, :id, id)}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, %{from_server: true}}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (demo:lobby).
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  def handle_in(any, payload, socket) do
    Logger.debug("Message came from the client " <> inspect(any))
    Logger.debug("With payload " <> inspect(payload))
    {:noreply, socket}
  end

  def handle_out(any, payload, socket) do
    Logger.debug("Message came from the client " <> inspect(any))
    Logger.debug("With payload " <> inspect(payload))
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
