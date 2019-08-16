# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  email      :string
#  phone      :string
#  title      :string
#  company    :string
#  birth_date :date
#  sex        :string(1)
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

require 'action_view'

class Contact < ApplicationRecord

include ActionView::Helpers::DateHelper 

validates :first_name, presence: true
# validate :birth_date_in_the_past, if: -> { birth_date }

belongs_to :user,
    class_name: 'User',
    foreign_key: :user_id

# def age
#     time_ago_in_words(birth_date)
# end 

# private
# def birth_date_in_the_past
#     if birth_date && birth_date > Time.now 
#         errors[:birth_date] << 'must be in the past'
#     end 
# end 

end 
