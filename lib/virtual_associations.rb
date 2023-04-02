# frozen_string_literal: true

require 'active_record'

Dir.glob("#{File.dirname(__FILE__)}/**/*.rb").each do |file|
  require file
end

module VirtualAssociations
  class Error < StandardError; end

  def self.preload records, associations
    ActiveRecord::Associations::Preloader.new.preload records, associations
  end
end
