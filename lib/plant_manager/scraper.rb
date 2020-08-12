require "nokogiri"


class PlantManager::Scraper 

  def self.scraper

    guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"   #site url
    parsed_page = Nokogiri::HTML(open(guide_url))  
    urls = parsed_page.css(".Liner")[1].css("a").collect {|all| all.attribute("href").value unless all.attribute("href").value == "#top" || all.attribute("href").value == nil } 
                              
    urls.each do |url|                                                        #opens each url, skipping the first because it is "/"
      opened_url = Nokogiri::HTML(open(url))                                              #this is the opened url
      water, light, fertilizer, name = "", "", "", ""
       
      plant_information = opened_url.css("p") 
                                                     #each p element is the plant information
      plant_information.each do |paragraph|                                               #i'm itering through each paragraph element because they were coded into indiv classes                                            
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
  