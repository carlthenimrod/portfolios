class AddOrderIdToPortfolios < ActiveRecord::Migration
  def change
  	add_column :portfolios, :order_id, :integer, default: 0
  end
end