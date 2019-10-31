include ActionController::Serialization

app/serializers/job_serializer.rb
class JobSerializer < ActiveModel::Serializer
  attributes :name, :place, :company_id
end
