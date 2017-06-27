class Comment < ApplicationRecord
  validates :content, :user, :post, presence: true

  belongs_to :user,
    class_name: "User",
    primary_key: :id,
    foreign_key: :author_id

  belongs_to :post

  
  has_many :child_comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_comment_id

  belongs_to :parent_comment,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_comment_id

end
