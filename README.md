## Elixir Functional Programming Technical Evaluation

Code quality is very important to us. We're sending you this challenge so that we can evaluate your coding skills with Elixir.

#### What we expect from your code

- Clean code
- Consistent style
- Extesibility
- Maintainability
- Testablity

### The challenge

You are tasked with implementing a data processing pipeline that transforms a list of maps representing user data. The pipeline should be modular, allowing for easy addition or removal of transformations. Each transformation function should be pure, meaning it does not produce side effects and always returns the same output given the same input.

#### Requirements

1. **Data Structure**:

   - You will be working with a list of maps. Each map represents a user and contains the following keys:

     - `:name` (string) – The user's full name.
     - `:city` (string) – The city where the user lives.
     - `:birthdate` (string) – The user's birthdate in one of the following formats:
       - `YYYY-MM-DD` (e.g., `"1980-04-15"`)
       - `DD/MM/YYYY` (e.g., `"14/04/1980"`)
       - `DD-MM-YYYY` (e.g., `"15-04-1980"`)

   - Example input data:
     ```elixir
     [
       %{name: "John Doe", city: "New York", birthdate: "1980-04-15"},
       %{name: "jane smith", city: "Los Angeles", birthdate: "15/04/1980"},
       %{name: "ALICE JOHNSON", city: "New York", birthdate: "15-04-1980"}
     ]
     ```

2. **Transformations**:

   - **Filter Users by City**: Implement a function that filters out users who do not live in a specified city.
   - **Capitalize User Names**: Implement a function that capitalizes the first letter of each word in the user's name.
   - **Convert Birthdate Format**: Implement a function that converts the user's birthdate to `DD/MM/YYYY` format, handling the different input formats listed above.

3. **Pipeline Composition**:

   - Implement a function that composes the above transformations into a data processing pipeline. The pipeline should take the list of users as input and apply each transformation in sequence.
   - The pipeline should be flexible enough to allow adding or removing transformations easily.

4. **Output**:

   - After applying the transformations, the pipeline should return the transformed list of users.

   ```elixir
     [
       %{name: "John Doe", city: "New York", birthdate: "1982-11-05"},
       %{name: "jane smith", city: "Los Angeles", birthdate: "22/04/1976"},
       %{name: "ALICE JOHNSON", city: "New York", birthdate: "15-04-1980"}
     ]
     |> TeacherspaceElixirChallenge.process(city: "New York")

     # Example output (order of entries doesn't matter):
     # [
     #   %{name: "John Doe", city: "New York", birthdate: "05/11/1982"},
     #   %{name: "Alice Johnson", city: "New York", birthdate: "15/04/1980"}
     # ]
   ```

### Instructions

- Use only Elixir's standard library.
- Implement your solution in a functional style, avoiding mutable state and side effects.
- Write your solution in the `lib/` directory and ensure your code is modular and extensible.
- Write tests for your code using ExUnit and place them in the `test/` directory. You should write at least 3 tests but no more than 6.
- Don't worry about invalid input data.

### Example Code Structure

```elixir
# File: lib/teacherspace_elixir_challenge.ex

defmodule TeacherspaceElixirChallenge do
  def process(users, opts \\ []) do
    # TODO
  end
end
```
