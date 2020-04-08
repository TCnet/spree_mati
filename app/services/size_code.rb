module SizeCode

   #size_map
      def self.size_map_for (size)
        case size.downcase
        when "xxxxs","24"
          "XXXX-Small"
        when "xxxs","26"
          "XXX-Small"
        when "xxs","28"
          "XX-Small"
        when "xs","29"
          "X-Small"
        when "s","30"
          "Small"
        when "m", "32"
          "Medium"
        when "l", "34"
          "Large"
        when "xl", "36"
          "X-Large"
        when "xxl","2xl", "38"
          "XX-Large"
        when "3xl","xxxl", "40"
          "XXX-Large"
        when "4xl","xxxxl", "42"
          "XXXX-Large"
        when "5xl","xxxxxl","44"
          "XXXXX-Large"
        when "f"
          "X-Large"
        when "tm"
          "Large"
        else
          "Unknown"
        end 
      end
      #end size map

      #size for the us
      def self.size_for(size,n,separate, usszie,asize)
        result=size
        ob = usszie.split(' ')
        asize = asize.nil?? " " : asize
        asize_arry = asize.tr("\n\r","|").split('|') 
        if !usszie.empty? 
          if( ob[n].upcase =~ /[A-Z]$/ )
           
            result = !asize_arry[n].nil?? ob[n].upcase+" "+asize_arry[n] : ob[n].upcase
            return result
            
          else
            result = !asize_arry[n].nil?? "US"+separate+ob[n]+" "+asize_arry[n] : "US"+separate+ob[n]
            return result
          end
        elsif(size.downcase=="tm")
          return "One Size"
        else
          return  !asize_arry[n].nil?? size.upcase+" "+asize_arry[n] : size.upcase
        end
      end
      #end size_for

      def self.to_us_size_for(ussize,csize,str)
        ob=ussize 
        if !ussize.empty?
          ob = ussize.split(' ').each_with_index.map {|s,j| s="US "+s+"("+str+csize[j]+")"}
        else
          ob = csize
        end
        return ob
        
      end

      def self.to_in(cm,is_in)
        result = ''
        str = cm.to_s.split('-')
        str.each_with_index do |f,e|
          if is_in
            result +=f.to_s+"\""
          else
            strcm= f.to_s
            #   result += (f.to_s.to_f*0.3937008).round(2).to_s+"\""
            strcm=(strcm.to_f*0.3937008).round(2).to_s
            result +=strcm+"\""
          end
          if e<str.length-1
            result += "-"
          end
          
        end
        return result
      end


      def self.description_size_for(desize,csize,is_in=false)
        #set size for description
        destr=""
        
        if !desize.empty?
          dearray = twoarray_for desize
          csizelen = csize.length
          csize.each_with_index do |f,num|
            destr += f;
            destr +=": "

            dellen = dearray[0].length
            
            dellen.times do |e|
              
              destr += dearray[0][e]
              destr +=" "
              dearray.length.times do |c|
                if c > 0&& c-1==e
                  
                  destr += to_in(dearray[c][num],is_in)
                  
                end
              end
              if e==dellen-1
                destr +="."
              else
                destr +=","
              end
              
            end
            
            
            destr+="<br>"
            destr +="\n"
            
          end    
          
         end

        return destr
        
      end
      #end dericript size
end
