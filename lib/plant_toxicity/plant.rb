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
        puts "Other Names:  #{self.instance_variable_get(var)}" if var == :@other_names
        puts "Scientific Name:  #{self.instance_variable_get(var)}" if var == :@scientific_name
        puts "Toxicity:  #{self.instance_variable_get(var)}" if var == :@toxicity
        puts "Non-Toxicity:  #{self.instance_variable_get(var)}" if var == :@non_toxicity
        puts "Clinical Signs:  #{self.instance_variable_get(var)}" if var == :@clinical_signs
        puts "\n" if var != self.instance_variables.last
      end
    end
    puts "-" * header.length
  end

end
