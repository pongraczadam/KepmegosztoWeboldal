class Image < ApplicationRecord
    has_many :Favourite, dependent: :destroy
    has_many :Comment, dependent: :destroy
    has_many :Tag, dependent: :destroy

    def Image.save_file(file, user_id)
        return if file.nil?
        return if !(file.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/)
        dir = Rails.root.join('public', 'data')
        unless File.exists? dir
            Dir.mkdir dir
        end

        image = Image.create path: '', mime: file.content_type, user_id: user_id
        path = File.join(dir, image.id.to_s)
        File.open(path, 'wb') do |f| f.write(file.read) end
        image.update path: path
        image
    end

    def Image.get_image_page(page)
        Image.all.order(created_at: :asc).paginate(page: page, per_page: 10)
    end
end
