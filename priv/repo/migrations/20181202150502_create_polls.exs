defmodule Polling.Repo.Migrations.CreatePolls do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :description, :string, null: false
      add :up_votes, :integer, default: 0
      add :down_votes, :integer, default: 0

      timestamps()
    end
  end
end
