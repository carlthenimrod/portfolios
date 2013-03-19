module PortfoliosHelper

	def set_order order, count
		order.reverse_each do |i|
			id = i[1]['order_id'].to_i

			if count.include? id

				count.delete id
			else

				i[1]['order_id'] = count.max

				count.delete count.max
			end
		end

		order
	end
end