# frozen_string_literal: true

require "spec_helper"
require "database_cleaner"
require "aggregate"

Dir[Pathname.new(__FILE__).join("..", "support", "**", "*")].sort.each do |support_file|
  next if File.directory? support_file

  require support_file
end
