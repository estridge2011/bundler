# frozen_string_literal: false

# Ruby 1.9.3 and old RubyGems don't play nice with frozen version strings
# rubocop:disable MutableConstant

module Bundler
  VERSION = "2.1.0.pre.1"

  def self.bundler_major_version
    @bundler_major_version ||= VERSION.split(".").first.to_i
  end
end
