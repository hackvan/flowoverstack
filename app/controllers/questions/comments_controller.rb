class Questions::CommentsController < CommentsController
  before_action :set_commentable

  def create
    super
    respond_to do |format|
      format.html { redirect_to @commentable }
      format.js
    end
  end

  private

    def set_commentable
      @commentable = Question.find(params[:question_id])
    end
end
