class Subject < ApplicationRecord
  # extend FriendlyId
  searchkick
  include Nabu
  include Enki
  has_closure_tree

  after_commit :reindex_descendants

  validates :type, presence: true

  def self.types
    %w(Archive Collection Folder Letter)
  end

  def ident_name
    self_and_ancestors.reverse.map{ |t| t.identifier_stable }.join(' / ')
  end

  scope :archives, -> { where(type: 'Archive') } 
  scope :collections, -> { where(type: 'Collection') } 
  scope :folders, -> { where(type: 'Folder') }
  scope :letters, -> { where(type: 'Letter') }

  def search_data
    attributes.merge(ancestors: ancestors.map{|a| a})
  end

  def self.sorted_by(sort_option)
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^ident_name_/
      [{ id: direction.to_sym, parent_id: direction.to_sym }]
    when /^created_at_/
      { created_at: direction.to_sym }
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  end
   
  def self.options_for_sorted_by
    [
      ['Ident (a-z)', 'ident_name_asc'],
      ['Ident (z-a)', 'ident_name_desc'],
      ['Created (newest first)', 'created_at_desc'],
      ['Created (oldest first)', 'created_at_asc']
    ]
  end

  def reindex_descendants
    descendants.each do |subject|
      subject.reindex
    end
  end

end
