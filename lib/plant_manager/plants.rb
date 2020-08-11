
#require "nokogiri"

class PlantManager::Plant

    attr_accessor :name, :water, :light, :fertilizer, :url      #creating plant attributes
    @@all = []                                                #creating a class variable for all plants
    def self.find(plant_number)                               #this is looking in the class variable for a plant 
      @@all[plant_number.to_i-1]
    end
    def initialize(name)
      @name = name
      @water = water 
      @light = light 
      @fertilizer = fertilizer 
      @@all << self 
    end
    def find_plant(plant_number)
      self.plants[plant_number.to_i-1]
    end
    def self.all
      @@all
    end
    def self.all_plants
      @@all.each_with_index do |plant, index|
        puts "#{index+1}. #{plant.name}"
      end
    end
  end
