class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :meeting_id
  belongs_to :meeting
end
