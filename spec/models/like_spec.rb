require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
      @post = Post.create(author_id_id: @user.id, title: 'My Post', text: 'This is my post')
      @like = Like.create(author_id_id: @user.id, post_id_id: @post.id)
    end

    it 'updates likes counter' do
      expect(@like.update_likes_counter).to eq(2)
    end

  end
end