class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'El comentario ha sido registrado con éxito.'
    end
  end

  private
    def comment_params
      params.require(:comment)
      .permit(:body)
      .merge(user_id: current_user.id)
    end
end
