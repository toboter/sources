# Akte

class Folder < Subject
  jsonb_accessor :type_properties,
    title: :string,
    creator: :string,
    year: :string,
    content_count: :string

  def self.subtypes
    %w(Letter)
  end

  def self.jsonb_attributes
    jsonb_store_key_mapping_for_type_properties.map{|j| j[0].to_sym}
  end

  def icon
    'folder'
  end
end