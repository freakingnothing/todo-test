module Models
  module Taggable
    extend ActiveSupport::Concern
    included do
      has_many :taggings, as: :taggable, dependent: :destroy
      has_many :tags, through: :taggings
      after_create :create_tagging
    end

    def create_tagging
      Tagging.create(taggable_type: self.class.name, taggable_id: self.id, tag_id: self.tag_id)
    end

    def tag_list
      tags.map(&:name)
    end

    def tag_list=(names)
      self.tags = names.map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
    end
  end
end

