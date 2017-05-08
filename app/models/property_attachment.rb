class PropertyAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	mount_uploader :small_avatar, SmallAvatarUploader
   belongs_to :property
end
