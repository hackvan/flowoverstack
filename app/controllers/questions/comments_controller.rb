class Questions::CommentsController < CommentsController
  before_action :set_commentable

  def create
    super
    respond_to do |format|
      format.html { redirect_to @commentable }
      format.js
    end
  end

  def destroy
    @comment = @commentable.comments.find_by(commentable_id: params[:question_id],
                                             id: params[:id])
    if @comment.destroy
      flash[:success] = 'El comentario ha sido eliminado con éxito.'
    end
    redirect_to @commentable
  end

  private
    def set_commentable
      @commentable = Question.find(params[:question_id])
    end
end
