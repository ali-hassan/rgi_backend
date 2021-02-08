# frozen_string_literal: true

class GraphType < EnumerateIt::Base
  associate_values(
    performance: 'Performance gap between law and practice',
    direction: 'Direction of travel on key resource governance questions between 2012 and 2016',
    population: 'Population, resource dependence and governance'
  )
end
