# -*- encoding: UTF-8 -*-
require 'date'
require 'koyomi/solar_term'

module Koyomi
  module CoreExt
    module Date
      module SolarTerm

        # Returns the solar term(節気) which the date is in.
        def solar_term
          @solar_term ||= ::Koyomi::SolarTerm.for_date(self)
        end

      end
    end
  end
end

class Date
  include ::Koyomi::CoreExt::Date::SolarTerm
end
