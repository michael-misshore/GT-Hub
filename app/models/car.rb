class Car < ActiveRecord::Base
  scope :ordered, order("make ASC, model ASC, year ASC")
  
  def display_name
    if premium && standard
      type = 'P|S'
    elsif
      type = premium ? 'P' : 'S'
    end
    "#{make} #{year} #{model} (#{type})"
  end
  
  def self.import
    # We need to flush the table first
    Car.delete_all
    
    @make = ''
    IO.foreach("import_data/cars.txt") {|block|
      # Get the make of the car
      make = block.match("==(.*)")
      if !make.nil?
        @make = make[0].gsub(/[=\[\]]/, '').strip
      elsif !block.strip.empty?
        car = {:make => @make}
        # Get the year of the vehicle
        year = block.match(/\'[0-9]{2}/);
        if !year.nil?
          block = block.gsub(year[0], "") # We no longer need the year in the line
          year = year.to_s.gsub(/\'/, '').to_i
          # I am decided to store the year in a 4 digit format
          # There maybe a better way to do this, but this works... for now. :)
          year = (year > 30) ? (year + 1900) : (year + 2000)
        end
        car[:year] = year
        
        # Get the type of car (Standard or Premium) : Assuming we have a type for all lines
        type = block.match(/(\[st\])|(\[pr\])/)
        block = block.gsub(/(\[st\])|(\[pr\])/, '') # We no longer need the type(s) in the line
        car[:premium] = type.to_s.include?('[pr]') ? true : false
        car[:standard] = type.to_s.include?('[st]') ? true : false
          
        # remove make and the beginning asterik so we have just the model left
        block.gsub!(/#{@make}|\*/, '')
        car[:model] = block.gsub(/(\[\[)|(\]\])/, '').gsub(/(\s)+/, ' ')
        
        car = Car.new(car)
        car.save
      end
    }
  end
  
  def self.get_years_by_make (make)
    Car.select('DISTINCT(year) as year').where('make = ?', make)
  end

end
