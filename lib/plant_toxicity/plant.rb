class PlantToxicity::Plant

  attr_accessor :name, :url, :scientific_name, :other_names, :toxicity, :non_toxicity, :clinical_symptoms

  def initialize(name, url)
    @name = name
    @url = url
  end

  def show_details
    puts "#{@name}"
    puts "#{@url}"
    puts "#{@scientific_name}"
    puts "#{@other_names}"
    puts "#{@toxicity}"
    puts "#{@non_toxicity}"
    puts "#{@clinical_symptoms}"
    # use scraper class method to get additional information about each plant
  end

end
