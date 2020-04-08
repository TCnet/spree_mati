class AddStandardPriceToSpreeVariants < ActiveRecord::Migration[6.0]
  def change
     add_column :spree_variants, :standard_price, :decimal, precision: 8, scale: 2
     add_column :spree_variants, :list_price, :decimal, precision: 8, scale: 2
  end
end
