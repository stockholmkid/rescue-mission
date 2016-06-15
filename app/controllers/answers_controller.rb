class AnswersController < ApplicationController
  def index
   @question = Question.find(params[:question_id])
   @answer = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      flash[:notice] = 'Answer was successfully created'
      redirect_to question_path(@question)
    else
      flash[:alert] = "Failed to save answer because must be 50 characters"
      @answers = @question.answers
      render :'questions/show'
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:response)
  end
end
