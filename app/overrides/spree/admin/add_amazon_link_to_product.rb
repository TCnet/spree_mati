Deface::Override.new(
    virtual_path: 'spree/admin/products/_form',
    name: 'Add amazon links',
    insert_before: 'div[data-hook="admin_product_form_description"]',
    text: <<-HTML
           <div data-hook="admin_product_form_amazon_link">
                <%= f.field_container :amazon_link, class: ['form-group'] do %>
                  <%= f.label :amazon_link, Spree.t(:amazon_link) %>
                  <%= f.text_field :amazon_link, class: 'form-control title', placeholder: 'Please must to use amazon canonical links' %>
                  <%= f.error_message_on :amazon_link %>
                <% end %>
              </div>
              
              <div data-hook="admin_product_form_amazon_title">
                <%= f.field_container :amazon_title, class: ['form-group'] do %>
                  <%= f.label :amazon_title, Spree.t(:amazon_title) %>
                  <%= f.text_field :amazon_title, class: 'form-control title' %>
                  <%= f.error_message_on :amazon_title %>
                <% end %>
              </div>
          HTML
)