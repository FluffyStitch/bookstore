# frozen_string_literal: true

ActiveAdmin.register Book do
  decorate_with BookDecorator

  permit_params :title, :price, :quantity, :description, :year_of_publication, :height, :width, :depth, :materials,
                :category_id, author_ids: []

  index do
    selectable_column
    column :category
    column :title
    column :all_authors
    column :short_description
    column :price
    actions
  end

  show do
    attributes_table do
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
                                      [author.second_name, author.id]
                                    }, as: :check_boxes
    end
    f.actions
  end
end
