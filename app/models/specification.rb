class Specification < ApplicationRecord
    class Specification < ApplicationRecord
  validates :title, :description, :client_email, :token, :token_expiry, presence: true
  # Autres validations possibles
end

end
