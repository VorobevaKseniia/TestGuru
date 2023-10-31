class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]

  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index
    #@questions = @test.questions
    render plain: "Test questions"
  end
  def show
    render inline: '<%= @question.body %>'
  end

  def new
    # @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: "Question saved"
    else
      render plain: "Question not saved"
    end
  end

  def destroy
    @question.destroy
    render plain: "Delete question"
  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    # @test = Test.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
