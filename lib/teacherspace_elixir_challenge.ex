defmodule TeacherspaceElixirChallenge do
  # Main function that processes the list of users.
  def process(users, opts) do
    users
    |> capitalize_names()
    |> convert_birthdate_formats()
    |> filter_by_city(opts[:city])
  end

  # Filters the list of users by the specified city.
  # If city is nil, it returns the entire list of users.
  def filter_by_city(users, nil), do: users
  def filter_by_city(users, city) do
    Enum.filter(users, fn user -> user.city == city end)
  end

  # Capitalizes the first letter of each word in the user's name.
  def capitalize_names(users) do
    users
    |> Enum.map(fn user ->
      user
      |> Map.update!(:name, fn name ->
        name
        |> String.split(" ")
        |> Enum.map(&String.capitalize/1)
        |> Enum.join(" ")
      end)
    end)
  end

  # Converts the birthdate of each user to DD/MM/YYYY format.
  def convert_birthdate_formats(users) do
    users
    |> Enum.map(fn user ->
      Map.update!(user, :birthdate, &normalize_date_format/1)
    end)
  end

  # Normalizes the date format to the standardized DD/MM/YYYY format.
  defp normalize_date_format(date) do
    case String.split(date, ~r/[-\/]/) do
      [year, month, day] when byte_size(year) == 4 -> # If year is at the beginning
        "#{day}/#{month}/#{year}"

      [day, month, year] when byte_size(year) == 4 ->  # If year is at the end
        "#{day}/#{month}/#{year}"

      _ ->
        date  # Return the original date if it doesn't match the expected format
    end
  end
end
