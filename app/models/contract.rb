# Brief

class Contract < Subject
  jsonb_accessor :type_properties,
    one: :string,
    two: :string

  def self.subtypes
    %w()
  end

  def self.jsonb_attributes
    jsonb_store_key_mapping_for_type_properties.map{|j| j[0].to_sym}
  end

  def icon
    'file'
  end
end