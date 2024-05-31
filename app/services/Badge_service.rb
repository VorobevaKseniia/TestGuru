class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def badge_issuance
    Badge.all.each do |badge|
      if  received?(badge)
        @user.badges << (badge) if !@user.badges.include?(badge)
      end
    end
  end

  private

    def received?(badge)
      send("#{badge.rule}?", badge.rule_value)
    end

    def first_attempt?(test_title)
    @user.test_passages.where(test_id: @test.id).count == 1 && (@test_passage.passed?) && @test.title == test_title
  end

  def all_tests_in_category?(category_title)
    Test.categorized_tests(category_title).count ==
      @user.test_passages.where(succeeded: true, test_id: @user.tests.categorized_tests(category_title)).pluck(:test_id).uniq.count
  end

  def all_tests_of_level?(test_level)
    Test.where(level: test_level).count ==
      @user.test_passages.where(succeeded: true, test_id: @user.tests.where(level: @test.level)).pluck(:test_id).uniq.count
  end

end