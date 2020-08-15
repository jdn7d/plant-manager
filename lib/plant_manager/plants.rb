class PlantManager::Plant

    attr_accessor :name, :url
    attr_reader :water, :light, :fertilizer  
        
    @@all = []                                              
  
    def initialize(name, url)
      @name = name
      @url = url
      @@all << self 
    end


    def self.all
      @@all
    end

    def self.get_info(plant_information)
      plant_information.each do |paragraph|                                                                                        
        @water = paragraph.text if paragraph.text.include?("Water:") 
        @light = paragraph.text if paragraph.text.include?("Light:") 
        @fertilizer = paragraph.text if paragraph.text.include?("Fertilizer:") 
        byebug
      end
      PlantManager::CLI.print_info
    end

    end
  