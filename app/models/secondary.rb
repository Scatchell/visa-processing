class Secondary
  include Mongoid::Document

  field :name, :type => String
  field :age, :type => String
  field :gender, :type => String

  embedded_in :form
end
