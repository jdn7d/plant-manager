require "nokogiri"



#def scraper
 #   page_url = https://www.guide-to-houseplants.com/
  #  guide_url =  https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html
 #parsed = Nokogiri::HTL(open(guide_url)
  #  binding.pry
#end
#scraper


class PlantManager::Scraper 

    attr_accessor :name, :water, :light, :fertilizer, :url
    def initialize(name=nil, water=nil, light=nil, fertilizer=nil, url=nil)
        @name = name
        @water = water
        @light = light
        @fertilizer = fertilizer
        @url = "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"
    end   

    def scraper
        guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"  #url
        parsed_page = Nokogiri::HTML(open(guide_url))                                           #opening up the page  
        urls = parsed_page.css("a").collect {|all| all.attribute("href").value}                 #this is a list of all the plant urls
           plant = PlantManager::Plant.new
        urls[1,urls.length].each do |url|                                                       #iterates through each url 
            opened_url = Nokogiri::HTML(open(url))                                              # opens the each page
            name = opened_url.css("h1").text                                                    #gets name from each page 
            plant_information = opened_url.css("p")
            water = nil
            light_info = nil
            #to get the information out of the plant pages, i need to iterate through the p elements and grab the one that starts with the specific strings
                plant_information.each do |p|
                        if p.css("span b").text.include?("Water:")
                            water = p      
                                  
                        end
                        end
                plant_information.each do |p|
                        if p.css("span b").text.include?("Light:")
                            light_info = p 
                        end
                        end
                plant_information.each do |p|
                        if p.css("span b").text.include?("Fertilizer:")
                            fertilizer_info = p 
                        #byebug           
                        end
                        end
        end  
    end
end
  