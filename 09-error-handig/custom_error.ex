defmodule CustomError do
  defexception [:message, contry: "Colombia"]
end

defmodule DefaultError do
  defexception message: "My default Error"
end

# iex> raise CustomError
# iex> raise DefaultError
# iex> raise DefaultError, message: "Not my default error"
