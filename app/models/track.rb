class Track < ActiveRecord::Base  
  scope :ordered, order("name ASC")
  
  def self.import
    Track.delete_all
    
    @group = ''
    IO.foreach("import_data/tracks.txt") {|line|
      # Get the group of the tracks
      group = line.match("==(.*)")
      if !group.nil?
        @group = group.to_s.gsub(/[=]/, '').strip
      elsif !line.strip.empty?
        track = Track.new({:group => @group, :name => line})
        track.save
      end
    }
  end
  
end
