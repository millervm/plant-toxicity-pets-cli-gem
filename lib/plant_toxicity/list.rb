class PlantToxicity::List

  attr_accessor :letter, :plants

  def initialize(letter)
    @letter = letter.upcase
    @plants = ["plant one", "plant two", "plant three"]
  end

  def list_plants
    # for each plant in the @plants array, list #. plant name
    puts "Here are the plants that begin with the letter '#{@letter}':"
    #puts "this is the list of plants for letter #{@letter}"
    @plants.each.with_index(1) do |plant, i|
      puts "#{i}. #{plant}"
    end
  end

end
