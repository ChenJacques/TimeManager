defmodule Timemanager.WorkingtimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.Workingtimes` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~U[2023-10-23 13:42:00Z],
        start: ~U[2023-10-23 13:42:00Z]
      })
      |> Timemanager.Workingtimes.create_workingtime()

    workingtime
  end

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~U[2023-10-23 13:58:00Z],
        start: ~U[2023-10-23 13:58:00Z]
      })
      |> Timemanager.Workingtimes.create_workingtime()

    workingtime
  end
end
