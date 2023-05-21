defmodule PhoenixLiveviewValidationsWeb.UserLive.Index do
  use PhoenixLiveviewValidationsWeb, :live_view

  alias PhoenixLiveviewValidations.Users
  alias PhoenixLiveviewValidations.Users.User

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :user_collection, list_user())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit User")
    |> assign(:user, Users.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New User")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing User")
    |> assign(:user, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    user = Users.get_user!(id)
    {:ok, _} = Users.delete_user(user)

    {:noreply, assign(socket, :user_collection, list_user())}
  end

  defp list_user do
    Users.list_user()
  end
end
