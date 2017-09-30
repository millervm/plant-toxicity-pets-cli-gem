class PlantToxicity::CLI

  #@@scraper = nil
  attr_reader :scraper

  def initialize
    @scraper = PlantToxicity::Scraper.new
  end

  #def self.scraper
  #  @@scraper
  #end

  def call
    puts "Welcome to the Plant Toxicity tool!"
    puts "-----------------------------------"
    puts "The plants are listed alphabetically by letter, according to the first letter in each plant's name."
    list_plants_by_letter
    puts "-----------------------------------"
    puts "Thank you for using the tool! Goodbye."
    exit
  end

  def list_plants_by_letter
    puts "To see a list of plants, enter a letter from A to Z. Enter 'exit' to end the session."
    input = nil
    until input == "exit"
      input = gets.strip.downcase
      if input.match(/\b[a-z]\b/)
        #list = PlantToxicity::List.new(input.upcase)
        #list.list_plants
        list = PlantToxicity::List.all.detect {|list| list.letter == input.upcase}
        if !list
          list = PlantToxicity::List.new(input.upcase)
          self.scraper.get_list(list)
        end
        display_list(list)
        puts "Enter a letter from A to Z to see another list of plants, or enter 'exit' to end the session."
      elsif input == "exit"
        break
      else
        puts "Sorry, that is not a valid option. Enter a letter or 'exit'."
      end
    end
  end

  # new

  def display_list(list)
    if !list.plants.empty?
      puts "These are the plants that begin with the letter '#{list.letter}':"
      list.plants.each.with_index(1) do |plant, i|
        puts "#{i}. #{plant.name}"
      end
      puts "-----------------------------------"
      puts "Would you like to see more details about a plant in this list? (Y/N)"
      input = nil
      until input == "n"
        input = gets.strip.downcase
        if input == "y"
          show_details(list)
          puts "Would you like more information about another plant in this list? (Y/N)"
        elsif input == "n"
          break
        else
          puts "Sorry, that is not a valid option. Please enter Y or N."
        end
      end
    else
      puts "-----------------------------------"
      puts "There are no plants that begin with the letter '#{list.letter}'."
      puts "-----------------------------------"
    end
  end

  def show_details(list)
    puts "Please enter the plant's number. (1-#{list.plants.length})"
    input = gets.strip.to_i
    until input >= 1 && input <= list.plants.length
      puts "Sorry, that is not a valid option. Please enter a number."
      input = gets.strip.to_i
    end
    plant = list.plants[input-1]
    self.scraper.get_plant_details(plant)
    display_plant(plant)
  end

  def display_plant(plant)
    header = "Details for #{plant.name}:"
    puts "-" * header.length
    puts header
    puts "-" * header.length
    plant.details.each do |detail|
      # change to prevent blank list fields
      puts "Other Names:  #{plant.other_names}" if detail == :@other_names
      puts "Scientific Name:  #{plant.scientific_name}" if detail == :@scientific_name
      puts "Toxicity:  #{plant.toxicity}" if detail == :@toxicity
      puts "Non-Toxicity:  #{plant.non_toxicity}" if detail == :@non_toxicity
      puts "Clinical Signs:  #{plant.clinical_signs}" if detail == :@clinical_signs
      puts "\n" if detail != plant.details.last
    end
    puts "-" * header.length
  end


end
