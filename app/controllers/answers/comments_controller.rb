class Answers::CommentsController < CommentsController
  before_action :set_commentable

  def create
    super
    respond_to do |format|
      format.html { redirect_to url_for(@commentable.question) }
      format.js
    end
  end

  def destroy
    @comment = @commentable.comments.find_by(commentable_id: params[:answer_id],
                                             id: params[:id])
    if @comment.destroy
      flash[:success] = 'El comentario ha sido eliminado con éxito.'
    end
    redirect_to url_for(@commentable.question)
  end

  private
    def set_commentable
      @commentable = Answer.find(params[:answer_id])
    end
end
