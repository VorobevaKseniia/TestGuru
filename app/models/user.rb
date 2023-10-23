class User < ApplicationRecord

  def list_of_tests(level, id)
    Test.joins("INNER JOIN user_tests ON tests.id = user_tests.test_id").where(tests: {level: level})
        .where(user_tests: {id: id}).pluck(:title)
  end

end
