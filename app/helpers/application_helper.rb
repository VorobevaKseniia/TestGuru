module ApplicationHelper
  def current_year
    Time.new.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank',
            class: "fw-bolder link-secondary text-decoration-none"
  end
end
