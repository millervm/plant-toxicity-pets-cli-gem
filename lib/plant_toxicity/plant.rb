class PlantToxicity::Plant

  attr_accessor :name, :url, :scientific_name, :other_names, :toxicity, :non_toxicity, :clinical_signs

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def details
    [:@other_names, :@scientific_name, :@toxicity, :@non_toxicity, :@clinical_signs].reject do |var|
      self.instance_variable_get(var) == nil || self.instance_variable_get(var) == ""
    end
  end

  # potential method - useful when many plants have been acquired
  #def self.find_by_clinical_sign(keyword)
  #  self.all.select  do |plant|
  #    if plant.clinical_signs
  #      plant.clinical_signs.include? "#{keyword}"
  #    end
  #  end
  #end

end
