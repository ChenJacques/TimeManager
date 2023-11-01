defmodule Timemanager.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @email ~r/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email], message: "can't be null")
    |> validate_format(:email, @email, message: "can't be null - X@X.X")
  end
end
