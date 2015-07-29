class CommentsController < ApplicationController

  def create
    @problem = Problem.find(params[:problem_id])

    @comment = @problem.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save!
      flash[:succes] = 'Комментарий создан!'
      redirect_to problem_path(@problem)
    else
      render 'static_pages/home'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
