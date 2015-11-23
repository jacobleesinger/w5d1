class Goal < ActiveRecord::Base
  validates :title, :user_id, :status, :visibility, presence: true
  validates :status, inclusion: { in: %w(NEW COMPLETED) }
  validates :visibility, inclusion: { in: %w(PUBLIC PRIVATE) }

  belongs_to :user

  before_action :require_user!

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def delete
    @goal = Goal.find(params[:id])
    @goal.delete
    redirect_to user_url(current_user)
  end


  private

  def goal_params
    params.require(:goal).require(:title, :status, :visibility, :description)
  end
end
