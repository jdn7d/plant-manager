# Our CLI Controller
# menus and main logic 
class PlantManager::CLI   
    
    def print_options
        PlantManager::Scraper.scrape_names
    end

    def menu    
        print_options
        puts "Which houseplant are you are you curious about today? Type exit if you don't want to search for a plant. Type all to see all plants." 
        @input = nil     
        while @input != "exit"   
            @input = gets.strip

            if @input == "all"
                puts "Here is a list of all the houseplants."
                print_options
            elsif @input.to_i.between?(1, PlantManager::Plant.all.count)
                plant_number = @input.to_i-1
                plant_url = PlantManager::Plant.all[@input.to_i-1].url
                PlantManager::Scraper.scrape_info(plant_url) 
                PlantManager::Plant.print_info(plant_url)
            elsif @input == "exit"
                exit
            else
                puts "Invalid Entry"
                puts "Which houseplant are you are you curious about today? Type exit if you don't want to search for a plant. Type all to see all plants." 
            end 
        end
    end

    def exit
        puts "Good luck keeping those plants alive!"
    end
end



