# -*- encoding: UTF-8 -*-

require 'csv'

module Koyomi
  # A base class for named terms (a period of days with a name)
  class NamedTerm
    def initialize(params) #:nodoc:
      @name = params[:name]
      @from = params[:from]
      @to = params[:to]
    end

    # Returns the name of the term.
    attr_reader :name

    # Returns the first date of the term.
    attr_reader :from

    # Returns the last date of the term.
    attr_reader :to

    alias to_s name

    # Iterates over the term.
    def each
      return to_enum unless block_given?
      (from..to).each {|d| yield(d) }
      self
    end

    include Enumerable

    class << self

      # Returns an instance which the given +date+ is in.
      def for_date(date)
        instances.find {|e| e.include?(date) }
      end

      # Public instantiation is forbidden.
      private :new

      def files #:nodoc:
        Dir["#{File.join(File.dirname(__FILE__), '../../data')}/skji20{1[1-9],20}.csv"]
      end
      private :files

      def load_csv #:nodoc:
        files.inject([]) do |days, file|
          CSV.open(file, headers: true, return_headers: false, encoding: 'Windows-31J:UTF-8') do |csv|
            days + csv.map {|row| {from: ::Date.new(*row.values_at('年', '月', '日').map(&:to_i)), name: row['節気(定気)']} }
          end
        end
      end
      private :load_csv

      def instances #:nodoc:
        @instances ||= load_instances
      end
      private :instances
    end
  end
end
