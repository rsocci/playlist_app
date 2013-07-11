require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "user should enter a comment" do
  	comment = Comment.new
  	assert !comment.save
  	assert !comment.errors[:content].empty?
  end
end
