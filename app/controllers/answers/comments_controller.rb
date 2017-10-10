class Answers::CommentsController < CommentsController
  before_action :set_commentable

  def create
    super
    respond_to do |format|
      format.html { redirect_to url_for(@commentable.question) }
      format.js
    end
  end

  private

    def set_commentable
      @commentable = Answer.find(params[:answer_id])
    end
end
