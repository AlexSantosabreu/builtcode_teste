class Patient < ApplicationRecord
  validates_presence_of :cpf, :name, :birth_date
  validate :validates_as_cpf

  with_options :allow_blank => true do |v|
    v.validates_length_of :cpf, :is => 11
    v.validates_numericality_of :cpf
    v.validates_uniqueness_of :cpf
  end


  DENY_LIST = %w[
    00000000000
    11111111111
    22222222222
    33333333333
    44444444444
    55555555555
    66666666666
    77777777777
    88888888888
    99999999999
    12345678909
    01234567890
  ].freeze

  SIZE_VALIDATION = /^[0-9]{11}$/

  def validates_as_cpf

    errors.add(:cpf, "is cpf invalid") if DENY_LIST.include?(self.cpf)

  end


end
