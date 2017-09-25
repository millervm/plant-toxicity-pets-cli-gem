class PlantToxicity::CLI

  def call
    puts "Welcome to the Plant Toxicity tool!"
    puts "The plants can be listed by letter."
    list_plants_by_letter
    puts "Thank you for using the tool! Goodbye."
    exit
  end

  # list to be fixed - loop incorrect
  def list_plants_by_letter
    input = nil
    until input == "exit"
      puts "Enter a letter from A to Z."
      input = gets.strip.downcase
      if input.match(/\b[a-z]\b/)
        # use Scraper class to get new list?
        list = PlantToxicity::List.new(input.upcase)
        list.list_plants
      else
        puts "Sorry, that is not a valid option."
      end
    end
  end

end
