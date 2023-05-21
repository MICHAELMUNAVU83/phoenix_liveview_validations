defmodule PhoenixLiveviewValidations.UsersTest do
  use PhoenixLiveviewValidations.DataCase

  alias PhoenixLiveviewValidations.Users

  describe "user" do
    alias PhoenixLiveviewValidations.Users.User

    import PhoenixLiveviewValidations.UsersFixtures

    @invalid_attrs %{age: nil, email: nil, gender: nil, name: nil, password: nil, password_confirmation: nil}

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Users.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{age: 42, email: "some email", gender: "some gender", name: "some name", password: "some password", password_confirmation: "some password_confirmation"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.age == 42
      assert user.email == "some email"
      assert user.gender == "some gender"
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.password_confirmation == "some password_confirmation"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{age: 43, email: "some updated email", gender: "some updated gender", name: "some updated name", password: "some updated password", password_confirmation: "some updated password_confirmation"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.age == 43
      assert user.email == "some updated email"
      assert user.gender == "some updated gender"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.password_confirmation == "some updated password_confirmation"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
