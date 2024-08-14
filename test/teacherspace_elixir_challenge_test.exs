defmodule TeacherspaceElixirChallengeTest do
  use ExUnit.Case
  doctest TeacherspaceElixirChallenge

  defmodule TeacherspaceElixirChallengeTest do
    use ExUnit.Case
    alias TeacherspaceElixirChallenge

    describe "process/2" do
      setup do
        users = [
          %{name: "John Doe", city: "New York", birthdate: "1982-11-05"},
          %{name: "jane smith", city: "Los Angeles", birthdate: "22/04/1976"},
          %{name: "ALICE JOHNSON", city: "New York", birthdate: "15-04-1980"}
        ]

        {:ok, users: users}
      end

      test "capitalizes names correctly", %{users: users} do
        result = users |> TeacherspaceElixirChallenge.capitalize_names()

        expected = [
          %{name: "John Doe", city: "New York", birthdate: "1982-11-05"},
          %{name: "Jane Smith", city: "Los Angeles", birthdate: "22/04/1976"},
          %{name: "Alice Johnson", city: "New York", birthdate: "15-04-1980"}
        ]

        assert result == expected
      end

      test "converts birthdates to DD/MM/YYYY format", %{users: users} do
        result = users |> TeacherspaceElixirChallenge.convert_birthdate_formats()

        expected = [
          %{name: "John Doe", city: "New York", birthdate: "05/11/1982"},
          %{name: "jane smith", city: "Los Angeles", birthdate: "22/04/1976"},
          %{name: "ALICE JOHNSON", city: "New York", birthdate: "15/04/1980"}
        ]

        assert result == expected
      end

      test "filters users by city", %{users: users} do
        result = users |> TeacherspaceElixirChallenge.process(city: "New York")

        expected = [
          %{name: "John Doe", city: "New York", birthdate: "05/11/1982"},
          %{name: "Alice Johnson", city: "New York", birthdate: "15/04/1980"}
        ]

        assert result == expected
      end

      test "empty array when no users in city", %{users: users} do
        result = users |> TeacherspaceElixirChallenge.process(city: "Chicago")

        expected = []

        assert result == expected
      end

      test "process with city option", %{users: users} do
        result = users |> TeacherspaceElixirChallenge.process(city: "New York")

        expected = [
          %{name: "John Doe", city: "New York", birthdate: "05/11/1982"},
          %{name: "Alice Johnson", city: "New York", birthdate: "15/04/1980"}
        ]

        assert result == expected
      end

      test "process without city option", %{users: users} do
        result = users |> TeacherspaceElixirChallenge.process(%{})

        expected = [
          %{name: "John Doe", city: "New York", birthdate: "05/11/1982"},
          %{name: "Jane Smith", city: "Los Angeles", birthdate: "22/04/1976"},
          %{name: "Alice Johnson", city: "New York", birthdate: "15/04/1980"}
        ]

        assert result == expected
      end
    end
  end
end
