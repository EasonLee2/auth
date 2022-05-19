class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @user = User.find_by({ "email" => params["email"]})
    if @user
      session["user_id"] = @user["id"]
      flash["notice"] = "Welcome."
      @task = Task.new
      @task["description"] = params["task"]["description"]
      @task.save
      redirect_to "/tasks"
    else
      flash["notice"] = "Unverified User"
      redirect_to "/tasks"
    end
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
