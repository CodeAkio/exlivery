defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Marcos",
      email: "marcos@email.com",
      cpf: "111.111.111-11",
      age: 20,
      address: "Rua Algusto"
    }
  end
end
