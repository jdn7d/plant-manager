class PlantManager::Plant

    attr_accessor :name, :water, :light, :fertilizer, :url      #creating plant attributes
    @@all = []                                                #creating a class variable for all plants
    @@urls = []
    def initialize(name, water, light, fertilizer)
      @name = name
      @water = water 
      @light = light 
      @fertilizer = fertilizer 
      @@all << self 
    end

    def self.find(plant_number)                               #this is looking in the class variable for a plant 
      @@all[plant_number.to_i-1]
      self.plants[plant_number.to_i-1]
    end

    def self.all
      @@all
      byebug
    end

    def self.all_plants
      puts "hi"
     
    end
  end
