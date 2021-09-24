defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link()
      response = UserAgent.save(user)

      assert response == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link()

      :ok
    end

    test "when the user is found, return the user" do
      :user
      |> build(cpf: "111.111.111-11")
      |> UserAgent.save()

      response = UserAgent.get("111.111.111-11")

      expected_response =
        {:ok,
         %User{
           address: "Rua Algusto",
           age: 20,
           cpf: "111.111.111-111",
           email: "marcos@email.com",
           name: "Marcos"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("000.000.000-00")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
