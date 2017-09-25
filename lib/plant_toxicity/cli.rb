class PlantToxicity::CLI

  def call
    puts "Welcome to the Plant Toxicity tool!"
    puts "Enter 'exit' at any time to end the session."
    input = ""
    while input != "exit"
      puts "The plants can be listed by letter. Which letter would you like to see?"
      input = gets.strip.downcase
      if input.match(/\b[A-Za-z]\b/)
        list = List.new(input)
        #puts "Here is the list:"
        # puts "If you'd like more information about a specific plant, please select the number."
      elsif input == "exit"
        puts "Thank you for using the tool! Goodbye!"
        exit
      else
        puts "Sorry, that is not a valid option. Please enter a letter from A to Z or 'exit'."
      end
    end
  end



end
