class Image < ApplicationRecord
    def Image.save_file(file, user_id)
        return if file.nil?
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
end
