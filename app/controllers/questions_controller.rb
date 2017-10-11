class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @questions = Question.includes(:votes, :answers).order_by_newest.limit(10)
  end

  def show
    @answer  = Answer.new
    @answers = @question.answers.order_by_oldest.limit(10)
  end

  def search
    search_words = params[:q].downcase
    @questions = Question.includes(:votes, :answers)
                         .where("title LIKE ? OR body LIKE ?",
                                "%#{search_words}%",
                                "%#{search_words}%")
                         .order_by_newest
    render :index
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'La pregunta ha sido creada con éxito.'
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      flash[:success] = 'La pregunta ha sido actualizada con éxito.'
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = 'La pregunta ha sido eliminada con éxito.'
    redirect_to questions_path
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question)
            .permit(:title, :body)
            .merge(user: current_user)
    end

end
