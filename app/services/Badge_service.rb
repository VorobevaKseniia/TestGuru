class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    # @rules = []
  end

  def badge_issuance
    Badge.all.each do |badge|
      if "#{badge.rule_value}?".to_sym == true
        @user.badges << (badge) if !@user.badges.include?(badge)
      end
    end
  end

  def first_attempt?
    @user.test_passages.where(test_id: @test.id).count == 1 && (@test_passage.passed?)
  end

  def all_tests_in_category?
    Test.categorized_tests(@test.category.title).count == @user.tests.where(category: @test.category.id).
      and(@user.test_passages.where(succeeded: true)).count
  end

  def all_tests_of_level?
    Test.where(level: @test.level).count == @user.tests.where(level: @test.level).
      and(@user.test_passages.where(succeeded: true)).count
  end

end