class PlantToxicity::PlantTox

  attr_accessor :name, :toxicity, :non_toxicity, :clinical_symptoms, :url

  def initialize(name, url)
    @name = "plant name"
    @url = "aspca url"
  end

end
