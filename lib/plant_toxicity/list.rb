class PlantToxicity::List

  attr_accessor :letter, :plants, :scraper

  #SCRAPER_OBJECT = PlantToxicity::Scraper.new

  def initialize(letter)
    @letter = letter.upcase
    # use scraper method to get plants details (with @letter as argument, used to find selector/url)
    #@plants = SCRAPER_OBJECT.get_list(@letter)
    @scraper = PlantToxicity::Scraper.new
    @plants = @scraper.get_list(@letter)
    #[1,2,3].each do |i|
      #@plants << PlantToxicity::Plant.new("plant #{i}", "url #{i}")
    #end
  end

  def list_plants
    # for each plant in the @plants array, list #. plant name
    puts "These are the plants that begin with the letter '#{@letter}':"
    @plants.each.with_index(1) do |plant, i|
      puts "#{i}. #{plant.name}"
    end
    puts "Would you like to see more details about a plant in this list? (Y/N)"
    input = nil
    until input == "n"
      # puts "Would you like to see more details about a plant in this list? (Y/N)"
      input = gets.strip.downcase
      if input == "y"
        plant_details
        puts "Would you like more information about another plant in this list? (Y/N)"
      elsif input == "n"
        break
      else
        puts "Sorry, that is not a valid option. Please enter Y or N."
      end
    end
  end

  def plant_details
    puts "Please enter the plant's number. (1-#{@plants.length})"
    input = gets.strip.to_i
    until input >= 1 && input <= @plants.length
      puts "Sorry, that is not a valid option. Please enter a number."
      input = gets.strip.to_i
      #if input == "exit"
      #  puts "Thanks for using the tool! Goodbye!"
      #  exit
      #end
    end
    plant = @plants[input-1]
    @scraper.get_plant_details(plant)
    plant.show_details
  end

end
