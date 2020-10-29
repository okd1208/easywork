class PrivatetasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @p_task = current_user.privatetasks.build(ptask_params)
    @p_task.category = params[:category]
      if @p_task.save
        flash[:success] = 'タスクを設定しました!'
        @p_task.progress = "2020-01-01 00:00:00"
        redirect_to root_url
      else
        # @Ptasks = current_user.privatetasks.order(id: :desc).page(params[:page])
        flash[:danger] = 'タスクの設定に失敗しました。'
        redirect_to root_url
      end
  end

  def destroy
    @p_task.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def all_destroy
    @user = User.find(params[:user_id])
    @user.privatetasks.destroy_all
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def edit
  end
  
  def show
    @task = Privatetask.find(params[:id])
    @user = User.find(@task.user_id)
  end
  
  def progres
    @task = Privatetask.find(params[:id])
    @task.progress = DateTime.now
    @task.save
    flash[:notice] = "お疲れ様でした"
    redirect_to("/privatetasks/#{params[:id]}")
  end
  
  def unprogres
    @task = Privatetask.find(params[:id])
    @task.progress = "2020-01-01 00:00:00"
    @task.save
    flash[:notice] = "ファイト！"
    redirect_to("/privatetasks/#{params[:id]}")
  end
  
  def edit
    @task = Privatetask.find(params[:id])
  end
  
  def create_category
    @task = Privatetask.find(params[:id])
    @task.category = params[:category]
    @task.task = params[:task]
    if @task.save
      flash[:notice] = "編集しました"
      redirect_to("/privatetasks/#{params[:id]}")
    end
  end
  
  def category
    @user = User.find(params[:user_id])
    @tasks = @user.privatetasks
    if params[:category] == "none_categories"
      @category = "カテゴリーなし"
      @same_categories = @tasks.where(category: nil)
    else
      @category = params[:category]
      @same_categories = @tasks.where(category: params[:category])
    end
  end
  
  private
  
  def ptask_params
    params.require(:privatetask).permit(:task, :deadline)
  end
  
  def correct_user
    @p_task = current_user.privatetasks.find_by(id: params[:id])
    unless @p_task
      redirect_to root_url
      flash[:danger] = '更新できません。'
    end
  end
  
end
