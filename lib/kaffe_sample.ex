defmodule KaffeSample do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(Kaffe.Consumer, [])
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end

  def handle_message(message) do
    IO.puts "kaffe #{message.topic} topic, partition #{message.partition}, offset: #{message.offset}: #{message.key}"
    :ok
  end
end
