class TaskSerializer < ActiveModel::Serializer
  attributes :id, :body, :taskable_type, :taskable_id, :created_at
  has_many :tasks
end
