defmodule SearchFormWeb.CartsLive do
  use SearchFormWeb, :live_view

  alias SearchForm.Carts

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        filter: %{type: "", prices: []},
        carts: Carts.list_carts()
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Daily cart Rentals</h1>
    <div id="carts">
      <form>
        <div class="filters">
          <select name="type">
            <%= Phoenix.HTML.Form.options_for_select(
              type_options(),
              @filter.type
            ) %>
          </select>
          <div class="prices">
            <%= for price <- ["10,000", "20,000", "30,000"] do %>
              <input
                type="checkbox"
                name="prices[]"
                value={price}
                id={price}
                checked={price in @filter.prices}
              />
              <label for={price}><%= price %></label>
            <% end %>
            <input type="hidden" name="prices[]" value="" />
          </div>
        </div>
      </form>
      <div class="carts">
        <div :for={cart <- @carts} class="cart">
          <img src={cart.image} />
          <div class="content">
            <div class="model">
              <%= cart.model %>
            </div>
            <div class="details">
              <span class="price">
                <%= cart.price %>
              </span>
              <span class="type">
                <%= cart.type %>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  defp type_options do
    [
      "All Types": "",
      Laptop: "laptop",
      SmartPhone: "smartphone",
      Tv: "tv"
    ]
  end
end
