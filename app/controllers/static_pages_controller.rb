class StaticPagesController < ApplicationController
  def home
    @problems = Problem.paginate(page: params[:page])
    @user = @problems.paginate(page: params[:page])
  end

  def help
  end
end
