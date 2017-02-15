class Category < ActiveRecord::Base
  has_many :page_categories
  has_many :articles, through: :page_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  
  
end 