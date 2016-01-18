#defmodule PacIexTools do
#  @doc """
#  List of functions for given module, optionally narrowed with regex
#  ## Examples
#    > mi_funcs String, "sl"
#    > mi_funcs String
#    > String |> mi_funcs("sl") |> List.first
#  """
#  def mi_funcs(mod, regex \\ "") do
#    (mod.module_info)[:exports] 
#      |> Enum.sort 
#      |> Enum.map(fn {y, n} -> "#{to_string y}/#{n}" end) 
#      |> Enum.filter &(Regex.run ~r{#{regex}}, &1)
#  end
#  #mi_funcs = fn mod -> mi_funcs.(mod, "") end
#  #mi_funcs = &mi_funcs.(&1, "")
#end
