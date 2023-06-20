require 'rails_helper'

RSpec.describe 'Post show Page', type: :feature do
  
  before do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Artist from Kenya.')
    @post = Post.create(author: @user, title: 'First post', text: 'This is my first post')
    5.times do |i|
        Comment.create(text: "This is comment ##{i}", author_id_id: @user.id, post_id_id: @post.id)
    end
    visit user_post_path(@user.id , @post.id)
  end

  it 'displays the post title' do
    expect(page).to have_content('First post')
  end

  it 'displays the post body' do
    expect(page).to have_content('This is my first post')
  end

  it 'displays the post author' do
    expect(page).to have_content('John')
  end

  it 'displays the number of comments' do
    expect(page).to have_content('Comments: 5')
  end

  it 'displays the number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the username of each comment' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the body of each comment' do
    expect(page).to have_content('This is comment #0')
    expect(page).to have_content('This is comment #1')
    expect(page).to have_content('This is comment #2')
  end
end
