class PlantToxicity::CLI

  def call
    puts "Welcome to the Plant Toxicity tool!"
    puts "The plants can be listed by letter."
    list_plants_by_letter
    puts "Thank you for using the tool! Goodbye."
    exit
  end

  def list_plants_by_letter
    # change puts/loop order to be similar to get_plant_details in list?
    # clean up interface to indicate that letter or "exit" is an option
    input = nil
    until input == "exit"
      puts "To see a list of plants, enter a letter from A to Z. Enter 'exit' to end the session."
      input = gets.strip.downcase
      if input.match(/\b[a-z]\b/)
        list = PlantToxicity::List.new(input.upcase)
        list.list_plants
      elsif input == "exit"
        break
      else
        puts "Sorry, that is not a valid option."
      end
    end
  end

end
