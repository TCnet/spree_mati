Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'add_bullet_point_to_product_form',
    insert_after: 'div[data-hook="admin_product_form_description"]',
    text: <<-HTML
              
              <div data-hook="admin_product_form_bullet_point">
                <%= f.field_container :bullet_point, class: ['form-group'] do %>
                  <%= f.label :bullet_point, Spree.t(:bullet_point) %>
                  <%= f.text_area :bullet_point,rows: 10, class: 'form-control bullet_point' %>
                  <%= f.error_message_on :bullet_point %>
                <% end %>
              </div>
          HTML
)