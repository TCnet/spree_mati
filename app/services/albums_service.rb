module AlbumsService
      include ColorCode
      include SizeCode
      include TemplateSeed
      require 'roo'

      def self.get_str_by_length(str,num)
        if str.length>num
          str[0,num]
        else
          str
        end

      end

     #change womens to Women's
      def self.set_words(word)
        result = word.singularize.capitalize+"\'s"


      end

      def self.get_column_mappings(row)
      mappings = {}
      row.each_with_index do |heading, index|
        # Stop collecting headings, if heading is empty
        if not heading.blank?
          mappings[heading] = index
        else
          break
        end
      end
      mappings
    end

      def self.get_title_of_template(sheet,slipstr=' ')
          
          str = ''
          1..sheet.last_column.times do |f|
            unless sheet.cell(1,f).nil?
              
              str += sheet.cell(1,f).to_s
              str += slipstr
            end
            
          end
          return str
      end

      def self.get_template(user)
        templates = user.dislu_templates
        etemplate =  templates.first
        if(templates.count>0)
          etemplate = templates.order(created_at: :desc).first
          
        else
          etemplate = user.dislu_templates.build()
          etemplate.name="Default_template_2015"
          etemplate.title= DEFAULT_E
          etemplate.save

        end
        return etemplate
      end

      def self.category_for(all)
        result= []
        all.each do |f|
          # result << f.name.upcase.split('0').first
          result << f.name.upcase.scan(/^[A-Z]*/).join('')
        end
        result = result.uniq
      end


      def self.get_titlenumber(str,title)
        i=0
        str.each_line do |f,n|
          if(f.include?title)
           i=i+1
          end
        end
        return i
      end


      def self.keywords_for(num,keywords)
        
        s= keywords.in_groups(num, false) {|group| p group}
        
      end

      def keywords_for3(num=250,keywords)
        key_length = keywords.tr(" ","").length
        m = key_length / num
        n =  key_length % num
        key_array =  keywords.split(' ')
        s= key_array.in_groups(m+1, false) {|group| p group}
        
        
      end

      def self.code_for(photos,stylecode)
        code=[]
        strcode = ''
        
        if stylecode.nil? || stylecode.empty?
          stylecode="$$xx"
        end
        n  = stylecode.index("$")
        m = stylecode.scan(/[$]/).length
        #获取颜色分组
        
        photos.each do |f|

          if f.name.length < stylecode.length  
            name = f.name[0,2].downcase
          else
            name = f.name[n,m].downcase
          end
          
          if !strcode.include? name
            strcode += name
            strcode +=" "
            
          end

          
        end
        
        code = strcode.split(' ')
        return code
        
        
      end


      def self.fullname_for(brand,name,color,size)
        return brand+" "+name+" "+color +" "+ size
      end

     

      def self.twoarray_for(dsize)    
        ob = dsize.tr("\n","|").split('|')
        result = Array.new
        ob.each_with_index do |f,n|
          
          result[n]= f.split(' ')
          
        end
        return result
      end

      
      

      def self.points_for(points)
        ob = points.tr("\n","|").split('|')
        #ob= points.split('|')
       # if ob.length==1
         # ob = points.split('\n')
        #end
        return ob
      end

      def self.herf_for(str)
        ob = str.tr("\n","|").split('|')
        
      end

      def self.stock_two_arry(codelength,csizelength,stock)    
        ob = stock.tr("\n","|").split('|').map{|x| x.strip }
        if(ob.length>1)
          
        
          result = Array.new
          codelength.times do |n|
            if(ob.length>=codelength)
              mob= ob[n].split(' ')
              result[n]= ob[n].split(' ').map{|item| item.to_i}
            else
              if(ob.length>=n+1)
                result[n] = ob[n].split(' ').map{|item| item.to_i}
              else
                result[n]=Array.new(csizelength,0)
              end
            end
          end          
          
          return result      
        elsif(stock.empty?)
          return Array.new(codelength, Array.new(csizelength, 0))
        elsif(stock.split(' ').length>1)
          s= stock.split(' ')
          if(s.length<csizelength)
            csizelength-s.length.times do |f|
             s << 0
            end
          end
          s= s.map{|item| item.to_i}
          return Array.new(codelength,s)
        else      
          return Array.new(codelength, Array.new(csizelength, stock.to_i))
        end
                     
      end  
    end