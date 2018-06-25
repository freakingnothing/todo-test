class Task < ApplicationRecord
  include Models::Taggable

  belongs_to :taskable, polymorphic: true
  has_many :tasks, as: :taskable

  def self.tagged_with(name)
    Tag.find_by!(name: name).tasks
  end
end
