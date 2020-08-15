class PlantManager::Scraper 
  @@all_names_urls = []

  def self.scrape_names
    guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html" 
    parsed_page = Nokogiri::HTML(open(guide_url))  
    plant_name = ""
    plant_url = ""
    parsed_page.css(".Liner")[1].css("a").each do |all| 
      plant_name = all.text unless all.attribute("href").value == "#top" || all.attribute("href").value == nil 
      plant_url = all.attribute("href").value
      new_plant = PlantManager::Plant.new(plant_name, plant_url)
      @@all_names_urls << new_plant
    end
  end

  def self.all_names_urls
    @@all_names_urls
  end

  def self.scrape_info(plant_url)                   
    @@all_names_urls
    opened_url = Nokogiri::HTML(open(plant_url))                                              
    water, light, fertilizer = "", "", ""
    plant_information = opened_url.css("p")                                     
    #name = opened_url.css("h1").text
    PlantManager::Plant.get_info(plant_information)
    
    
    #PlantManager::Plant.set_name.water = water
    #PlantManager::CLI.print_info(name, water, light, fertilizer)
    #PlantManager::Plant.find(plant_url)
  end      
end


  