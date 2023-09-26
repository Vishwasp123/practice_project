class Employee < ApplicationRecord

	def full_name
		"#{first_name}#{last_name}"
	end

	def self.ransackable_associations(auth_object = nil)
		[]
	end

	def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "employee_id", "first_name", "id", "last_name", "phone_number", "updated_at"]
  end
  
end











