class Letter < ApplicationRecord
  set_token({ attribute: 'security_token' })
end
