defmodule VerySimpleFormWeb.Home do
  use VerySimpleFormWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Very Simple Form!</h1>
    <.simple_form for={@form}>
      <.input field={@form[:name]} label="Name" />
      <.button>Submit</.button>
    </.simple_form>
    """
  end

  def mount(_params, _session, socket) do
    form = to_form(%{"name" => ""})
    socket = assign(socket, form: form)
    {:ok, socket}
  end
end
