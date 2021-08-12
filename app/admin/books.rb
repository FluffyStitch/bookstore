# frozen_string_literal: true

ActiveAdmin.register Book do
  decorate_with BookDecorator
  includes :authors, :category
  permit_params :title, :price, :quantity, :description, :year_of_publication, :height, :width, :depth, :materials,
                :category_id, :main_image, author_ids: [], images_attributes: %i[id image _destroy]

  index do
    selectable_column
    column :main_image do |book|
      image_tag book.main_image_url(:small)
    end
    column :category
    column :title
    column :all_authors
    column :short_description
    column :price
    actions
  end

  show do
    attributes_table do
      row :main_image do |book|
        image_tag book.main_image_url(:medium)
      end
      row :images do |book|
        book.images.map do |img|
          image_tag img.image_url(:small)
        end
      end
      row :title
      row :price
      row :category
      row :authors, &:all_authors
      row :description
      row :year_of_publication
      row :height
      row :width
      row :depth
      row :materials
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :category
      f.input :title
      f.input :price
      f.input :quantity
      f.input :description
      f.input :year_of_publication
      f.input :height
      f.input :width
      f.input :depth
      f.input :materials
      f.input :authors, collection: Author.all.map { |author|
                                      ["#{author.first_name} #{author.second_name}",
                                       author.id]
                                    }, as: :check_boxes
      f.input :main_image, as: :file
      f.inputs do
        f.has_many :images, allow_destroy: true do |a|
          a.input :image, as: :file
        end
      end
    end
    f.actions
  end
end
