class Part < ActiveRecord::Base
  has_and_belongs_to_many :tunes
  
  scope :ordered, order("name ASC")
  
  def self.import
    Part.delete_all
    
    @group = ''
    IO.foreach("import_data/parts.txt") {|line|
      group = line.match("==(.*)")
      if !group.nil?
        @group = group.to_s.gsub(/[=]/, '').strip
      elsif !line.strip.empty?
        pieces = line.split(',', 3)
        part = Part.new({:name => pieces[0].strip, :group => @group, :html_class => pieces[1].strip, :html_ref_id => pieces[2].strip})
        part.save
      end
    }
  end
  
  def self.get_grouped_parts
    grouped_parts = {}
    Part.select('DISTINCT `group`').each do |row|
      grouped_parts[row.group] = Part.where('`group` = ?', [row.group]).all
    end
    grouped_parts.sort
  end
  
end
