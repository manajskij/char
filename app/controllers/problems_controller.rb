class ProblemsController < ApplicationController

  def new
    @problem = current_user.problems.build
  end

  def create
    @problem = current_user.problems.build(problem_params)
    if @problem.save
      flash[:success] = "Есть контакт"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def problem_params
    params.require(:problem).permit(:content)
  end

end
