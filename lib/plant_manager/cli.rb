# Our CLI Controller
# menus and main logic 
class PlantManager::CLI   

    
        def menu    
            
        PlantManager::Scraper.scrape_names
        question = "Which houseplant are you are you curious about today? Type none if you don't want to search for a plant. Type all to see all plants."
        puts question
        @input = nil     
        while @input != "exit"   
            @input = gets.strip
            if @input == "all"
                puts "Here is a list of all the houseplants."
                PlantManager::Scraper.scrape_names
                puts question
            elsif @input.to_i.between?(1, PlantManager::Plant.all.count)
                PlantManager::Plant.self.find(@input)
                select_plant   
            elsif @input == "exit"
                exit
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

        selected_plant.each.with_index(1) do |plant, index|
            puts ""
      
            puts "#{index+1}. #{plant.name}#{plant.water}#{plant.light}#{plant.fertilizer}"
          end 
    end

    def exit
        puts "Good luck keeping those plants alive!"
    end
end



