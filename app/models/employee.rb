class Employee < ApplicationRecord
  paginates_per 5

  validates :name, :cpf, :birthdate, :personal_phone,
            :salary, :social_security_discount, presence: true

  validates :personal_phone, phone: true
  validates :reference_phone, phone: true, if: -> { reference_phone.present? }
  validate :validate_cpf_format

  def address
    [
      street_name,
      street_number,
      district,
      city,
      state,
      zipcode
    ].join(", ")
  end

  def salary_as_currency
    Money.from_cents(salary, "BRL").format
  end

  def discount_as_currency
    Money.from_cents(social_security_discount, "BRL").format
  end

  private

  def validate_cpf_format
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf)
  end
end
