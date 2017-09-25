class PlantToxicity::CLI

  def call
    puts "Welcome to the Plant Toxicity tool!"
    puts "The plants can be listed by letter. Please enter a letter from A to Z."
    input = gets.strip.downcase
    list(input)
    puts "Thank you for using the tool! Goodbye."
    exit
  end

  def list(input)
    until input == "exit"
      #input = gets.strip.downcase
      if input.match(/\b[a-z]\b/)
        list = PlantToxicity::List.new(input.upcase)
        list.list_plants
        puts "If you'd like more information about a specific plant, please enter its number. Otherwise, enter another letter or 'exit'."
        input = gets.strip.downcase
        if input.to_i <= list.plants.length
          while input.to_i <= list.plants.length
            list.plants[input.to_i-1].show_details
            puts "Please select another plant, choose another letter, or enter 'exit'."
            input = gets.strip.downcase
          end
        else
          list(input)
        end
      else
        puts "Sorry, that is not a valid option. Please enter a new choice or 'exit'."
        input = gets.strip.downcase
      end
    end
  end

end
