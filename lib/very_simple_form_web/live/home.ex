defmodule VerySimpleFormWeb.Home do
  use VerySimpleFormWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Very Simple Form!</h1>
    <.simple_form for={@form} phx-submit="submit">
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

  def handle_event("submit", %{"name" => name}, socket) do
    IO.inspect(name)
    {:noreply, socket}
  end
end
