defmodule AresWeb.Websockets.LogSocket do
  @moduledoc """
    `Phoenix.Socket.Transport implementation of a binary protocol for
    exchanging binary-encoded server logs between two servers`
  """

  @behaviour Phoenix.Socket.Transport

  require Logger

  @impl true
  def child_spec(opts) do
    endpoint = Keyword.fetch!(opts, :endpoint)
    partitions = Keyword.get(opts, :partitions, System.schedulers_online())

    Supervisor.child_spec({Phoenix.Socket.PoolSupervisor, {endpoint, __MODULE__, partitions}},
      id: __MODULE__
    )
  end

  def connect(transport_info) do
    {:ok, transport_info}
  end

  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_in({_text, _opts}, state) do
    Logger.warn("recived msg okay!")
    {:ok, state}
  end

  @impl true
  def terminate(_reason, _state) do
    :ok
  end
end
