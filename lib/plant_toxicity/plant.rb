class PlantToxicity::Plant

  attr_accessor :name, :url, :scientific_name, :other_names, :toxicity, :non_toxicity, :clinical_signs

  def initialize(name, url)
    @name = name
    @url = url
  end

  def details
    # or use scraper argument from cli?
    self.instance_variables.select do |var|
      var != nil && var != "" && var != :@name && var != :@url
    end
  end

end
