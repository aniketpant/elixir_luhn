defmodule ElixirLuhn do
  """
  Function to calculate the checksum
  """
  defp luhn_checksum(input) do
    cardNumber = elem (Integer.parse input), 0
    checkDigit = rem cardNumber, 10
    digits = Enum.map(String.codepoints(input), fn(x) -> (elem (Integer.parse x), 0) end)

    oddDigits = Enum.take_every(digits, 2)
    evenDigits = Enum.map(digits -- oddDigits, fn(x) -> x * 2 end)

    sum = List.foldr(oddDigits ++ evenDigits, 0, fn(x, acc) -> x + acc end)

    calculatedCheckDigit = rem (sum * 9), 10
    calculatedCheckDigit - checkDigit
  end

  """
  Function to check if card number is valid
  """
  def is_luhn_valid(cardNumber) do
    if (luhn_checksum cardNumber) == 0 do
      true
    else
      false
    end
  end
end
