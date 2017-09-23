class Questions::VotesController < VotesController
  before_action :set_votable

  def create
    super
    redirect_to @votable
  end

  def destroy
    super
    redirect_to @votable
  end

  private

    def set_votable
      @votable = Question.find(params[:question_id])
    end
end
