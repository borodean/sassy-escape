# -*- encoding: utf-8 -*-
require "sass"
require "sassy-escape"

describe Sass::Script::Functions do

  def sass(value)
    Sass::Script::Parser.parse(value, 0, 0).perform(Sass::Environment.new).to_s
  end

  describe "#escape" do

    it "escapes strings" do
      expect(sass(%q{escape('Ich ♥ Bücher')}))
        .to eq(%q{"Ich \\\\2665  B\\\\FC cher"})
    end

    it "preverves identifiers" do
      expect(sass("escape(foo)"))
        .to eq("foo")
    end

    it "accepts options" do
      expect(sass(%q{escape('lolwat"foo\'bar', $escape-everything: true)}))
        .to eq(%q{"\\\\6C\\\\6F\\\\6C\\\\77\\\\61\\\\74\\\\\\"\\\\66\\\\6F\\\\6F\\\\'\\\\62\\\\61\\\\72"})
    end

    it "accepts falsy options" do
      expect(sass(%q{escape('lolwat"foo\'bar', $escape-everything: false)}))
        .to eq(%q{"lolwat\"foo\\\\'bar"})
    end

    it "escape numbers" do
      expect(sass("escape(10px, $is-identifier: true)"))
        .to eq("\\31 0px")
    end

    it "properly unquotes" do
      expect(sass("unquote(escape('+1', $is-identifier: true))"))
        .to eq("\\+1")
    end

  end
end
