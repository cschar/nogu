defmodule Nogu.Git do

def start_deploy() do

    IO.puts("hi")
    Process.sleep(1000)
    {:ok}
    
end

def create_org() do

    Process.sleep(1000)
{:ok, "test_org"}

end


def create_repo(org) do

    Process.sleep(1000)
{:ok, "git@git.com/repo.git"}
end

def push_contents(repo) do
    Process.sleep(1000)
{:ok}
end



end
