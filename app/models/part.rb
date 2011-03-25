class Part < ActiveRecord::Base
  
  def self.import
    Part.delete_all
    
    IO.foreach("import_data/parts.txt") {|line|
      if line.match("==(.*)").nil? && !line.strip.empty?
        part = Part.new({:name => line})
        part.save
      end
    }
  end
  
end
