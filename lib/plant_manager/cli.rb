# Our CLI Controller
# menus and main logic 
class PlantManager::CLI

    def call
        
        all_plants
        menu
      #  bye
    end
    def all_plants
         guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"  #url
        parsed_page = Nokogiri::HTML(open(guide_url))                                           #opening up the page  
        urls = parsed_page.css("a").collect {|all| all.attribute("href").value}     
        
    @scraper = PlantManager::Scraper.new
    @scraper.scraper
    
    #@@plants
       #@@plants = PlantManager::Plants.scrape_site
       #@@plants.to_a.each.with_index(1) do |plant, i|
       #puts "#{1}. #{plant.name}"
    end
    def menu
        input = nil
            puts "Which houseplant are you are you curious about today? Type exit if you don't want to search for a plant. Type all to see all plants."
            
            while input != "exit" 
             if input != " "
               # selected_plant = @plants[input.to_i-1]
            input = gets.strip.downcase
            case input 
            when "1"
            puts "More info on deal 1..."
           # puts "Is there another plant you would like to search for?"  
            when "all"
                puts "this is a list of all plants"
                  all_plants
            when "exit"
                puts "Good luck keeping those plants alive!" 
            else 
                puts "Invalid entry"
            end
            end
        def bye
            
        end
    end
end
end

