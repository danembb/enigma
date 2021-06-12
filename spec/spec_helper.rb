require "rspec"
require "simplecov"

SimpleCov.start
SimpleCov.add_filter ["spec"]

require_relative "../lib/enigma"
require_relative "../lib/encrypt"
require_relative "../lib/key"
