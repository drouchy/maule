defmodule SearchSupervisor do
  use ExUnit.Case
  use Webtest.Case

  test "it starts the console worker" do
    assert Process.whereis(:maule_console) != nil
  end

  test "it restarts the console worker when it crashes" do
    pid = Process.whereis(:maule_console)

    Process.exit pid, :to_test

    with_retries 5, 10 do
      new_pid = Process.whereis(:maule_console)
      assert new_pid != nil
      assert new_pid != pid
    end
  end

  test "it starts the config worker" do
    assert Process.whereis(:maule_config) != nil
  end

  test "it restarts the config worker when it crashes" do
    pid = Process.whereis(:maule_config)

    Process.exit pid, :to_test

    with_retries 5, 10 do
      new_pid = Process.whereis(:maule_config)
      assert new_pid != nil
      assert new_pid != pid
    end
  end
end