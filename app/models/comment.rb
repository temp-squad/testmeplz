class Comment < ApplicationRecord
  belongs_to :exam

  default_scope -> { order("created_at DESC") } 
end
