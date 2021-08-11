# frozen_string_literal: true

class AddressForm < Reform::Form
  include Reform::Form::ActiveRecord

  LENGTH = {
    first_name: 50,
    last_name: 50,
    address: 50,
    city: 50,
    country: 50,
    zip: 10,
    phone: 15
  }.freeze

  REGEX = {
    letters: /\A[A-Za-z]+\z/,
    address: /\A[A-Za-z0-9\s,\-]+\z/,
    zip: /\A[0-9\-]+\z/,
    phone: /\A\+[0-9]{1,3}\s?[0-9]{2}\s?[0-9]{3}\s?[0-9]{4}\z/
  }.freeze

  property :first_name
  property :last_name
  property :address
  property :city
  property :zip
  property :country
  property :phone
  property :type

  validates :first_name, presence: true, length: { maximum: LENGTH[:first_name] }, format: { with: REGEX[:letters] }
  validates :last_name, presence: true, length: { maximum: LENGTH[:last_name] }, format: { with: REGEX[:letters] }
  validates :address, presence: true, length: { maximum: LENGTH[:address] }, format: { with: REGEX[:address] }
  validates :city, presence: true, length: { maximum: LENGTH[:city] }, format: { with: REGEX[:letters] }
  validates :zip, presence: true, length: { maximum: LENGTH[:zip] }, format: { with: REGEX[:zip] }
  validates :country, presence: true, length: { maximum: LENGTH[:country] }, format: { with: REGEX[:letters] }
  validates :phone, presence: true, length: { maximum: LENGTH[:phone] }, format: { with: REGEX[:phone] }
  validates :type, presence: true
  validate :valid_country
  validate :valid_phone
  validate :valid_type

  private

  def valid_country
    return if ISO3166::Country.find_country_by_alpha2(country).present?

    errors.add(:country, :invalid)
  end

  def valid_phone
    selected_country = ISO3166::Country.find_country_by_alpha2(country)
    return if selected_country.present? && phone.include?("+#{selected_country.country_code}")

    errors.add(:phone, :invalid)
  end

  def valid_type
    return if [I18n.t('address_class.billing'), I18n.t('address_class.shipping')].include?(type)

    errors.add(:type, :invalid)
  end
end
