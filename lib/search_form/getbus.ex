defmodule SearchForm.Getbus do
  def filtered_bus(from, to) do
    :timer.sleep(1000)
    buses = getBuses()

    Enum.filter(buses, fn bus ->
      String.downcase(bus.from) |> String.contains?(String.downcase(from)) &&
        String.downcase(bus.to) |> String.contains?(String.downcase(to))
    end)
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
