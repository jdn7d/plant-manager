
#require "nokogiri"

class PlantManager::Plant
 
    #attr_accessor :name, :water, :light, :fertilizer, :url
    @@all = []

    def self.new_from_index_page
    
    end
   
    def self.scrape_site
        
        plants = []
        plants << self.scrape
        plants
    end
end
 

    
