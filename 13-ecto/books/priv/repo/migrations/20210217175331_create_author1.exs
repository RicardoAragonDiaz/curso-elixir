defmodule Books.Repo.Migrations.CreateAuthor1 do
  use Ecto.Migration

  def change do
    create table(:author) do
      add :name,      :string
      add :last_name, :string
    end
  end
end
