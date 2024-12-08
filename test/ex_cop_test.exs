defmodule ExCopTest do
  use ExUnit.Case, async: true

  setup context do
    bad =
      ["test", "fixtures", "#{context[:fixture]}-bad.ex"]
      |> Path.join()
      |> File.read!()

    good =
      ["test", "fixtures", "#{context[:fixture]}-good.ex"]
      |> Path.join()
      |> File.read!()

    %{bad: bad, good: good}
  end

  @tag fixture: "linting-modules-module-layout"
  test "corrects the order of module references", %{bad: bad, good: good} do
    formatted = ExCop.format_string(bad)

    assert formatted == good
  end

  @tag fixture: "linting-favor-pipeline-operator"
  test "transforms nested function calls to pipelines", %{bad: bad, good: good} do
    formatted = ExCop.format_string(bad)

    assert formatted == good
  end
end
