class Status < ActiveRecord::Base
attr_accessible :email, :author, :message
validates :message, :presence => true
validates :author, :presence => true
validates :email, :presence => true
  
  default_scope :order => 'created_at DESC'
  
	  def shorten
    self.id.alphadecimal
 end

def self.find_by_shortened(shortened)
  find(shortened.alphadecimal)
  end
end
