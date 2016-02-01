class Seeds
	
	def self.add_plan attrs
		plan = Plan.find_or_initialize_by(attrs)

		if plan.new_record? && plan.save
			puts "#{plan.name}"
		end	

	end

end