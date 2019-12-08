class Entry < ApplicationRecord
  extend Enumerize

  belongs_to :user

  enumerize :feeling, in: { angry: 0, sad: 1, confused: 2, happy: 3 }
end
