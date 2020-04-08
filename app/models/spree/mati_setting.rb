module Spree
  class MatiSetting < Spree::Preferences::Configuration
    
    preference :import_row_from_title, :integer, default: 3
    preference :ama_title, :string, default: "{0} at Aodrusa {1} Clothing store"
    preference :ama_description, :string , default: "Buy {0} and other {1} at {2}. We Offer New Women's Fashion Clothing Very Frequent"
    
  end
end

