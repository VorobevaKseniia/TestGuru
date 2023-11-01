class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
    @tests = Test.all
    render plain: "All tests"
  end

  def show
    render inline: '<%= @test.title %>'
  end

  def new
    # @test = Test.new
  end

  def create
    @test = Test.create(test_params)
    render plain: test.inspect
  end

  private
  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

end
