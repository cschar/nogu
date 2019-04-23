defmodule NoguWeb.GithubDeployView do
    use Phoenix.LiveView
  
    # def render(assigns) do
    #     ~L"""
    #     <div class="">
    #       <div>
    #         <div>
    #           <button phx-click="github_deploy">Deploy to GitHub</button>
    #         </div>
    #         Status: <%= @deploy_step %>
    #       </div>
    #     </div>
    #     """
    # end

    def render(assigns) do
        NoguWeb.PageView.render("github_deploy.html", assigns)
    end

    def handle_event("github_deploy", _value, socket) do
        {:ok} = Nogu.Git.start_deploy()
        send(self(), :create_org)
        {:noreply, assign(socket, deploy_step: "Starting deploy...")}
      end
      
      def handle_info(:create_org, socket) do
        {:ok, org} = Nogu.Git.create_org()
        send(self(), {:create_repo, org})
        {:noreply, assign(socket, deploy_step: "Creating GitHub org...")}
      end
      
      def handle_info({:create_repo, org}, socket) do
        {:ok, repo} = Nogu.Git.create_repo(org)
        send(self(), {:push_contents, repo})
        {:noreply, assign(socket, deploy_step: "Creating GitHub repo...")}
      end
      
      def handle_info({:push_contents, repo}, socket) do
        {:ok} = Nogu.Git.push_contents(repo)
        send(self(), :done)
        {:noreply, assign(socket, deploy_step: "Pushing to repo...")}
      end
      
      def handle_info(:done, socket) do
        {:noreply, assign(socket, deploy_step: "Done!")}
      end
      
  
    def mount(_session, socket) do
      {:ok, assign(socket, deploy_step: "Ready!")}
    end


  end