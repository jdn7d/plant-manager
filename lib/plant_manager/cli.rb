# Our CLI Controller
# menus and main logic 
class PlantManager::CLI   
    
    def print_options
        PlantManager::Scraper.scrape_names
        PlantManager::Plant.all.each.with_index(1) {|i, index| puts "#{index}. #{i.name}"}
    end

    def menu    
        print_options
        puts "Which houseplant are you are you curious about today? Type none if you don't want to search for a plant. Type all to see all plants." 
        @input = nil     
        while @input != "none"   
            @input = gets.strip

            if @input == "all"
                puts "Here is a list of all the houseplants."
                print_options
                #PlantManager::Scraper.scrape_names
                #PlantManager::Scraper.all_names_urls
                #PlantManager::Plant.all.each.with_index(1) {|i, index| puts "#{index}. #{i.name}"}
                #puts question
            elsif @input.to_i.between?(1, PlantManager::Plant.all.count)
                plant_number = @input.to_i-1
                #PlantManager::Scraper.all_names
                plant_url = PlantManager::Plant.all[@input.to_i-1].url
                PlantManager::Scraper.scrape_info(plant_url)   
            elsif @input == "none"
                exit
            else
                puts "Invalid Entry"
                puts question
            end 
        end
    end

    def self.print_info(water, light, fertilizer)
      puts ""
      puts "Here is some information on how to care for an #{name}:"
      puts "---------------"
      puts @water
      puts "---------------"
      puts @light
      puts "---------------"
      puts @fertilizer
      puts "---------------"
      puts "Good luck keeping your #{name} alive!"
      puts ""
    end

    def exit
        puts "Good luck keeping those plants alive!"
    end
end



