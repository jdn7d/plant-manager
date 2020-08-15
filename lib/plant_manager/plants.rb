class PlantManager::Plant

    attr_accessor :name, :url, :water, :light, :fertilizer 
    attr_reader  
        
    @@all = []                                              
 
    def self.all
      @@all
    end

    def save
      self.class.all << self 
    end

    def self.create
      plant = PlantManager::Plant.new
      plant.save
      plant
    end

    def self.new_by_url(plant_name, plant_url)
      plant = self.new
      plant.url = plant_url
      plant.name = plant_name
      plant.save
    end

    def self.new_by_info(water, light, fertilizer)
      plant = self.new
      plant.water = water
      plant.light = light
      plant.fertilizer = fertilizer
      plant.save
    end

    def self.find_by_url(plant_url)
      i = self.all.find {|plant| plant.url == plant_url}
         
                puts "Here is some information on how to care for a #{i.name}:"
                puts "---------------"
                puts "#{i.water}"
                byebug
                puts "---------------"
                puts "#{i.light}"
                puts "---------------"
                puts "#{i.fertilizer}"
                puts "---------------"
                puts "Good luck keeping your #{i.name} alive!"
                puts ""
                
    end
end
  