class AddBulletPointToSpreeProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_products, :bullet_point , :text
  end
  
end
