require "nokogiri"


class PlantManager::Scraper 

        def self.Scraper
          guide_url =  "https://www.guide-to-houseplants.com/house-plants-encyclopedia-a-z.html"   #site url
          urls = parsed_page.css("a").collect {|all| all.attribute("href").value}                  #list of all the urls for pages that represent individual plants
          urls[1,urls.length].each do |url|                                                        #opens each url, skipping the first because it is "/"
            opened_url = Nokogiri::HTML(open(url))                                                 #this is the opened url
            plant_information = opened_url.css("p")                                                #each p element is the plant information
            plant_information.each do |paragraph|                                               #i'm itering through each paragraph element because they were coded into indiv classes                                            
                name = opened_url.css("h1").text
                if paragraph.css("span b").text.include?("Water:")
                  water = paragraph
                elsif paragraph.css("span b").text.include?("Light:")
                  light = paragraph
                elsif paragraph.css("span b").text.include?("Fertilizer:")
                  fertilizer = paragraph
                end
                name = PlantManager::Plant.new(name, water, light, fertilizer)  
            end
          end
        end
  end
  