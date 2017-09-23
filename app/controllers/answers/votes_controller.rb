class Answers::VotesController < VotesController
  before_action :set_votable

  def create
    super
    redirect_to url_for(@votable.question)
  end

  def destroy
    super
    redirect_to url_for(@votable.question)
  end

  private

    def set_votable
      @votable = Answer.find(params[:answer_id])
    end
end
