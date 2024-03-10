defmodule TodoApp.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :done, :boolean, default: false
    field :text, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:text, :done, :user_id])
    |> validate_required([:text, :done, :user_id])
  end
end
