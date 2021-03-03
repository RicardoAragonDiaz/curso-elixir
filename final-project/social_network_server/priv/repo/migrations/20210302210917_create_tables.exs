defmodule SocialNetworkServer.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name,     :string
      add :lastname, :string
      add :email,    :string
      add :age,      :integer
      add :status,   :integer
      timestamps()
    end

    create table(:friends) do
      add :user_id,   references(:users), null: false
      add :friend_id, :integer
    end

    create table(:posts) do
      add :title,    :string
      add :content,  :string
      add :status,   :integer
      add :user_id,  references(:users), null: false
      timestamps()
    end

    create table(:comments) do
      add :name,    :string
      add :comment, :string
      add :status,  :integer
      add :post_id, references(:posts), null: false
      timestamps()
    end
  end
end
