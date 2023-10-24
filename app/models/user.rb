class User < ApplicationRecord

  def list_of_tests(level)
    Test.joins("INNER JOIN user_tests ON tests.id = user_tests.test_id").where(tests: {level: level})
        .where(user_tests: {user_id: id}).pluck(:title)
  end

end
