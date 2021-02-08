# frozen_string_literal: true

class SpecialInstitutionTitle < EnumerateIt::Base
  associate_values(
    first: 'State-owned enterprise governance',
    second: 'Sovereign wealth fund governance'
  )
end
