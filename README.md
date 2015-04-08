Sassy Escape [![Build Status](https://travis-ci.org/borodean/sassy-escape.svg?branch=develop)](https://travis-ci.org/borodean/sassy-escape)
============

A Sass wrapper for [cssesc,](http://github.com/mathiasbynens/cssesc) a JavaScript library [for escaping text for use in CSS strings or identifiers.](http://mathiasbynens.be/notes/css-escapes)

`escape-css($value, $options...)`
-----------------------------------

This function takes a value and returns an escaped version of the value where any characters that are not printable ASCII symbols are escaped using the shortest possible (but valid) [escape sequences for use in CSS strings or identifiers.](http://mathiasbynens.be/notes/css-escapes)

```scss
body::after {
  content: escape-css('Ich ♥ Bücher');
}

// Becomes this:
body::after {
  content: 'Ich \2665  B\FC cher';
}
```

By default, `escape-css` returns a string that can be used as part of a CSS string. If the target is a CSS identifier rather than a CSS string, use the `$is-identifier: true` setting.

```scss
.#{ unquote(escape-css('123a2b', $is-identifier: true)) } {
  color: red;
}

// Becomes this:
.\31 23ab {
  color: red;
}
```

The optional keyword arguments accept the exact options which JavaScript version [cssesc uses](http://github.com/mathiasbynens/cssesc#api) only converted to the `dasherized-case`:

```scss
body::after {
  content: escape-css('123a2b', $escape-everything: true, $quotes: 'single', $wrap: true);
}
```

Installation
------------

```bash
gem install sassy-escape
```

Use with Sass command line
--------------------------

```bash
sass -r sassy-escape --watch sass_dir:css_dir
```

Use with Compass
----------------

Add the following to your Compass configuration:

```ruby
require 'sass-escape'
```
