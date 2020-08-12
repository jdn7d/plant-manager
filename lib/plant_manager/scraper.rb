class PlantManager::Scraper 

  def self.scrape_names
    guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"   #site url
    parsed_page = Nokogiri::HTML(open(guide_url))  
    urls_list = []
    urls = parsed_page.css(".Liner")[1].css("a").collect {|all| all.attribute("href").value unless all.attribute("href").value == "#top" || all.attribute("href").value == nil } 
    urls.each_with_index do |index|
      puts "#{index.to_i+1}. #{urlas}"
    end
    puts urls
    
  end

  def self.scrape_info

    guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"   #site url
    parsed_page = Nokogiri::HTML(open(guide_url))  
    urls = parsed_page.css(".Liner")[1].css("a").collect {|all| all.attribute("href").value unless all.attribute("href").value == "#top" || all.attribute("href").value == nil } 
                              
    urls.each do |url|     
      puts "hi"                                                   #opens each url, skipping the first because it is "/"
      opened_url = Nokogiri::HTML(open(url))                                              #this is the opened url
      water, light, fertilizer, name = "", "", "", ""
       
      plant_information = opened_url.css("p") 
                                                    
      plant_information.each do |paragraph|                                                                                        
        name = opened_url.css("h1").text
      
        if paragraph.css("span b").text.include?("Water:")
          water = paragraph.text
        elsif paragraph.css("span b").text.include?("Light:")
          light = paragraph.text
        elsif paragraph.css("span b").text.include?("Fertilizer:")
          fertilizer = paragraph.text
        end         
      end
        PlantManager::Plant.new(name, water, light, fertilizer)  
    end      
      byebug
  end
end

  