class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
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

end
