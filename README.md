# Build files for Hext's project website

[![Creative Commons License](https://i.creativecommons.org/l/by-nc/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc/4.0/) This work is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/) unless noted otherwise. See the section 'Licensing' of this readme.

These are the build files for Hext's project page [hext.thomastrapp.com](https://hext.thomastrapp.com/) and its mirror on [html-extract.github.io](https://html-extract.github.io/). Builds are published in the repository [html-extract/html-extract.github.io](https://github.com/html-extract/html-extract.github.io/).


## Build instructions

**Dependencies**: git, jekyll, doxygen, uglifyjs, cleancss

```
# optional: refresh the libhext C++ library documentation
# from Github's master branch
./scripts/refresh-libhext-documentation.sh jekyll/

# optional: minify and combine js and css assets
./scripts/minimize-js-css.sh jekyll/

# create new build located in jekyll/_site
cd jekyll/
jekyll build
```

To switch to non-minified/non-combined assets, edit `jekyll/_config.yml` and add or uncomment the option `environment: development`.


## Licensing
This project includes work authored by third parties.

* [Ace](https://ace.c9.io/) — Used as the code editor in the
  "[Try Hext in your Browser!](https://hext.thomastrapp.com)" section and as a
  highlighter for all code examples.
	[BSD License](https://github.com/ajaxorg/ace/blob/master/LICENSE).
* [Semantic UI](https://semantic-ui.com/) — Used as a CSS framework.
	[MIT License](https://github.com/Semantic-Org/Semantic-UI/blob/master/LICENSE.md).
* [jQuery](https://jquery.org/) — Used as a dependency by Semantic UI.
	[MIT License](https://jquery.org/license/).
* [Google Fonts](https://fonts.google.com/) — The font [Lato](https://fonts.google.com/specimen/Lato) is embedded in this project.
	[Open Font License](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL_web).
* [ReconnectingWebSocket](https://github.com/joewalnes/reconnecting-websocket) — Automatically reconnects to the websocket server at `hextws.thomastrapp.com:8080` if the connection is lost.
	[MIT License](https://github.com/joewalnes/reconnecting-websocket/blob/master/LICENSE.txt).

The parts that were authored by me are licensed under the [Creative Commons Attribution-NonCommercial 4.0 International License](https://creativecommons.org/licenses/by-nc/4.0/).

If the CC-BY-NC-4.0 license is too restrictive for your purposes, [contact me](https://thomastrapp.com/), and we'll work something out.

