class PlantToxicity::List

  attr_accessor :letter, :plants

  def initialize(letter)
    @letter = letter.upcase
    @plants = []
    [1,2,3].each do |i|
      @plants << PlantToxicity::Plant.new("plant #{i}", "url #{i}")
    end
  end

  def list_plants
    # for each plant in the @plants array, list #. plant name
    puts "These are the plants that begin with the letter '#{@letter}':"
    #puts "this is the list of plants for letter #{@letter}"
    @plants.each.with_index(1) do |plant, i|
      puts "#{i}. #{plant.name}"
    end
    more = nil
    until more == "N"
      puts "Would you like to see more details about a plant in this list? (Y/N)"
      more = gets.strip.upcase
      if more == "Y"
        plant_details
      elsif more != "Y" && more != "N"
        puts "Sorry, that is not a valid option. Please enter Y or N."
      end
    end
  end

  def plant_details
    puts "Please enter the plant's number."
    number = gets.strip.to_i
    until number <= @plants.length
      puts "Sorry, that is not a valid option. Please enter a number."
      number = gets.strip.to_i
    end
    plant = @plants[number-1]
    plant.show_details
  end

end
