class PlantToxicity::Plant

  attr_accessor :name, :url, :scientific_name, :other_names, :toxicity, :non_toxicity, :clinical_signs

  def initialize(name, url)
    @name = name
    @url = url
  end

  def details
    [:@other_names, :@scientific_name, :@toxicity, :@non_toxicity, :@clinical_signs].reject do |var|
      self.instance_variable_get(var) == nil || self.instance_variable_get(var) == ""
    end
  end

end
