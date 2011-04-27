class Status < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
	  def shorten
    self.id.alphadecimal
 end

def self.find_by_shortened(shortened)
  find(shortened.alphadecimal)
  end
end
