class PlantToxicity::List

  attr_accessor :letter, :plants
  attr_reader :scraper

  @@all = []

  def initialize(letter)
    @letter = letter.upcase
    @plants = PlantToxicity::Scraper.get_list(@letter)
    @@all << self
  end

  def self.all
    @@all
  end

  def select_plant(input)
    plant = self.plants[input]
    PlantToxicity::Scraper.get_plant_details(plant)
    plant
  end

end
