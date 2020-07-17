defmodule FriendspWeb.PostLive.PostComponent do
    use FriendsWeb, :live_component
  
    def render(assigns) do
     ~L"""
        <div id="post-<%= @post.id %>" class="post">
            <div class="row">
                <div class="column column-10">
                    <div class="post-avatar"></div>
                </div>
                <div class="column  post-body">
                    <b>@<%= @post.username %></b>
                    <br />
                    <%= @post.body %>
                </div>
            </div>
            <div class="row">
                <div class="column">
                <a href="#" phx-click="like" phx-target="<%= @myself %>">
                    <i class="far fa-heart"></i> <%= @post.likes_count %>
                </div>
                <div class="column ">
                <a href="#" phx-click="repost" phx-target="<%= @myself %>">
                    <i class="far fa-retweet"></i> <%= @post.reposts_count %>
                </div>
                
         
          
                    
                </div>
            </div>
        </div>
        """
    end
  
    def handle_event("like", _, socket) do
      Friends.Timeline.inc_likes(socket.assigns.post)
      {:noreply, socket}
    end
  
    def handle_event("repost", _, socket) do
      Friends.Timeline.inc_reposts(socket.assigns.post)
      {:noreply, socket}
    end

  end

  