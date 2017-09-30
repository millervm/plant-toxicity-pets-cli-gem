class PlantToxicity::List

  attr_accessor :letter, :plants
  #attr_reader :scraper

  @@all = []

  #@@scraper = nil

  def initialize(letter)
    @letter = letter.upcase
    #@scraper = PlantToxicity::Scraper.new
    #@plants = PlantToxicity::CLI.scraper.get_list(@letter)
    @plants = []
    @@all << self
  end

  def self.all
    @@all
  end

  #def self.scraper
  #  if @@all.empty?
  #    @@scraper = PlantToxicity::Scraper.new
  #  end
  #  @@scraper
  #end

  #def list_plants
  #  if !@plants.empty?
  #    puts "These are the plants that begin with the letter '#{@letter}':"
  #    @plants.each.with_index(1) do |plant, i|
  #      puts "#{i}. #{plant.name}"
  #    end
  #    puts "-----------------------------------"
  #    puts "Would you like to see more details about a plant in this list? (Y/N)"
  #    input = nil
  #    until input == "n"
  #      input = gets.strip.downcase
  #      if input == "y"
  #        plant_details
  #        puts "Would you like more information about another plant in this list? (Y/N)"
  #      elsif input == "n"
  #        break
  #      else
  #        puts "Sorry, that is not a valid option. Please enter Y or N."
  #      end
  #    end
  #  else
  #    puts "-----------------------------------"
  #    puts "There are no plants that begin with the letter '#{@letter}'."
  #    puts "-----------------------------------"
  #  end
  #end

  #def plant_details
  #  puts "Please enter the plant's number. (1-#{@plants.length})"
  #  input = gets.strip.to_i
  #  until input >= 1 && input <= @plants.length
  #    puts "Sorry, that is not a valid option. Please enter a number."
  #    input = gets.strip.to_i
  #  end
  #  plant = @plants[input-1]
  #  @scraper.get_plant_details(plant)
  #  plant.show_details
  #end

end
