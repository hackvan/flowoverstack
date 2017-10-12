class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = 'La respuesta ha sido registrada con éxito.'
    else
      flash[:danger] = 'La respuesta no puede estar en blanco.'
    end
    redirect_to question_path(params[:question_id])
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = 'La respuesta ha sido actualizada con éxito.'
    end
    redirect_to question_path(params[:question_id])
  end

  def destroy
    if @answer.destroy
      flash[:success] = 'La respuesta ha sido eliminada con éxito.'
    end
    redirect_to question_path(params[:question_id])
  end

  private
    def set_answer
      @answer = Answer.find_by(question_id: params[:question_id], id: params[:id])
    end

    def answer_params
      params.require(:answer)
        .permit(:body)
        .merge(user_id: current_user.id, question_id: params[:question_id])
    end
end
