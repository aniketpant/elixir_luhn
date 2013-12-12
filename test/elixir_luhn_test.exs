defmodule ElixirLuhnTest do
  use ExUnit.Case

  test "card pass" do
    import ElixirLuhn
    assert (is_luhn_valid "79927398713") == false
  end

  test "card fail" do
    import ElixirLuhn
    assert (is_luhn_valid "79927398710") == false
  end
end
