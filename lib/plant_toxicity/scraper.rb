class PlantToxicity::Scraper

  attr_accessor :doc

  URL_BASE = "https://www.aspca.org"

  def initialize
    @doc = Nokogiri::HTML(open(URL_BASE + "/pet-care/animal-poison-control/toxic-and-non-toxic-plants"))
  end

  def get_list(letter)
    letter_details = @doc.search("div.view-content span.views-summary a").detect {|letters| letters.text == letter.upcase}
    first_page = URL_BASE + letter_details.attribute("href").value
    other_pages = Nokogiri::HTML(open(first_page)).search("li.pager-item").collect {|page| URL_BASE + page.search("a").attribute("href").value}
    plants = []
    Nokogiri::HTML(open(first_page)).search("div.views-field-title a").each do |plant|
      plants << PlantToxicity::Plant.new(plant.text, URL_BASE + plant.attribute("href").value)
    end
    other_pages.each do |page|
      Nokogiri::HTML(open(page)).search("div.views-field-title a").each do |plant|
        plants << PlantToxicity::Plant.new(plant.text, URL_BASE + plant.attribute("href").value)
      end
    end
    plants
  end

  def get_plant_details(plant)
    details = Nokogiri::HTML(open(plant.url)).search("div.pane-entity-field div.field-items")
    details.each do |field|
      if field.search("span.label-inline-format-label").text == "Scientific Name:"
        plant.scientific_name = field.search("span.values").text
      end
      if field.search("span.label-inline-format-label").text == "Additional Common Names:"
        plant.other_names = field.search("span.values").text
      end
      if field.search("span.label-inline-format-label").text == "Toxicity:"
        plant.toxicity = field.search("span.values").text
      end
      if field.search("span.label-inline-format-label").text == "Non-Toxicity:"
        plant.non_toxicity = field.search("span.values").text
      end
      if field.search("span.label-inline-format-label").text == "Clinical Signs:"
        plant.clinical_signs = field.search("span.values").text
      end

    end
    #plant.scientific_name = "a scientific name"
    #plant.other_names = "some other names"
    #plant.toxicity = "toxic to some animals"
    #plant.non_toxicity = "non-toxic to some animals"
    #plant.clinical_symptoms = "some clinical symptoms"
  end

end
