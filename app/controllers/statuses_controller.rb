class StatussController < ApplicationController
  before_action :correct_user
  
  def new
    if logged_in?
      @status = current_user.privatetasks.statuses.build
      @Ptasks = current_user.privatetasks.all
    end
  end
  
  def create
    @p_task.status = DateTime.now
    redirect_to root_url
  end

  def destroy
  end
  
  private
  
  def correct_user
    @p_task = current_user.privatetasks.find_by(id: params[:id])
    unless @p_task
      redirect_to root_url
      flash[:danger] = '更新できません。'
    end
  end
end
