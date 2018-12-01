class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :name, :meeting_id
  belongs_to :meeting
end
