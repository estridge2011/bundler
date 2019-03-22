# frozen_string_literal: false

module Bundler
  VERSION = "2.1.0.pre.1".freeze

  if ENV["BUNDLE_SPEC_RUN"]
    # We're doing this because we might write tests that deal
    # with other versions of bundler and we are unsure how to
    # handle this better.
    def self.overwrite_loaded_gem_version
      begin
        require "rubygems"
      rescue LoadError
        return
      end
      return unless bundler_spec = Gem.loaded_specs["bundler"]
      return if bundler_spec.version == VERSION
      bundler_spec.version = Bundler::VERSION
    end
    private_class_method :overwrite_loaded_gem_version
    overwrite_loaded_gem_version
  end

  def self.bundler_major_version
    @bundler_major_version ||= VERSION.split(".").first.to_i
  end
end
