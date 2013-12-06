class Reference
  include Mongoid::Document

  field :name, :type => String
  field :telephone, :type => String
  field :address, :type => String

  embedded_in :form
end
