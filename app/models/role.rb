class Role < ApplicationRecord
  has_many :usuarios
  
  validates :name, presence: true, uniqueness: true
end 