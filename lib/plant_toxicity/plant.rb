class PlantToxicity::Plant

  attr_accessor :name, :toxicity, :non_toxicity, :clinical_symptoms, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def show_details
    puts "#{@name} - #{@url}"
  end

end
