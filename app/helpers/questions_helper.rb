module QuestionsHelper

  def question_header(question)
    question.new_record? ? "Create new #{@test.title} Question" : "Edit #{question.test.title} Question"
  end
end