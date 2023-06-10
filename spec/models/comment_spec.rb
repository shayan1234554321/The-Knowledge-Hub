require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
      @post = Post.create(author_id_id: @user.id, title: 'My Post', text: 'This is my post')
      @comment = Comment.create(author_id_id: @user.id, post_id_id: @post.id, text: 'This is my comment')
    end

    it 'updates comment counter' do
      expect(@comment.update_comment_counter).to eq(2)
    end
  end
end
