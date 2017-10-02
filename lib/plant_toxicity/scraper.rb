class PlantToxicity::Scraper

  URL_BASE = "https://www.aspca.org"

  def self.get_list(letter)
    plants = []
    doc = Nokogiri::HTML(open(URL_BASE + "/pet-care/animal-poison-control/toxic-and-non-toxic-plants"))
    letter_details = doc.search("div.view-content span.views-summary a").detect {|letters| letters.text == letter.upcase}
    if letter_details != nil
      pages = []
      pages << URL_BASE + letter_details.attribute("href").value
      Nokogiri::HTML(open(pages.first)).search("li.pager-item").each {|page| pages << URL_BASE + page.search("a").attribute("href").value}
      if pages.length > 1
        next_page = Nokogiri::HTML(open(pages.last)).search("ul.pager li").detect {|link| link.attribute("class").value == "pager-next"}
        while next_page
          pages << URL_BASE + next_page.search("a").attribute("href").value
          next_page = Nokogiri::HTML(open(pages.last)).search("ul.pager li").detect {|link| link.attribute("class").value == "pager-next"}
        end
      end
      pages.each do |page|
        Nokogiri::HTML(open(page)).search("div.views-field-title a").each do |plant|
          plants << PlantToxicity::Plant.new(plant.text, URL_BASE + plant.attribute("href").value)
        end
      end
    end
    plants
  end

  def self.get_plant_details(plant)
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
