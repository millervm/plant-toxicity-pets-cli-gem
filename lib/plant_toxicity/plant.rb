class PlantToxicity::Plant

  attr_accessor :name, :url, :scientific_name, :other_names, :toxicity, :non_toxicity, :clinical_symptoms

  def initialize(name, url)
    @name = name
    @url = url
  end

  def show_details
    puts "#{@name} - #{@url}"
  end

end
