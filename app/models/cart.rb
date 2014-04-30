class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		curent_item = line_items.find_by(product_id: product_id)
		if curent_item
			curent_item.quantity += 1
		else
			curent_item = line_items.build(product_id: product_id)
		end
		curent_item
	end
end
