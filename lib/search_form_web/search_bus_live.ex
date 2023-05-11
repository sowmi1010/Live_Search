defmodule SearchFormWeb.SearchBusLive do
  use SearchFormWeb, :live_view

  def render(assigns) do
    ~L"""
    <h2 class="font-sans font-bold text-center text-2xl text-purple-600">
    In the search box, enter the point of origin and destination
    </h2>

    <form phx-submit="search" class="mt-4 flex gap-2">
        <input
          type="text"
          name="from"
          autofocus
          autocomplete="off"
          phx-value="from"
          class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-blue-500 focus:ring-blue-500"
          placeholder="FROM"
        />
        <input
          type="text"
          name="to"
          autofocus
          autocomplete="off"
          phx-value="to"
          class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-blue-500 focus:ring-blue-500"
          placeholder="TO"
        />
        <button
          type="submit"
          class="w-full rounded-lg bg-blue-700 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 sm:w-auto"
        >
          Submit
        </button>
      </form>

    <div class="grid grid-cols-3 gap-7 mt-4">
      <%= for bus <- @buses do %>
      <div class="rounded-xl bg-[#ECEEFF]">
        <div class="flex w-96 translate-x-4 translate-y-4 flex-col rounded-xl bg-white p-8 shadow-xl md:w-auto">
          <div class="flex justify-between mt-3 text-lg font-semibold">
            <p><%= bus.from %></p>
            <b class="text-purple-600">To</b>
            <p><%= bus.to %></p>
          </div>
          <div class="flex justify-between my-4">
            <div class="">
              <span class="text-base font-light">₹</span>
              <span class="text-base font-bold"><%= bus.price %></span>
            </div>
            <div class="text-base font-bold"><%= bus.timing %></div>
          </div>
          <button class="mt-4 rounded-full border border-[#F0F0F6] bg-[#F4F5FA] px-4 py-3 shadow-xl">
            Book Now
          </button>
        </div>
      </div>
      <% end %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, from: "", to: "", buses: [])
    {:ok, socket}
  end

  def filtered_bus(from, to) do
    :timer.sleep(3000)
    buses = getBuses()

    Enum.filter(buses, fn bus ->
      String.downcase(bus.from) |> String.contains?(String.downcase(from)) &&
        String.downcase(bus.to) |> String.contains?(String.downcase(to))
    end)
  end

  def handle_event("search", %{"from" => from, "to" => to}, socket) do
    buses = filtered_bus(from, to)
    socket = assign(socket, from: from, to: to, buses: buses)
    {:noreply, socket}
  end

  defp getBuses do
    [
      %{from: "Chennai", to: "Villupuram", price: "1139", timing: "07:00 AM"},
      %{from: "Chennai", to: "Villupuram", price: "1139", timing: "10:00 AM"},
      %{from: "Chennai", to: "Villupuram", price: "1139", timing: "02:00 PM"},
      %{from: "Chennai", to: "Villupuram", price: "1139", timing: "08:00 PM"},
      %{from: "Chennai", to: "Villupuram", price: "1139", timing: "11:00 PM"},
      %{from: "Villupuram", to: "Chennai", price: "1139", timing: "08:00 AM"},
      %{from: "Villupuram", to: "Chennai", price: "1139", timing: "11:00 AM"},
      %{from: "Villupuram", to: "Chennai", price: "1139", timing: "03:00 PM"},
      %{from: "Villupuram", to: "Chennai", price: "1139", timing: "09:00 PM"},
      %{from: "Villupuram", to: "Chennai", price: "1139", timing: "12:00 AM"},
      %{from: "Kanyakumari", to: "Theni", price: "1139", timing: "07:00 AM"},
      %{from: "Kanyakumari", to: "Theni", price: "1139", timing: "10:00 AM"},
      %{from: "Kanyakumari", to: "Theni", price: "1139", timing: "02:00 PM"},
      %{from: "Kanyakumari", to: "Theni", price: "1139", timing: "08:00 PM"},
      %{from: "Kanyakumari", to: "Theni", price: "1139", timing: "11:00 PM"},
      %{from: "Theni", to: "Kanyakumari", price: "1139", timing: "08:00 AM"},
      %{from: "Theni", to: "Kanyakumari", price: "1139", timing: "11:00 AM"},
      %{from: "Theni", to: "Kanyakumari", price: "1139", timing: "03:00 PM"},
      %{from: "Theni", to: "Kanyakumari", price: "1139", timing: "09:00 PM"},
      %{from: "Theni", to: "Kanyakumari", price: "1139", timing: "12:00 AM"},
      %{from: "Villupuram", to: "Thiruvarur", price: "1139", timing: "08:00 AM"},
      %{from: "Villupuram", to: "Thiruvarur", price: "1139", timing: "11:00 AM"},
      %{from: "Villupuram", to: "Thiruvarur", price: "1139", timing: "03:00 PM"},
      %{from: "Villupuram", to: "Thiruvarur", price: "1139", timing: "09:00 PM"},
      %{from: "Villupuram", to: "Thiruvarur", price: "1139", timing: "12:00 AM"},
      %{from: "Thiruvarur", to: "Villupuram", price: "1139", timing: "07:00 AM"},
      %{from: "Thiruvarur", to: "Villupuram", price: "1139", timing: "10:00 AM"},
      %{from: "Thiruvarur", to: "Villupuram", price: "1139", timing: "02:00 PM"},
      %{from: "Thiruvarur", to: "Villupuram", price: "1139", timing: "08:00 PM"},
      %{from: "Thiruvarur", to: "Villupuram", price: "1139", timing: "11:00 PM"},
      %{from: "Chennai", to: "Coimbatore", price: "1139", timing: "08:00 AM"},
      %{from: "Chennai", to: "Coimbatore", price: "1139", timing: "11:00 AM"},
      %{from: "Chennai", to: "Coimbatore", price: "1139", timing: "03:00 PM"},
      %{from: "Chennai", to: "Coimbatore", price: "1139", timing: "09:00 PM"},
      %{from: "Chennai", to: "Coimbatore", price: "1139", timing: "12:00 AM"},
      %{from: "Coimbatore", to: "Chennai", price: "1139", timing: "07:00 AM"},
      %{from: "Coimbatore", to: "Chennai", price: "1139", timing: "10:00 AM"},
      %{from: "Coimbatore", to: "Chennai", price: "1139", timing: "02:00 PM"},
      %{from: "Coimbatore", to: "Chennai", price: "1139", timing: "08:00 PM"},
      %{from: "Coimbatore", to: "Chennai", price: "1139", timing: "11:00 PM"},
      %{from: "Theni", to: "Villupuram", price: "1139", timing: "08:00 AM"},
      %{from: "Theni", to: "Villupuram", price: "1139", timing: "11:00 AM"},
      %{from: "Theni", to: "Villupuram", price: "1139", timing: "03:00 PM"},
      %{from: "Theni", to: "Villupuram", price: "1139", timing: "09:00 PM"},
      %{from: "Theni", to: "Villupuram", price: "1139", timing: "12:00 AM"},
      %{from: "Villupuram", to: "Theni", price: "1139", timing: "07:00 AM"},
      %{from: "Villupuram", to: "Theni", price: "1139", timing: "10:00 AM"},
      %{from: "Villupuram", to: "Theni", price: "1139", timing: "02:00 PM"},
      %{from: "Villupuram", to: "Theni", price: "1139", timing: "08:00 PM"},
      %{from: "Villupuram", to: "Theni", price: "1139", timing: "11:00 PM"}
    ]
  end
end
