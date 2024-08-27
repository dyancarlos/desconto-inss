class Employee < ApplicationRecord
  paginates_per 5

  monetize :salary_cents, numericality: { greater_than_or_equal_to: 0 }
  monetize :social_security_discount_cents, numericality: { greater_than_or_equal_to: 0 }
  monetize :net_salary_cents, numericality: { greater_than_or_equal_to: 0 }

  validates :name, :cpf, :birthdate, :personal_phone, :salary, :social_security_discount, presence: true
  validates :cpf, uniqueness: true
  validates :personal_phone, phone: true
  validates :reference_phone, phone: true, if: -> { reference_phone.present? }
  validates :state, inclusion: { in: State::AVAILABLE_STATES }, if: -> { state.present? }
  validates :street_number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: -> { street_number.present? }
  validate :validate_cpf_format

  def address
    [
      street_name,
      street_number,
      district,
      city,
      state,
      zipcode
    ].reject(&:blank?).join(", ")
  end

  private

  def validate_cpf_format
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf)
  end
end
