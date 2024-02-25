defmodule VerySimpleFormWeb.Home do
  use VerySimpleFormWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Very Simple Form!</h1>
    """
  end
end
