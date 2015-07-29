class ProblemsController < ApplicationController
  before_action :signed_in_user, only: [:new ,:create ,:edit, :update]
  before_action :correct_user,   only: [:new ,:create ,:edit, :update]

  def show
    @problem = Problem.find(params[:id])
    @comments = @problem.comments.joins(:user)
  end

  def new
      @problem = current_user.problems.build
  end

  def create
    @problem = current_user.problems.build(problem_params)
    if @problem.save!
      flash[:success] = "Есть контакт"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
    @problem = Problem.find(params[:id])
  end


  def update
    @problem = Problem.find(params[:id])
    if @problem.update(problem_params)
      flash[:success] = "Изменения сохранены"
      redirect_to problem_path(@problem.id)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def problem_params
    params.require(:problem).permit(:content)
  end

end
