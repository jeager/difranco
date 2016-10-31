class Product < ActiveRecord::Base
	has_many :tasks_products
	has_many :tasks, :through => :tasks_products
	#has_and_belongs_to_many :tasks
end
