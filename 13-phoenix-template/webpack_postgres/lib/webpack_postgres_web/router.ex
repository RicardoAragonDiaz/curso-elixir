defmodule WebpackPostgresWeb.Router do
  use WebpackPostgresWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    #plug WebpackPostgresWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebpackPostgresWeb, as: :root  do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    #resources "/users", UserController
    #resources "/posts", PostController, only: [:index, :show]
    #resources "/comments", CommentController, except: [:delete]

    ## anidado
    #resources "/users", UserController do
    #  resources "/posts", PostController do
    #    resources "/comments", CommentController
    #  end
    #  resources "/friends", FriendsController
    #end


  end

  #scope "/admin", WebpackPostgresWeb.Admin, as: :admin do
  #  pipe_through :browser
  #
  #  resources "/reviews", ReviewController
  #  resources "/images",  ImageController
  #  resources "/users",   UserController
  #end
  # Other scopes may use custom stacks.
  # scope "/api", WebpackPostgresWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: WebpackPostgresWeb.Telemetry
    end
  end
end
