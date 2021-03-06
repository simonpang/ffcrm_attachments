module FfcrmAttachments
  class Engine < ::Rails::Engine

 	config.to_prepare do

		require "polymorphic/attachment"
		require "ffcrm_attachments/attachment_hook"

 		ActiveSupport.on_load(:fat_free_crm_attachment) do

 			ENTITIES.each do |entity| 
	 			entity.constantize.class_eval do

	 				has_many :attachments, :as => :entity
	 				accepts_nested_attributes_for :attachments, :allow_destroy => true

	 			end
 			end

 		end

 	end
  end
end
