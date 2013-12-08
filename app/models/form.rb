class Form
  include Mongoid::Document
  field :telephone, :type => String
  field :gender, :type => String
  field :full_name, :type => String
  field :date_of_birth, :type => Time
  field :place_of_birth, :type => String
  field :nationality, :type => String
  field :passport_number, :type => String
  field :valid_until, :type => Time
  field :occupation, :type => String
  field :present_address, :type => String
  field :destination_in_sudan, :type => String
  field :period_of_stay, :type => String
  field :purpose_of_visit, :type => String
  field :date_of_arrival, :type => Time
  field :place_of_issue, :type => String
  field :date_of_issue, :type => Time
  field :valid_permit_countries, :type => String

  field :duration_of_previous_stay_in_sudan, :type => String
  field :previous_address_in_sudan, :type => String

  embeds_many :references
  accepts_nested_attributes_for :references
end
