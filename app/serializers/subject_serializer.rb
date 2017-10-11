class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :slug, :identifier_stable, :identifier_temp, :type, :type_properties, :remarks
end
