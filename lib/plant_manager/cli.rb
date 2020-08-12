# Our CLI Controller
# menus and main logic 
class PlantManager::CLI
   
    def menu
        @input = nil        
        PlantManager::Scraper.scraper
        while @input != "exit"
            
            puts "Which houseplant are you are you curious about today? Type exit if you don't want to search for a plant. Type all to see all plants."
            @input = gets.strip
            
        if @input == "all"
        
            puts "Here is a list of all the houseplants."
            PlantManager::Plant.all_plants
            
        elsif @input == "exit"
            exit
        elsif @input.to_i.between?(1, PlantManager::Plant.all.count)
            select_plant
        elsif  @input == "exit"
            exit 
        else
            #puts "Invalid Entry"
        
        end
        end
    end
    def select_plant
        selected_plant = Plant.find(@input)
        puts "#{select_plant.name}:"

        selected_plant.each_with_index do |plant, index|
            puts ""
      
            puts "#{index+1}. #{plant.name}#{plant.water}#{plant.light}#{plant.fertilizer}"
          end 
    end
    def exit
        puts "Good luck keeping those plants alive!"
    end
end



