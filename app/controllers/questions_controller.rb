class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by {|m| m.created_at }
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end
  def edit
    @question = Question.find(params[:id])
  end
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      flash[:notice] = "Edit was unsuccessfully created (Description must be a minimum of 150 characters, and title must be a minimum of 40 characters)"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = @question.answers
    if @question.destroy!
      flash[:success] = "Question deleted"
      redirect_to questions_path
    end
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "Question was successfully created"
      redirect_to @question
    else
      render :new

    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
