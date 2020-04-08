Deface::Override.new(
    virtual_path: 'spree/products/show',
    name: 'Add amazon links to show',
    insert_after: 'div[data-hook="cart_form"]',
    partial: 'spree/products/amazon_link'
)