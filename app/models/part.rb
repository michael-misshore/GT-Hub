class Part < ActiveRecord::Base
  has_and_belongs_to_many :tunes
  
  scope :ordered, order("name ASC")
    
  def self.import
    Part.delete_all
    
    @group = ''
    @subgroup = ''
    IO.foreach("import_data/parts.txt") {|line|
      if line.match("===(.*)")
        @subgroup = line.match("===(.*)").to_s.gsub(/[=]/, '').strip
      elsif line.match("==(.*)")
        @group = line.match("==(.*)").to_s.gsub(/[=]/, '').strip
        @subgroup = ''
      elsif !line.strip.empty?
        pieces = line.split(',', 3)
        part = Part.new({:name => pieces[0].strip, :group => @group, :subgroup => @subgroup, :select_class => pieces[1].strip, :settings_div_id => pieces[2].strip})
        part.save
      end
    }
  end

  def self.get_groups_hash
    groups = {}
    all.group_by(&:group).each do |group, parts|
      subgroups = {}
      parts.group_by(&:subgroup).each do |subgroup, parts|
        subgroups[subgroup] = parts.group_by(&:select_class)
      end
      groups[group] = subgroups
    end
    groups
  end
end
