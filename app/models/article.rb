class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user

  # def to_key
  #   [Base64.encode64(id.to_s)]
  # end

  # def to_param
  #   "#{Base64.encode64(id.to_s)}-#{title}"
  # end
end
