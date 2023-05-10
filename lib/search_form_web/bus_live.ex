defmodule SearchFormWeb.BusLive do
  use SearchFormWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        search_bus: "",
        buses: []
      )

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <div>
      <h2 class="font-sans font-bold text-center text-2xl text-purple-600">In the search box, enter the point of origin and destination</h2>
      <form phx-submit="search" phx-change="search" phx-value="search_bus"  class="mt-4 flex gap-2">
        <input type="text" name="search_bus" autofocus autocomplete="off" class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-blue-500 focus:ring-blue-500" placeholder="FROM" />
        <input type="text" name="search_bus" autofocus autocomplete="off" class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-blue-500 focus:ring-blue-500" placeholder="TO" />
        <button type="submit" class="w-full rounded-lg bg-blue-700 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 sm:w-auto">Submit</button>
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
               <button class="mt-4 rounded-full border border-[#F0F0F6] bg-[#F4F5FA] px-4 py-3 shadow-xl">Book Now</button>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  def filtered_buses(search_bus) do
    search_bus
    |> String.downcase()
    |> filter_by_from()
    |> filter_by_to()
  end

  defp filter_by_to(search_bus) do
    getBuses()
    |> Enum.filter(fn bus ->
      String.downcase(bus.to) == search_bus
    end)
  end

  defp filter_by_from(search_bus) do
    getBuses()
    |> Enum.filter(fn bus ->
      String.downcase(bus.from) == search_bus
    end)
  end

  def handle_event("search", %{"search_bus" => search_bus}, socket) do
    filtered_buses = filtered_buses(search_bus)
    {:noreply, assign(socket, buses: filtered_buses)}
  end

  defp getBuses do
    [
      %{from: "Theni", to: "Coimbatore", price: "1099", timing: "9:00 AM"},
      %{from: "Coimbatore", to: "Chennai", price: "1099", timing: "10:30 AM"},
      %{from: "Villupuram", to: "Chennai", price: "980", timing: "12:00 PM"},
      %{from: "Chennai", to: "Villupuram", price: "980", timing: "2:00 PM"},
      %{from: "Kanyakumari", to: "Theni", price: "1139", timing: "7:00 AM"},
      %{from: "Villupuram", to: "Thiruvarur", price: "1139", timing: "9:00 PM"},
      %{from: "Villupuram", to: "Thiruvarur", price: "1139", timing: "12:30 PM"},
      %{from: "Kanyakumari", to: "Theni", price: "1139", timing: "9:00 PM"},
      %{from: "Chennai", to: "Coimbatore", price: "1099", timing: "8:00 AM"},
      %{from: "Theni", to: "Villupuram", price: "1139", timing: "7:00 AM"}
    ]
  end
end
