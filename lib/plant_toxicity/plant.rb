class PlantToxicity::Plant

  attr_accessor :name, :url, :scientific_name, :other_names, :toxicity, :non_toxicity, :clinical_signs

  def initialize(name, url)
    @name = name
    @url = url
  end

  def show_details
    header = "Details for #{@name}:"
    puts "-" * header.length
    puts header
    puts "-" * header.length
    self.instance_variables.each do |var|
      if var != nil && var != "" && var != :@name && var != :@url
        if var == :@other_names
          puts "Other Names:  #{self.instance_variable_get(var)}"
        elsif var == :@scientific_name
          puts "Scientific Name:  #{self.instance_variable_get(var)}"
        elsif var == :@toxicity
          puts "Toxicity:  #{self.instance_variable_get(var)}"
        elsif var == :@non_toxicity
          puts "Non-Toxicity:  #{self.instance_variable_get(var)}"
        elsif var == :@clinical_signs
          puts "Clinical Signs:  #{self.instance_variable_get(var)}"
        end
        if var != self.instance_variables.last
          puts "\n"
        end
      end
    end
    puts "-" * header.length
  end

end
