BROWSERIFY = ./node_modules/.bin/browserify
UGLIFY = ./node_modules/.bin/uglifyjs
TRANSFORM_SWITCH = -t [ babelify --presets [ es2015 ] ]

run:
	./node_modules/.bin/electron .
	#wzrd app.js:index.js -- \
	#	-d \
	#	$(TRANSFORM_SWITCH)

build:
	$(BROWSERIFY) $(TRANSFORM_SWITCH) app.js | $(UGLIFY) -c -m -o index.js

test:
	node tests/calculate-completion-tests.js
	node tests/extract-dates-tests.js

pushall:
	git push origin gh-pages

prettier:
	prettier --single-quote --write "**/*.js"
