class Entry < ApplicationRecord
  enum feeling: [:angry, :sad, :confused, :happy]
end
