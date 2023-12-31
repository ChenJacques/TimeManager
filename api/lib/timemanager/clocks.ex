defmodule Timemanager.Clocks do
  @moduledoc """
  The Clocks context.
  """

  import Ecto.Query, warn: false
  alias Timemanager.Workingtimes
  alias Timemanager.Repo

  alias Timemanager.Clocks.Clock

  @doc """
  Returns the list of clocks.

  ## Examples

      iex> list_clocks()
      [%Clock{}, ...]

  """
  def list_clocks do
    Repo.all(Clock)
  end

  @doc """
  Gets a single clock.

  Raises `Ecto.NoResultsError` if the Clock does not exist.

  ## Examples

      iex> get_clock!(123)
      %Clock{}

      iex> get_clock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clock!(id), do: Repo.get!(Clock, id)

  @doc """
  Creates a clock.

  ## Examples

      iex> create_clock(%{field: value})
      {:ok, %Clock{}}

      iex> create_clock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clock(attrs \\ %{}) do
    current_time = Timex.now()
    user_id = Map.get(attrs, "user")

    num_visits = count_user_visits(user_id)

    status =
      if rem(num_visits, 2) == 0 do
        true
      else
        false
    end

    if status == false do
      previous_clock = Repo.one(from(c in Clock, where: c.user == ^user_id, order_by: [desc: :inserted_at], limit: 1))
      Workingtimes.create_workingtime(%{user: user_id, start: previous_clock.time, end: current_time})
    else
    end

    changes = %{
      time: current_time,
      user: user_id,
      status: status
    }

    %Clock{}
    |> Clock.changeset(changes)
    |> Repo.insert()
  end


  @doc """
  Updates a clock.

  ## Examples

      iex> update_clock(clock, %{field: new_value})
      {:ok, %Clock{}}

      iex> update_clock(clock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clock.

  ## Examples

      iex> delete_clock(clock)
      {:ok, %Clock{}}

      iex> delete_clock(clock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clock changes.

  ## Examples

      iex> change_clock(clock)
      %Ecto.Changeset{data: %Clock{}}

  """
  def change_clock(%Clock{} = clock, attrs \\ %{}) do
    Clock.changeset(clock, attrs)
  end

  def count_user_visits(user_id) do
    from(c in Clock, where: c.user == ^user_id, select: count(c.id))
    |> Repo.one()
  end

end
