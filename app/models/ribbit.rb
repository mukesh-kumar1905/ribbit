class Ribbit < ActiveRecord::Base
	default_scope {order("created_at DESC")}
	validate :content ,length: { maximum: 140}

end
