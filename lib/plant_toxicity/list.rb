class PlantToxicity::List

  attr_accessor :letter, :plants
  attr_reader :scraper

  @@all = []

  def initialize(letter)
    @letter = letter.upcase
    @scraper = PlantToxicity::Scraper.new
    @plants = @scraper.get_list(@letter)
    @@all << self
  end

  def self.all
    @@all
  end

  def select_plant(input)
    plant = self.plants[input]
    self.scraper.get_plant_details(plant)
    plant
  end

end
