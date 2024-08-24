class Employee < ApplicationRecord
  validates :name, :cpf, :birthdate, :personal_phone,
            :salary, :social_security_discount, presence: true

  validates :personal_phone, phone: true
  validates :reference_phone, phone: true, if: -> { reference_phone.present? }
  validate :validate_cpf_format

  private

  def validate_cpf_format
    errors.add(:cpf, :invalid) unless CPF.valid?(cpf)
  end
end
