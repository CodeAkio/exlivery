defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      name: "Marcos",
      email: "marcos@email.com",
      cpf: "111.111.111-11",
      age: 20,
      address: "Rua Algusto"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua Algusto",
      items: [
        build(:item),
        %Item{
          category: :japonesa,
          description: "Temaki de atum",
          quantity: 2,
          unity_price: Decimal.new("20.50")
        }
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "111.111.111-11"
    }
  end
end
