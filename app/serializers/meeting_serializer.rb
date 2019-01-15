class MeetingSerializer < ActiveModel::Serializer
  attributes :id , :overview, :company_id, :date, :takeaways
  belongs_to :company
  has_many :comments
end
