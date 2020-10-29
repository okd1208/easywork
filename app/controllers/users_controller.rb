class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show ,:fin_task, :unfin_task]
  before_action :user_shows, only:[:show, :fin_task, :unfin_task]
  
  
  def index
    @users = User.all
  end

  def show
  end
  
  def fin_task
    @tasks = @p_tasks
    @p_tasks = @p_tasks.where("progress != '2019-12-31 15:00:00'").order(id: "DESC")
  end
  
  def unfin_task
    @tasks = @p_tasks
    @p_tasks = @p_tasks.where("progress = '2019-12-31 15:00:00'").order(id: "DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = '登録が完了しました。'
      redirect_to @user
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def user_shows
      @user = User.find(params[:id])
      @p_tasks = @user.privatetasks.all.order(id: "DESC")
      counts(@user)
    if @current_user.privatetasks.count != 0
      @unfin_count = Privatetask.where(progress: "2019-12-31 15:00:00",user_id:@user.id).count
      @fin_count = @p_tasks.count - @unfin_count
      @fin_per =  @fin_count * 100 / @p_tasks.count
      @categories =[]
      @nowtime = DateTime.now
       if @nowtime.day == 31
         @d = 1
       else
         @d = @nowtime.day
       end
      @soon = @p_tasks.where(deadline: "#{@nowtime.year}-#{@nowtime.month}-#{@d} 15:00:00", progress: "2019-12-31 15:00:00")
      
    end
  end
end
