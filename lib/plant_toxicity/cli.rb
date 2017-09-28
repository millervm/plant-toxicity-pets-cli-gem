class PlantToxicity::CLI

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
        list = PlantToxicity::List.new(input.upcase)
        list.list_plants
        puts "Enter a letter from A to Z to see another list of plants, or enter 'exit' to end the session."
      elsif input == "exit"
        break
      else
        puts "Sorry, that is not a valid option. Enter a letter or 'exit'."
      end
    end
  end

end
