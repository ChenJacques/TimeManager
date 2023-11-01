defmodule Timemanager.Workingtimes.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :start, :utc_datetime
    field :end, :utc_datetime
    field :user, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:start, :end, :user])
    |> validate_required([:start, :end], message: "can't be null - YYYY-MM-DD HH:MM:SS")
    |> validate_required([:user], message: "can't be null")
  end
end
