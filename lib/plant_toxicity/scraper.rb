class PlantToxicity::Scraper

  attr_accessor :doc

  URL_BASE = "https://www.aspca.org"

  def initialize
    @doc = Nokogiri::HTML(open(URL_BASE + "/pet-care/animal-poison-control/toxic-and-non-toxic-plants"))
  end

  def get_list(letter)
    # get letter base url
    # search each page of results for that letter
    # create Plant object for each result, add to array (either empty array -> each << or collect)
    #[1,2,3].collect do |i|
    #  PlantToxicity::Plant.new("plant #{i}", "url #{i}")
    #end
    letter_details = @doc.search("div.view-content span.views-summary a").detect {|letters| letters.text == letter.upcase}
    letter_link = URL_BASE + letter_details.attribute("href").value
  end

  def get_plant_details(plant)
    plant.scientific_name = "a scientific name"
    plant.other_names = "some other names"
    plant.toxicity = "toxic to some animals"
    plant.non_toxicity = "non-toxic to some animals"
    plant.clinical_symptoms = "some clinical symptoms"
  end


end
