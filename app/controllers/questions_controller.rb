class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @questions = Question.all.order(created_at: :desc).limit(10)
  end

  def show
    @answer  = Answer.new
    @answers = @question.answers.all.order(created_at: :asc).limit(10)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
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
      redirect_to questions_path
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
      params.require(:question).permit(:title, :body)
    end

end
