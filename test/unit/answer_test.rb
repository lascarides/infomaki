require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  
  fixtures :initiatives
  
  def setup
  end 
  
  def test_validity
    @answer = Answer.new
    assert_false @answer.valid?
    @answer.body = ""
    assert_false @answer.valid?
    @answer.body = "Blue"
    assert_false @answer.valid?
  end

end
