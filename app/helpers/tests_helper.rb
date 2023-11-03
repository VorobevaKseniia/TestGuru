module TestsHelper

  # TEST_LEVELS = {1 => :simple, 2 => :medium, 3 => :hard }. freeze
  def test_level(test)
    # TEST_LEVELS[test.level] || :undefined
    case test.level
    when 0..1
      'simple'
    when 2..4
      'medium'
    when 5..Float::INFINITY
      'hard'
    else
      'error'
    end
  end
end
