class Quote < ActiveRecord::Base
	validates_presence_of :studentid, :name, :email, :content
end
