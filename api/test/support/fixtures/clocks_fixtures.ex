defmodule Timemanager.ClocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.Clocks` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~U[2023-10-23 09:28:00Z]
      })
      |> Timemanager.Clocks.create_clock()

    clock
  end
end
