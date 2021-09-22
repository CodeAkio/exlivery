defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params area valid, return the user" do
      response =
        User.build(
          "Marcos",
          "marcos@email.com",
          "111.111.111-11",
          20,
          "Rua Algusto"
        )

      expected_response =
        {:ok,
         %User{
           address: "Rua Algusto",
           age: 20,
           cpf: "111.111.111-11",
           email: "marcos@email.com",
           name: "Marcos"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Marcos",
          "marcos@email.com",
          "111.111.111-11",
          17,
          "Rua Algusto"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
