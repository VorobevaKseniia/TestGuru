class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def badge_issuance
    Badge.all.each do |badge|
      if  send("#{badge.rule}?", *badge.rule_value == '-' ? nil : badge.rule_value)
        @user.badges << (badge) if !@user.badges.include?(badge)
      end
    end
  end

  private

    def first_attempt?
    @user.test_passages.where(test_id: @test.id).count == 1 && (@test_passage.passed?)
  end

  def all_tests_in_category?(category_title)
    categorized_tests = Test.categorized_tests(category_title).ids
    check(categorized_tests)
  end

  def all_tests_of_level?(test_level)
    level_tests = Test.where(level: test_level).ids
    check(level_tests)
  end

  def check(tests_ids_by_rule)
    user_tests_ids = @user.test_passages.where(succeeded: true, test_id: tests_ids_by_rule).pluck(:test_id).uniq.count
    tests_ids_by_rule.count == user_tests_ids
  end

end