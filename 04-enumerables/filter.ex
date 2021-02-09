defmodule Myfilter do
  def filter(list, func?) when is_list(list), do: filterp(list, func?)

  defp filterp([], _), do: []
  defp filterp([h | t], condition?) when is_function(condition?,1) do
    case condition?.(h) do
      true  -> [h | filterp(t, condition?)]
      false -> filterp(t, condition?)
    end
  end
end

## caso 1
IO.inspect Myfilter.filter([1, 2, 3, 4, 5], &(rem(&1, 2) == 0)) # [1, 3, 5]
