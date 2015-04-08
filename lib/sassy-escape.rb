require "sass"
require "sassy-escape/version"

module Sass::Script::Functions
  # Return a string containing the escaped version of the provided data for
  # use as a CSS identifier
  def escape(data, options = {})
    require "cssesc"
    if data.instance_of? Sass::Script::String
      string = data.value.to_s
      type = data.type
    else
      string = data.to_s
      type = :identifier
    end
    options.each_pair { |k, v| options[k] = v.value }
    escaped_string = CSSEsc.escape(string, options)
    Sass::Script::String.new(escaped_string, type)
  end

  Sass::Script::Functions.declare :escape, [:data], var_kwargs: true
end

module SassyEscape
  VERSION = '0.1.0'
end
