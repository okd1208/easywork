class ToppagesController < ApplicationController
  def index
    if logged_in?
      @Ptask = current_user.privatetasks.build
      @p_tasks = current_user.privatetasks.all
      @user = User.find(current_user.id)
    end
  end
end
