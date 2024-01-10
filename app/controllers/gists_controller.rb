class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call
    @flash_options ||= if service.success?
                         Gist.create(
                           question_id: @test_passage.current_question.id,
                           user_id: current_user.id,
                           gist_url: result.html_url
                         )
                      {notice: t('.success', link: result.html_url)}
                    else
                      {alert: t('.failure')}
                    end
    redirect_to @test_passage, @flash_options

  end
end
