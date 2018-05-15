require "rubygems"

require 'chronic'
require 'tempfile'
require 'sequel'
require 'yaml'
require 'erb'
require 'sequel/extensions/inflector'
require 'octokit'

require_relative  'timetrap/version'
require_relative 'Getopt/Declare'
require_relative 'timetrap/config'
require_relative 'timetrap/helpers'
require_relative 'timetrap/cli'
require_relative 'timetrap/timer'
require_relative 'timetrap/formatters'
require_relative 'timetrap/auto_sheets'
require_relative 'timetrap/github'

module Timetrap
  DB_NAME = defined?(TEST_MODE) ? nil : Timetrap::Config['database_file']
  # connect to database.  This will create one if it doesn't exist
  DB = Sequel.sqlite DB_NAME
  CLI.args = Getopt::Declare.new(<<-EOF)
    #{CLI::USAGE}
  EOF
end

require_relative 'timetrap/models'

