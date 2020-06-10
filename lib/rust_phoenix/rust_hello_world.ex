defmodule RustPhoenix.RustHelloWorld do
  use Rustler, otp_app: :rust_phoenix, crate: :rustphoenix_rusthelloworld

  def add(_arg1, _arg2), do: :erlang.nif_error(:nif_not_loaded)
end
