class Entry < ApplicationRecord
  extend Enumerize

  enumerize :feeling, in: [:angry, :sad, :confused, :happy]
end
