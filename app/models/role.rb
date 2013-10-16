class Role < ActiveRecord::Base
   attr_accessible :name, :description
   validates_presence_of :name, :on => :create
   validates_presence_of :description, :on => :create

   has_and_belongs_to_many :users
end
