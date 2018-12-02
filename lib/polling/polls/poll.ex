defmodule Polling.Polls.Poll do
  use Ecto.Schema
  import Ecto.Changeset


  schema "polls" do
    field :description, :string
    field :down_votes, :integer, default: 0
    field :up_votes, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(poll, attrs) do
    poll
    |> cast(attrs, [:description, :up_votes, :down_votes])
    |> validate_required([:description])
  end
end
