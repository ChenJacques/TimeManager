defmodule Timemanager.Clocks.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: true
    field :time, :utc_datetime
    field :user, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:time, :status, :user])
    |> validate_required([:time], message: "can't be null")
    |> validate_required([:status], message: "can't be null")
    |> validate_required([:user], message: "can't be null")
  end
end
