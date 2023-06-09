class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  attr_accessor :confirmation_sent_at

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id_id', class_name: 'Post'
  has_many :comments, foreign_key: 'author_id_id', class_name: 'Comment'
  has_many :likes, foreign_key: 'author_id_id', class_name: 'Like'

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
