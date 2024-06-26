class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[start]
  before_action :set_badges, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
    @tests = Test.all.complete_tests
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def set_badges
    @badges = current_user.badges
    @all_badges = Badge.all
  end

end
