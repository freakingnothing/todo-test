class TaskSerializer < ActiveModel::Serializer
  attributes :id, :body, :taskable_type, :taskable_id, :created_at, :tag_list
  has_many :tasks
  has_many :tags
end
