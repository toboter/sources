# Bestand

class Collection < Subject
  jsonb_accessor :type_properties,
    title: :string

  def self.subtypes
    %w(Folder Letter)
  end

  def self.jsonb_attributes
    jsonb_store_key_mapping_for_type_properties.map{|j| j[0].to_sym}
  end

  def icon
    'archive'
  end
end