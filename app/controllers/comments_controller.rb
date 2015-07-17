class CommentsController < ApplicationController
  def new
    @comment = @problem.comments.build
  end

  def create
#    @problem = Problem.find(params[:id])
#    @comment = @problem.id
#    @comment = current_user.problems.build
    @comment = @problem.comments.build(comment_params)
    if @comment.save!
      flash[:succes] = 'Комментарий создан!'
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
