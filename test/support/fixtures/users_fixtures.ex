defmodule PhoenixLiveviewValidations.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixLiveviewValidations.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        email: "some email",
        gender: "some gender",
        name: "some name",
        password: "some password",
        password_confirmation: "some password_confirmation"
      })
      |> PhoenixLiveviewValidations.Users.create_user()

    user
  end
end
