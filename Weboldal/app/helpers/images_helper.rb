module ImagesHelper
    def isFavourite?(user_id, image_id)
        Favourite.where(user_id: user_id, image_id: image_id).count() > 0
    end
end
