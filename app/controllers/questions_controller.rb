class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[create]  #index?
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
    @question = @test.questions.create(question_params)
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
    @test = Test.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
