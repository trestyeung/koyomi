# -*- encoding: UTF-8 -*-

require 'koyomi/named_term'

module Koyomi
  # A class that represents the solar term(節気).
  # See http://en.wikipedia.org/wiki/Solar_term for detail.
  #
  # This class supports years from 2011 to 2019.
  class SolarTerm < NamedTerm

    class << self

      def load_instances #:nodoc:
        params_list = load_csv
        params_list.reject!{|e|/土用入\z/ =~ e[:name]}
        params_list.each_cons(2).map {|e| e[0][:to] = e[1][:from] - 1; new(e[0]) }
      end
    end
  end
end