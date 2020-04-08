Deface::Override.new(
    virtual_path: 'spree/products/show',
    name: 'Add points to show',
    insert_top: 'div[data-hook="product_properties"]',
    partial: 'spree/products/bullet_point'
)