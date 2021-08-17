require "shrine"
require "image_processing/mini_magick"

case Rails.env
when 'development'
  require "shrine/storage/file_system"

  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),
  }
when 'production'
  require "shrine/storage/s3"

  s3_options = {
    bucket: Rails.application.credentials.aws[:bucket],
    region: Rails.application.credentials.aws[:region],
    access_key_id: Rails.application.credentials.aws[:access_key_id],
    secret_access_key: Rails.application.credentials.aws[:secret_access_key]
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(**s3_options),
  }
when 'test'
  require 'shrine/storage/memory'

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end

Shrine.plugin :activerecord
Shrine.plugin :default_url
Shrine.plugin :derivatives, create_on_promote: true
Shrine.plugin :determine_mime_type

Shrine::Attacher.default_url do |derivative: nil, **|
  img = case derivative
  when :small then 'small.png'
  when :medium then 'medium.png'
  when :large then 'large.png'
  else 'default.png'
  end
  ActionController::Base.helpers.asset_pack_path("media/images/#{img}")
end
