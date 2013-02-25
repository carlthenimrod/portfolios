class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :title
      t.string :description
      t.string :img
      t.string :info

      t.timestamps
    end
  end
end