Deface::Override.new(
    virtual_path: 'spree/admin/products/index',
    name: 'amazon_link',
    insert_before: 'td[data-hook="admin_products_index_row_actions"]',
    text: <<-HTML
              <td class="link">
                <%= link_to( "Amazon", ""+product.amazon_link.to_s, target: "_blank") if !product.amazon_link.to_s.empty?%>
              </td>
          HTML
)