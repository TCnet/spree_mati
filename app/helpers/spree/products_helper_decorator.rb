module Spree
  module ProductsHelper
    def product_bullet_point(product)
          
          #product.bullet_point.to_s.tr("\n","|").split('|').map{|x| tag_li(x) }.join
        content_tag :ul, class: '' do
        result = product.bullet_point.to_s.tr("\n","|").split('|').map do |point|
          css_class = ""
          unless point.empty?
            content_tag :li, class: css_class do
              point
            end
          end
          
        end
        safe_join(result, "\n")
      end
    end

    def product_description2(product)
        description = if Spree::Config[:show_raw_product_description]
                      product.description += Spree::Config[:show_raw_product_description].to_s
                    else
                      str = product.description.to_s.gsub(/(<br>?)/m,'<p>\1</p>')
                      #str.to_s.gsub(/(<br>?)/m,'<p>\1</p>') 
                      str.to_s.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>')
                      str += Spree::Config[:show_raw_product_description].to_s

                      #product.description.to_s.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>')
                      #product.description +="sss"
                      #product.description = str
                    end
      description.blank? ? Spree.t(:product_has_no_description) : description
    end




    def product_description(product)
      description = if Spree::Config[:show_raw_product_description]
                      product.description += Spree::Config[:show_raw_product_description].to_s
                    else
                      str = product.description.to_s.gsub(/(<br>?)/m,'<p>\1</p>')
                      #str.to_s.gsub(/(<br>?)/m,'<p>\1</p>') 
                      str.to_s.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>')
                      str += Spree::Config[:show_raw_product_description].to_s

                      #product.description.to_s.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>')
                      #product.description +="sss"
                      #product.description = str
                    end
      description.blank? ? Spree.t(:product_has_no_description) : description
    end

    private 
      def tag_li(str)
        li = content_tag :li do
             str
           end
        li
      end

  end
end


