class PlantManager::Scraper 
   
  plant_name = ""
  plant_url = ""

  def self.scrape_names
    guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html" 
    parsed_page = Nokogiri::HTML(open(guide_url))  
    parsed_page.css(".Liner")[1].css("a").each do |all| 
      plant_name = all.text unless all.attribute("href").value == "#top" || all.attribute("href").value == nil 
      plant_url = all.attribute("href").value
      PlantManager::Plant.new_by_url(plant_name, plant_url)  
    end
  end
  
  def self.all_names_urls
    PlantManager::Plant.all.each.with_index(1) {|i, index| puts "#{index}. #{i.name}"} 
    
  end

  def self.scrape_info(plant_url)                   
    
    opened_url = Nokogiri::HTML(open(plant_url))                                              
    water, light, fertilizer = "", "", ""
    plant_information = opened_url.css("p")                                     
    name = opened_url.css("h1").text
    plant_information.each do |paragraph|                                                                                        
      water = paragraph.text if paragraph.text.include?("Water:") 
      light = paragraph.text if paragraph.text.include?("Light:") 
      fertilizer = paragraph.text if paragraph.text.include?("Fertilizer:") 
    end
    PlantManager::Plant.find_by_url( plant_url,water, light, fertilizer)
   
  end      
end


  