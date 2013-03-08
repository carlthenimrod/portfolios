class ChangeInfoColumnOnPortfolios < ActiveRecord::Migration
  def up
  	change_column :portfolios, :info, :text
  end

  def down
  	change_column :portfolios, :info, :string
  end
end