defmodule PhoenixLiveviewValidations.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :email, :string
    field :gender, :string
    field :name, :string
    field :password, :string
    field :password_confirmation, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :password_confirmation, :gender, :age])
    |> validate_required([:name, :email, :password, :password_confirmation, :gender, :age],
      message: "Please fill out this field"
    )
    |> validate_length(:name, min: 3, message: "Please enter at least 3 characters")
    |> validate_inclusion(:gender, ["male", "female"], message: "Gender has to be either male or female")
    |> validate_inclusion(:age, 1..100 , message: "The age has to be a number between 1 and 100")
    |> validate_exclusion(:email , ["admin@gmail.com" , "administrator@gmail.com"])
    |> validate_length(:name, min: 3 , max: 20 , message: "Name has to be between 3 and 20 characters")
    |> validate_format(:email, ~r/@/, message: "Please enter a valid email with an @")
    |> validate_format(:password, ~r/(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}/, message: "Password must contain at least 8 characters, one uppercase, one lowercase and one number")
    |> validate_number(:age, greater_than: 0, message: "Age must be greater than 0")
    |> unique_constraint(:email, message: "This email is already taken")
    |> validate_confirmation(:password, message: "Passwords do not match")

  end
end
