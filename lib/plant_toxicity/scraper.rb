class PlantToxicity::Scraper

  attr_accessor :doc

  URL_BASE = "https://www.aspca.org"

  def initialize
    @doc = Nokogiri::HTML(open(URL_BASE + "/pet-care/animal-poison-control/toxic-and-non-toxic-plants"))
  end

  def get_list(letter)
    plants = []
    letter_details = @doc.search("div.view-content span.views-summary a").detect {|letters| letters.text == letter.upcase}
    if letter_details != nil
      pages = []
      # first_page = URL_BASE + letter_details.attribute("href").value
      pages << URL_BASE + letter_details.attribute("href").value
      # other_pages = Nokogiri::HTML(open(first_page)).search("li.pager-item").collect {|page| URL_BASE + page.search("a").attribute("href").value}
      Nokogiri::HTML(open(pages.first)).search("li.pager-item").each {|page| pages << URL_BASE + page.search("a").attribute("href").value}
      # if !other_pages.empty?
      if pages.length > 1
        next_page = Nokogiri::HTML(open(pages.last)).search("ul.pager li").detect {|link| link.attribute("class").value == "pager-next"}
        while next_page
          pages << URL_BASE + next_page.search("a").attribute("href").value
          next_page = Nokogiri::HTML(open(pages.last)).search("ul.pager li").detect {|link| link.attribute("class").value == "pager-next"}
        end
      end
      #Nokogiri::HTML(open(first_page)).search("div.views-field-title a").each do |plant|
      #  plants << PlantToxicity::Plant.new(plant.text, URL_BASE + plant.attribute("href").value)
      #end
      pages.each do |page|
        Nokogiri::HTML(open(page)).search("div.views-field-title a").each do |plant|
          plants << PlantToxicity::Plant.new(plant.text, URL_BASE + plant.attribute("href").value)
        end
      end
    end
    plants
  end

  def get_plant_details(plant)
    Nokogiri::HTML(open(plant.url)).search("div.pane-entity-field div.field-items").each do |field|
      if field.search("span.label-inline-format-label").text == "Scientific Name:"
        plant.scientific_name = field.search("span.values").text.strip
      end
      if field.search("span.label-inline-format-label").text == "Additional Common Names:"
        plant.other_names = field.search("span.values").text.strip
      end
      if field.search("span.label-inline-format-label").text == "Toxicity:"
        plant.toxicity = field.search("span.values").text.strip
      end
      if field.search("span.label-inline-format-label").text == "Non-Toxicity:"
        plant.non_toxicity = field.search("span.values").text.strip
      end
      if field.search("span.label-inline-format-label").text == "Clinical Signs:"
        plant.clinical_signs = field.search("span.values").text.strip
      end
    end
  end

end
