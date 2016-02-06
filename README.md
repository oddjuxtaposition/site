# https://oddjuxtaposition.com

## TL;DR

* `bootup` to start
* `stage` to send to staging
* `deploy` to show the world

## Boot up

Run `bin/bootup` in your project directory to run Bundle, boot up the server, and open the page in your browser.


## LiveReload

We have LiveReload configured.  To use, you need LiveReload from [the App Store](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&ved=0CDIQFjAB&url=https%3A%2F%2Fitunes.apple.com%2Fus%2Fapp%2Flivereload%2Fid482898991%3Fmt%3D12&ei=Am3pUsKgBYaQ2gXeu4DIDQ&usg=AFQjCNE_E57fBZzo9g-Q8Jjy2SBMBQ5n1g&bvm=bv.60157871,d.b2I) as well as the [Chrome browser extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en).

## Stage

Run `bin/stage` to build the site & deploy to the staging environment.

## Deploy

Run `bin/deploy` to build the site & deploy to the production environment.

# Middleman Template with Haml, Sass & Coffeescript

**middleman-hamlsasscoffee** is a [Middleman 3.x](http://middlemanapp.com/) project template with [Compass](http://compass-style.org)/[SASS](http://sass-lang.com/), [HAML](http://haml-lang.com/) and [Coffeescript](http://coffeescript.org). As with all Middleman templates, using [Bundler](http://gembundler.com/) and [Rbenv](https://github.com/sstephenson/rbenv/) is recommended.

###Features###
* Optimized asset structure
* Conditional IE html tags
* Viewport meta setup for iOS and Android
* Favicon and app icons
* Dynamic title attribute body class via YAML front-matter

###Includes###
* Modernizr 2.6.2 via cdnjs.com
* jQuery 2.0.3 via cdnjs.com
* Google Analytics (async)

### Installation ###
 
Clone **middleman-hamlsasscoffee** into `~/.middleman`. You will need to create this directory if it doesn't exist.
```$ git clone git://github.com/pixelsonly/middleman-hamlsasscoffee.git ~/.middleman/middleman-hamlsasscoffee```

Initialize middleman on a new or existing folder `$ middleman init path_to_project --template=middleman-hamlsasscoffee`


For more help follow [Middleman's project template instructions](http://middlemanapp.com/getting-started/welcome/) or feel free to hit me up on [Twitter](http://twitter.com/pixelsonly).

---

##### LICENSE #####

Copyright (c) 2013 Ryan Lindsey

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
