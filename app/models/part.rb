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
  
  # def self.get_grouped_parts
  #   grouped_parts = {}
  #   Part.select('DISTINCT `group`').each do |row|
  #     parts = {}
  #     Part.where('`group` = ?', [row.group]).all.each do |part|
  #       parts[part.select_class] = [] if parts[part.select_class].nil?
  #       parts[part.select_class] << part
  #     end
  #     grouped_parts[row.group] = parts
  #   end
  #   grouped_parts.sort
  # end
  
  def self.get_groups_hash
    groups = {}
    Part.select('DISTINCT `group`').each do |row|
      groups[row.group] = get_subgroups_by_group row.group
    end
    groups
  end
  
  def self.get_subgroups_by_group (group)
    Part.select('DISTINCT subgroup').find_all_by_group(group).map { |row| row.subgroup }
  end
  
  def self.find_by_group_subgroup (group = '', subgroup = '')
    Part.where("`group` = ? AND `subgroup` = ?", group, subgroup).all
  end
  
end
