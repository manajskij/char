class BriefingsController < ApplicationController
  before_action :signed_in_user, only: [:index, :new ,:create ,:edit, :update]
  before_action :correct_user,   only: [:index, :new ,:create ,:edit, :update]

  def index
    @briefing = Briefing.joins(:user, :change_briefings).uniq
  end

  def new
    @problem = Problem.find(params[:format])
    @comment = @problem.comments

    @briefing = current_user.briefings.build
    @briefing_change = current_user.change_briefings.build
  end

  def create
    @problem = Problem.find(params[:briefing][:problem_id])
    @briefing = current_user.briefings.build(briefing_params)
    @briefing_change = @briefing.change_briefings.build(briefing_params)
    @briefing_change.user_id = current_user.id
    if @briefing.save! and @briefing_change.save!
      redirect_to briefings_url
      @problem.closed = true
      @problem.save
    end
  end

  def edit
    @briefing = Briefing.joins(:change_briefings).find(params[:id])
  end

  def update
    @briefing = Briefing.joins(:change_briefings).find(params[:id])
    @briefing_change = @briefing.change_briefings.build(briefing_params)
    @briefing_change.user_id = current_user.id
    if @briefing_change.save!
      flash[:success] = "Изменения сохранены"
      redirect_to '/briefings'
    end
  end

  private

  def briefing_params
    params.require(:briefing).permit(:brief)
  end

end
