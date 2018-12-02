defmodule PollingWeb.PollChannel do
  use PollingWeb, :channel

  alias Polling.Polls

  def join("polls", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("vote:up", %{"poll_id" => poll_id}, socket) do
    poll = poll_id |> String.to_integer() |> Polls.get_poll!()

    {:ok, updated_poll} = Polls.update_poll(poll, %{up_votes: poll.up_votes + 1})

    payload = Map.take(updated_poll, [:id, :up_votes])

    broadcast(socket, "vote:up", payload)

    {:noreply, socket}
  end

  def handle_in("vote:down", %{"poll_id" => poll_id}, socket) do
    poll = poll_id |> String.to_integer() |> Polls.get_poll!()

    {:ok, updated_poll} = Polls.update_poll(poll, %{down_votes: poll.down_votes + 1})

    payload = Map.take(updated_poll, [:id, :down_votes])

    broadcast(socket, "vote:down", payload)

    {:noreply, socket}
  end
end
