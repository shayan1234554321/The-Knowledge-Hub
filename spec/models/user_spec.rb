require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'Shayan', photo: 'https://picsum.photos/200/300', bio: 'I am Shayan')
    end

    it 'recent_posts' do
      Post.create(author_id_id: @user.id, title: 'My Post', text: 'This is my post')
      Post.create(author_id_id: @user.id, title: 'My Post', text: 'This is my post')
      Post.create(author_id_id: @user.id, title: 'My Post', text: 'This is my post')
      expect(@user.recent_posts.count).to eq(3)
    end

    it "name can't be blank" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "posts_counter can't be blank" do
      @user.posts_counter = nil
      expect(@user).to_not be_valid
    end

    it 'posts_counter must be an integer' do
      @user.posts_counter = 'a'
      expect(@user).to_not be_valid
    end

    it 'posts_counter must be greater than or equal to 0' do
      @user.posts_counter = -1
      expect(@user).to_not be_valid
    end
  end
end