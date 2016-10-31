class Task < ActiveRecord::Base
	has_many :tasks_products
	has_many :products, :through => :tasks_products
	accepts_nested_attributes_for :tasks_products, reject_if: :all_blank, allow_destroy: true

	def self.status
		["Na Fila", "Em produção", "Pronto para Entrega", "Finalizado"]
	end
end
