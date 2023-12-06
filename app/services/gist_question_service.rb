class GistQuestionService

  def initialize(question, client = nil)  # client_octokit
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_params.gist_title', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += [@question.answers.pluck(:body)]
    content.join("\n")
  end

  def client_octokit
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end