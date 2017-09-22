class Answers::CommentsController < CommentsController
  before_action :set_commentable

  def create
    super
    redirect_to url_for(@commentable.question)
  end

  private

    def set_commentable
      @commentable = Answer.find(params[:answer_id])
    end
end
