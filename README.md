## What's this?
[![NPM version](https://badge.fury.io/js/aspax-jade-handler.png)](http://badge.fury.io/js/aspax-jade-handler)
[![Dependency Status](https://david-dm.org/icflorescu/aspax-jade-handler.png)](https://david-dm.org/icflorescu/aspax-jade-handler)

A plugin that enables [ASPAX](http://aspax.github.io) to handle [Jade](http://jade-lang.com) files.

## Installation
Type this in the folder where you're running ASPAX:

    npm install aspax-jade-handler

If you're running ASPAX in a Node.js application root folder, consider using the `--save-dev` option to avoid deploying this plugin to your production environment:

    npm install aspax-jade-handler --save-dev

## Usage
Simply add `.jade` source files in `aspax.yml`:

    app.js:
      - lib.js
      - template-1.jade
      - template-2.jade

From each Jade source file, the plugin will create a precompiled template function in the global `JST` namespace, i.e.:

- `template-1.jade` -> JST['template-1'] = function(...) { ... }
- `template-2.jade` -> JST['template-2'] = function(...) { ... }

You can use the precompiled templates in your client-side scripts like this:

    $('h1').html(JST['template-1']({
      id: 1,
      name: 'John Doe'
    }));

## What about watching for included files?
This plugin is smart enough to recursively scan for `include` statements and automatically trigger ASPAX to rebuild the parent asset if one of the files in your import tree changes.

## Endorsing the author
If you find this piece of software useful, please [tweet about ASPAX](http://twitter.com/share?text=Checkout%20ASPAX%2C%20the%20simple%20Node.js%20asset%20packager!&url=http%3A%2F%2Faspax.github.io&hashtags=aspax&via=icflorescu) and endorse me on LinkedIn:

[![Ionut-Cristian Florescu on LinkedIn](https://static.licdn.com/scds/common/u/img/webpromo/btn_viewmy_160x25.png)](https://www.linkedin.com/in/icflorescu)
