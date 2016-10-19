class Bird < ActiveRecord::Base
    def search(search_hash)
      
      state = (search_hash[:state] and ["no_draft", "birda", "birdb", "birdc", "birdd"].include? search_hash[:state]) ? search_hash[:state] : 'no_search'
      
      
      list_function  = ["Bird.#{state}"]

      if search_hash[:category] and search_hash[:category].to_i > 0
        list_function << 'category(search_hash[:category])'
      end
      eval(list_function.join('.'))
    end
end
