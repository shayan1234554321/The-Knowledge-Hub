require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
      @post = Post.create(author_id_id: @user.id, title: 'My Post', text: 'This is my post')
    end

    it "adds comments" do
      Comment.create(author_id_id: @user.id, post_id_id: @post.id, text: 'This is my comment')
      Comment.create(author_id_id: @user.id, post_id_id: @post.id, text: 'This is my comment')
      expect(@post.recent_comments.count).to eq(2)
    end

    it "title can't be blank" do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it "title can't exceed 250 characters" do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it "comments_counter can't be blank" do
      @post.comments_counter = nil
      expect(@post).to_not be_valid
    end

    it 'comments_counter must be an integer' do
      @post.comments_counter = 'a'
      expect(@post).to_not be_valid
    end

    it 'comments_counter must be greater than or equal to 0' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it "likes_counter can't be blank" do
      @post.likes_counter = nil
      expect(@post).to_not be_valid
    end

    it 'likes_counter must be an integer' do
      @post.likes_counter = 'a'
      expect(@post).to_not be_valid
    end

    it 'likes_counter must be greater than or equal to 0' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end
end