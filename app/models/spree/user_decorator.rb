module Spree::UserDecorator
  def self.prepended(base)
    base.has_many :mati_imports, class_name: 'Spree::MatiImport'
  end
end

Spree::User.prepend Spree::UserDecorator