defmodule SSHChecker do
  def check_port(host, port \\ 22, timeout \\ 5000) do
    case :gen_tcp.connect(String.to_charlist(host), port, [], timeout) do
      {:ok, socket} ->
        :gen_tcp.close(socket)
        {:ok, "SSH port is open"}

      {:error, reason} ->
        {:error, "SSH port is closed: #{reason}"}
    end
  end
end
