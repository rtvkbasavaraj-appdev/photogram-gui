class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({:username => :asc})

    render({:template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username")

    matching_username = User.where({ :username => url_username})

    @the_user = matching_username.first

    render({:template => "user_templates/show.html.erb"})
  end

  def create
    input_username = params.fetch("input_username")

    new_user = User.new 
    new_user.username = input_username


    new_user.save

    redirect_to("/users/" + input_username)
  end

  def update
    input_username = params.fetch("input_username")
    user_id = params.fetch("path_id")
    user = User.where({:id => user_id}).first
    user.username = input_username

    user.save

    redirect_to("/users/" + input_username)
  end

  def homepage
    redirect_to("/users")
  end
end
