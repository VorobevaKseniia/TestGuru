class Admin::GistsController < Admin::BaseController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if
                      Gist.create!(
                        question_id: @test_passage.current_question.id,
                        user_id: current_user.id,
                        gist_url: result
                      )
                      {notice: t('.success', link: result)}
                    else
                      {alert: t('.failure')}
                    end
    redirect_to @test_passage, flash_options
  end

end
