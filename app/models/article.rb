class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :article_category_relations
  has_many :categories, through: :article_category_relations

  # def to_key
  #   [Base64.encode64(id.to_s)]
  # end

  # def to_param
  #   "#{Base64.encode64(id.to_s)}-#{title}"
  # end
end
