class PlantManager::Scraper 
  @@all_names = []

  def self.scrape_names
    guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html" 
    parsed_page = Nokogiri::HTML(open(guide_url))  
    plant_name = ""
    plant_url = ""
    parsed_page.css(".Liner")[1].css("a").each do |all| 
      plant_name = all.text unless all.attribute("href").value == "#top" || all.attribute("href").value == nil 
      plant_url = all.attribute("href").value
      @@all_names << PlantManager::Plant.new(plant_name, plant_url)
    end
    #all_names = .all.each.with_index(1) {|i, index| puts "#{index}. #{i.name}"}
    #urls.each.with_index(1).each do | url|
    #puts "#{url}. #{index} "
    #end    
    
  end

  def self.all_names
    @@all_names
  end

  def self.scrape_info(plant_url)                   
      @@all_names
      opened_url = Nokogiri::HTML(open(plant_url))                                              
      water, light, fertilizer = "", "", ""
      plant_information = opened_url.css("p")                                     
      
      plant_information.each do |paragraph|                                                                                        
        if paragraph.css("span b").text.include?("Water:") 
          water = paragraph. 
        elsif paragraph.css('span b:contains("Light:")') 
          light = paragraph.text
        elsif paragraph.css("span b").text.include?("Fertilizer:")
          fertilizer = paragraph.text
        else
          byebug
          puts "no info"
          byebug
        end         
        name = opened_url.css("h1").text
        PlantManager::Plant.new(name, water, light, fertilizer)  
      end
    end      

  end


  