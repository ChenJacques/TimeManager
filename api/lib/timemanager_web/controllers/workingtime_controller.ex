defmodule TimemanagerWeb.WorkingtimeController do
  use TimemanagerWeb, :controller

  alias Timemanager.Workingtimes
  alias Timemanager.Workingtimes.Workingtime

  action_fallback TimemanagerWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Workingtimes.list_workingtimes()
    render(conn, :index, workingtimes: workingtimes)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Workingtimes.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/workingtimes/#{workingtime}")
      |> render(:show, workingtime: workingtime)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   workingtime = Workingtimes.get_workingtime!(id)
  #   render(conn, :show, workingtime: workingtime)
  # end

  # def showAll(conn, %{"id" => id}) do
  #   workingtime = Workingtimes.get_workingtime!(id)
  #   render(conn, :show, workingtime: workingtime)
  # end

  # get one specific workingtime by id and by user id (user id is not the same as the user name)
  def showbyid(conn, %{"id" => id, "userid" => user}) do
    workingtime = Workingtimes.get_workingtime_by_user(id, user)
    if Enum.empty?(workingtime) do
      conn
      |> put_status(:not_found)
      |> json(%{error: "No workingtime found"})
    else
      render(conn, :index, workingtimes: workingtime)
    end
  end

  def showbydate(conn, %{"userid" => user, "start" => start, "end" => endtime}) do
    workingtime = Workingtimes.plop(user, start, endtime)
    if Enum.empty?(workingtime) do
      conn
      |> put_status(:not_found)
      |> json(%{error: "No workingtime found"})
    else
      render(conn, :index, workingtimes: workingtime)
    end
  end


  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Workingtimes.get_workingtime!(id)
    
    with {:ok, %Workingtime{} = workingtime} <- Workingtimes.update_workingtime(workingtime, workingtime_params) do
      render(conn, :show, workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Workingtimes.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
