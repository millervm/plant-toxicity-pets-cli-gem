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
    if @other_names != nil && @other_names != ""
      puts "Other Names:  #{@other_names}" + "\n\n"
    end
    if @scientific_name != nil && @scientific_name != ""
      puts "Scientific Name:  #{@scientific_name}" + "\n\n"
    end
    if @toxicity != nil && @toxicity != ""
      puts "Toxicity:  #{@toxicity}" + "\n\n"
    end
    if @non_toxicity != nil && @non_toxicity != ""
      puts "Non-Toxicity:  #{@non_toxicity}" + "\n\n"
    end
    if @clinical_signs != nil && @clinical_signs != ""
      puts "Clinical Signs:  #{@clinical_signs}"
    end
    puts "-" * header.length
  end

end
