# Archiv

class Archive < Subject
  jsonb_accessor :type_properties,
    title: :string,
    holder: :string

  def self.subtypes
    %w(Collection Folder Letter)
  end

  def self.jsonb_attributes
    # self.attribute_names
    jsonb_store_key_mapping_for_type_properties.map{|j| j[0].to_sym}
  end

  def icon
    'institution'
  end

end