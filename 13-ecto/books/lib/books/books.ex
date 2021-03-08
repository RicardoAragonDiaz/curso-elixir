defmodule Books.Author do
  use Ecto.Schema

  schema "author" do
    field    :name,      :string
    field    :last_name, :string
    has_many :book,      Books.Book
  end

  def changeset(author, params \\ %{}) do
    author
    |> Ecto.Changeset.cast(params, [:name, :last_name])
    |> Ecto.Changeset.validate_required([:name, :last_name])
  end
end

defmodule Books.Book do
  use Ecto.Schema

  schema "book" do
    field      :name,    :string
    belongs_to :author,  Books.Author
  end

  def changeset(book, params \\ %{}) do
    book
    |> Ecto.Changeset.cast(params, [:name, :author_id])
    |> Ecto.Changeset.validate_required([:name, :author_id])
  end
end


 # book = %Books.Book{}
    # book = %Books.Book{name: "libro1"}
  # Books.Repo.insert(book)
  # another - {:ok, book} = Books.Repo.insert book

#iex(1)> book = %Books.Book{name: "nuevo lib"}
#%Books.Book{
#  __meta__: #Ecto.Schema.Metadata<:built, "book">,
#  id: nil,
#  name: "nuevo lib"
#}
#iex(2)> changeset = Books.Book.changeset(book, %{})
##Ecto.Changeset<action: nil, changes: %{}, errors: [], data: #Books.Book<>,
# valid?: true>
#iex(3)> Books.Repo.insert(changeset)
#
#11:24:29.653 [debug] QUERY OK db=79.0ms queue=15.0ms idle=1563.0ms
#INSERT INTO "book" ("name") VALUES ($1) RETURNING "id" ["nuevo lib"]
#{:ok,
# %Books.Book{
#   __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#   id: 2,
#   name: "nuevo lib"
# }}

###################
## with :error
# book = %Books.Book{}
# changeset = Books.Book.changeset(book, %{})
# Books.Repo.insert(changeset)
#{:error,
# #Ecto.Changeset<
#   action: :insert,
#   changes: %{},
#   errors: [name: {"can't be blank", [validation: :required]}],
#   data: #Books.Book<>,
#   valid?: false
# >}
# other {:error, changeset} = Books.Repo.insert(changeset)
#
# changeset.errors
#
########Fetching a single record
# iex(13)> Books.Book |> Ecto.Query.first
# Ecto.Query<from b0 in Books.Book, order_by: [asc: b0.id], limit: 1>
#
# Ecto.Query.from b in Books.Book, order_by: [asc: b.id], limit: 1
# query = Ecto.Query.from b in Books.Book, order_by: [asc: b.id], limit: 1
# Books.Repo.one(query)




####################
# iex(6)> from b in Books.Book
# #Ecto.Query<from b0 in Books.Book>
# iex(7)> Books.Repo.all(from b in Books.Book)
#
# 14:12:40.717 [debug] QUERY OK source="book" db=16.0ms idle=1062.0ms
# SELECT b0."id", b0."name" FROM "book" AS b0 []
# [
#   %Books.Book{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#     id: 1,
#     name: "Sin fin"
#   },
#   %Books.Book{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#     id: 2,
#     name: "nuevo lib"
#   }
# ]
# (from b in Books.Book) |> Books.Repo.all()
# consultar po id
# Books.Book |> Books.Repo.get(2)
# ather way - Books.Repo.get(Books.Book, 1)
# 7)> Books.Repo.get_by(Books.Book, name: "Sin fin")
#
# 14:31:02.845 [debug] QUERY OK source="book" db=16.0ms idle=639.9ms
# SELECT b0."id", b0."name" FROM "book" AS b0 WHERE (b0."name" = $1) ["Sin fin"]
# %Books.Book{
#   __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#   id: 1,
#   name: "Sin fin"
# }
## cuando hay registros dubplicados (2 libros1)
#iex(26)> Books.Repo.get_by(Books.Book, name: "libro1")
#
#14:35:06.400 [debug] QUERY OK source="book" db=0.0ms idle=110.0ms
#SELECT b0."id", b0."name" FROM "book" AS b0 WHERE (b0."name" = $1) ["libro1"]
#** (Ecto.MultipleResultsError) expected at most one result but got 2 in query:
#
#from b0 in Books.Book,
#  where: b0.name == ^"libro1"
#
#    (ecto 3.5.7) lib/ecto/repo/queryable.ex:152: Ecto.Repo.Queryable.one/3
#iex(26)>
#
#####################
#iex(28)> Books.Book |> where(name: "libro1") |> Books.Repo.all()
#
#14:38:43.406 [debug] QUERY OK source="book" db=0.0ms idle=109.9ms
#SELECT b0."id", b0."name" FROM "book" AS b0 WHERE (b0."name" = 'libro1') []
#[
#  %Books.Book{
#    __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#    id: 3,
#    name: "libro1"
#  },
#  %Books.Book{
#    __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#    id: 4,
#    name: "libro1"
#  }
#]
# iex(30)> query = from(b in Books.Book, where: b.name == "libro1")
# #Ecto.Query<from b0 in Books.Book, where: b0.name == "libro1">
# iex(31)> Books.Repo.all(query)
#
# 14:42:23.218 [debug] QUERY OK source="book" db=0.0ms idle=906.0ms
# SELECT b0."id", b0."name" FROM "book" AS b0 WHERE (b0."name" = 'libro1')
# []
# [
#   %Books.Book{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#     id: 3,
#     name: "libro1"
#   },
#   %Books.Book{
#     __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#     id: 4,
#     name: "libro1"
#   }
# ]
# iex(32)>
############################ Update
# iex(34)> book = Books.Book |> Books.Repo.get(3)
#
# 15:33:28.055 [debug] QUERY OK source="book" db=31.0ms idle=1188.0ms
# SELECT b0."id", b0."name" FROM "book" AS b0 WHERE (b0."id" = $1) [3]
# %Books.Book{
#   __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#   id: 3,
#   name: "libro1"
# }
# iex(35)> changeset = Books.Book.changeset(book, %{name: "hola Nueva York"})
# #Ecto.Changeset<
#   action: nil,
#   changes: %{name: "hola Nueva York"},
#   errors: [],
#   data: #Books.Book<>,
#   valid?: true
# >
# iex(36)> changeset |> Books.Repo.update
#
# 15:34:06.606 [debug] QUERY OK db=78.0ms queue=32.0ms idle=672.0ms
# UPDATE "book" SET "name" = $1 WHERE "id" = $2 ["hola Nueva York", 3]
# {:ok,
#  %Books.Book{
#    __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#    id: 3,
#    name: "hola Nueva York"
#  }}
# iex(37)>
#################### Delete
# iex(1)> book = Books.Book |> Books.Repo.get(4)
#
# 15:38:18.585 [debug] QUERY OK source="book" db=0.0ms queue=15.0ms idle=125.0ms
# SELECT b0."id", b0."name" FROM "book" AS b0 WHERE (b0."id" = $1) [4]
# %Books.Book{
#   __meta__: #Ecto.Schema.Metadata<:loaded, "book">,
#   id: 4,
#   name: "libro1"
# }
# iex(2)> Books.Repo.delete(book)
#
# 15:38:28.095 [debug] QUERY OK db=63.0ms queue=15.0ms idle=579.0ms
# DELETE FROM "book" WHERE "id" = $1 [4]
# {:ok,
#  %Books.Book{
#    __meta__: #Ecto.Schema.Metadata<:deleted, "book">,
#    id: 4,
#    name: "libro1"
#  }}
# iex(3)>
