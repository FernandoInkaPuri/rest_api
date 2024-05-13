class Policy < ApplicationRecord
  belongs_to :segurado
  belongs_to :veiculo
  belongs_to :charge

  enum :status, { pending: 0, active: 1, expired: 2, canceled: 3 }
end
