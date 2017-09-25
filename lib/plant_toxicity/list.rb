class PlantToxicity::List

  attr_accessor :letter, :plants

  def initialize(letter)
    @letter = letter
    @plants = []
  end

  def list_plants
    # for each plant in the @plants array, list #. plant name
  end

end
