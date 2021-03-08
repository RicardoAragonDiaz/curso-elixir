defmodule Books.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:book) do
      add :name,      :string
      add :author_id, references(:author), null: false
    end
  end
end
