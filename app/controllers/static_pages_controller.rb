class StaticPagesController < ApplicationController
  def home
    @problems = Problem.joins(:user).paginate(page: params[:page])
  end

  def help
  end
end
