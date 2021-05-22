module ImagesHelper
    def isFavourite?(user_id, image_id)
        Favourite.where(user_id: user_id, image_id: image_id).count() > 0
    end

    def uploader(user_id)
        User.find_by(id: user_id).name
    end
end
