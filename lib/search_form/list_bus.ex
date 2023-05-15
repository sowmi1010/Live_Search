defmodule SearchForm.ListBus do
  def auto_search("") do
    %{}
  end

  def auto_search(prefix) do
    list_cities()
    |> Enum.filter(fn city ->
      String.starts_with?(String.upcase(city), String.upcase(prefix))
    end)
    |> Enum.map(fn city ->
      {city, city}
    end)
    |> Enum.into(%{})
  end

  def list_cities do
    [
      "Nilgiris",
      "Ariyalur",
      "Ooty",
      "Bangalore",
      "Perambalur",
      "Chennai",
      "Pondicherry",
      "Coimbatore",
      "Cuddalore",
      "Dharmapuri",
      "Salem",
      "Dindigul",
      "Thanjavur",
      "Erode",
      "Theni",
      "Thoothukudi",
      "Kanchipuram",
      "Kanyakumari",
      "Tirunelveli",
      "Tirupathi",
      "Karur",
      "Tirupur",
      "Tiruvannamalai",
      "Madurai",
      "Tiruvarur",
      "Trichy",
      "Vellore",
      "Viluppuram"
    ]
  end
end
