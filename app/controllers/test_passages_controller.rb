class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || @test_passage.time_out?
      TestsMailer.completed_test(@test_passage).deliver_now
      TestPassage.update(succeeded: true) if @test_passage.passed?
      BadgeService.new(@test_passage).badge_issuance
      redirect_to result_test_passage_path(@test_passage)
    else
        render :show
    end
  end

  def result
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
