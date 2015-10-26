## Makes asciidoc for all guides.
## Requires
## * pandoc ( >= 1.13)
## * xsltproc

.PHONY: default
default: all

.PHONY: all
all: \
Rguide.asciidoc \
javaguide.asciidoc \
angularjs-google-style.asciidoc \
cppguide.asciidoc \
htmlcssguide.asciidoc \
javascriptguide.asciidoc \
jsoncstyleguide.asciidoc \
lispguide.asciidoc \
objcguide.asciidoc \
pyguide.asciidoc \
shell.asciidoc \
vimscriptfull.asciidoc \
vimscriptguide.asciidoc \
xmlstyle.asciidoc \
Makefile

.PHONY: clean
clean:
	rm -f cppguide.html.tmp
	rm -f shell.html
	rm -f lispguide.html
	rm -f objcguide.html
	rm -f htmlcssguide.html
	rm -f vimscriptfull.html
	rm -f javascriptguide.html
	rm -f *.tmp
	rm -f *.tmp2
	rm -f *.asciidoc


### specific files

cppguide.html.tmp: cppguide.html Makefile
# fix C++ breaking asciidoc
	sed -e 's,C++,{cpp},g' cppguide.html > cppguide.html.tmp
# fix bad table parsing pandoc bug
	sed -e 's/<tbody>//g' cppguide.html.tmp > cppguide.html.tmp2 && mv cppguide.html.tmp2 cppguide.html.tmp
	sed -e 's,</tbody>,,g' cppguide.html.tmp > cppguide.html.tmp2 && mv cppguide.html.tmp2 cppguide.html.tmp


cppguide.asciidoc: cppguide.html.tmp
	pandoc --atx-headers --no-wrap -f html -t asciidoc cppguide.html.tmp > $@

#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' cppguide.asciidoc > cppguide.asciidoc.tmp && mv cppguide.asciidoc.tmp cppguide.asciidoc
# fix escaped cpp macro
	sed -e 's/\\{cpp}/{cpp}/g' cppguide.asciidoc > cppguide.asciidoc.tmp && mv cppguide.asciidoc.tmp cppguide.asciidoc
# fix bad list items pandoc bug
	perl -p -e 's/^\*\n/* /' cppguide.asciidoc  > cppguide.asciidoc.tmp && mv cppguide.asciidoc.tmp cppguide.asciidoc


javaguide.html.tmp: javaguide.html Makefile
# fix bad table parsing pandoc bug
	sed -e 's/<tbody>//g' javaguide.html > javaguide.html.tmp
	sed -e 's,</tbody>,,g' javaguide.html.tmp > javaguide.html.tmp2 && mv javaguide.html.tmp2 javaguide.html.tmp


javaguide.asciidoc: javaguide.html.tmp
	pandoc --atx-headers --no-wrap -f html -t asciidoc javaguide.html.tmp > $@
# remove javaguidelink.png
	sed -e 's/\[image:javaguidelink.png\[image\]\]//g' javaguide.asciidoc > javaguide.asciidoc.tmp && mv javaguide.asciidoc.tmp javaguide.asciidoc
#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,prettyprint,lang-java//g' javaguide.asciidoc > javaguide.asciidoc.tmp && mv javaguide.asciidoc.tmp javaguide.asciidoc
# fix bad list items pandoc bug
	perl -p -e 's/^\*\n/* /' javaguide.asciidoc  > javaguide.asciidoc.tmp && mv javaguide.asciidoc.tmp javaguide.asciidoc
# fix link anchors !! non-standard underscore !!
	sed -e 's|\(.*\) link:#\([0-9a-z.-]*\)|\[\[\2\]\]\n\1|g' javaguide.asciidoc > javaguide.asciidoc.tmp && mv javaguide.asciidoc.tmp javaguide.asciidoc


shell.html: shell.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl shell.xml > shell.html


shell.asciidoc: shell.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc shell.html > $@

	sed -e 's/code,badcode//g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' shell.asciidoc  > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_/]*\)\(\[\)|\1\L\2\E\3|g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc

lispguide.html: lispguide.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl lispguide.xml > lispguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' lispguide.html > lispguide.html.tmp && mv lispguide.html.tmp lispguide.html
	sed -e 's,</th,</td,g' lispguide.html > lispguide.html.tmp && mv lispguide.html.tmp lispguide.html


lispguide.asciidoc: lispguide.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc lispguide.html > $@

#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' lispguide.asciidoc  > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_/.]*\)\(\[\)|\1\L\2\E\3|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z_-]*\)\.\([a-z_/]*\[\)|\1-\2|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/-]*\[\)|\1-\2|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/-]*\[\)|\1-\2|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)--\([a-z_/]*\[\)|\1-\2|g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc



# specific files
pyguide.html.tmp: pyguide.html Makefile
# fix bad table parsing pandoc bug
	sed -e 's/<tbody>//g' pyguide.html > pyguide.html.tmp
	sed -e 's,</tbody>,,g' pyguide.html.tmp > pyguide.html.tmp2 && mv pyguide.html.tmp2 pyguide.html.tmp


pyguide.asciidoc: pyguide.html.tmp
	pandoc --atx-headers --no-wrap -f html -t asciidoc pyguide.html.tmp > $@

#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
# fix escaped py macro
	sed -e 's/\\{py}/{py}/g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
# fix bad list items pandoc bug
	perl -p -e 's/^\*\n/* /' pyguide.asciidoc  > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_/]*\)\(\[\)|\1\L\2\E\3|g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc
# remove toggle lines
	sed -e 's/^.*▶.*$$//g' pyguide.asciidoc > pyguide.asciidoc.tmp && mv pyguide.asciidoc.tmp pyguide.asciidoc


objcguide.html: objcguide.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl objcguide.xml > objcguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' objcguide.html > objcguide.html.tmp && mv objcguide.html.tmp objcguide.html
	sed -e 's,</th,</td,g' objcguide.html > objcguide.html.tmp && mv objcguide.html.tmp objcguide.html


objcguide.asciidoc: objcguide.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc objcguide.html > $@

#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' objcguide.asciidoc  > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's/^.*▶.*$$//g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_/.]*\)\(\[\)|\1\L\2\E\3|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z_]*\)\.\([a-z_/]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/-]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/-]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/-]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)\.\([a-z_/]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)--\([a-z_/]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)--\([a-z_/]*\[\)|\1-\2|g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc


jsoncstyleguide.html: jsoncstyleguide.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl jsoncstyleguide.xml > jsoncstyleguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' jsoncstyleguide.html > jsoncstyleguide.html.tmp && mv jsoncstyleguide.html.tmp jsoncstyleguide.html
	sed -e 's,</th,</td,g' jsoncstyleguide.html > jsoncstyleguide.html.tmp && mv jsoncstyleguide.html.tmp jsoncstyleguide.html


jsoncstyleguide.asciidoc: jsoncstyleguide.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc jsoncstyleguide.html > $@

#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' jsoncstyleguide.asciidoc  > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's/^.*▶.*$$//g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z0-9&%_/.]*\)\(\[\)|\1\L\2\E\3|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
# links with []
	sed -e 's|\(link:#[a-z0-9_.]*\)%5b%5d\([a-z0-9_/.]*\[\)|\1\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\[error.errors\[\]|\[error.errors\[\\\]|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z0-9/_-]*\):\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9/_-]*\)&\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9/_-]*\)\.\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9/_-]*\)\.\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9/_-]*\)\.\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9_-]*\)/\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9_-]*\)/\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9_-]*\)/\([a-z0-9_/.-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)_\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)_\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)_\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)_\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)_\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)\.\([a-z0-9_/]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)_\([a-z0-9_/]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)--\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)--\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
	sed -e 's|\(link:#[a-z0-9-]*\)--\([a-z0-9_/-]*\[\)|\1-\2|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc
# bad anchor
	sed -e 's|_&_|_|g' jsoncstyleguide.asciidoc > jsoncstyleguide.asciidoc.tmp && mv jsoncstyleguide.asciidoc.tmp jsoncstyleguide.asciidoc


htmlcssguide.html: htmlcssguide.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl htmlcssguide.xml > htmlcssguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' htmlcssguide.html > htmlcssguide.html.tmp && mv htmlcssguide.html.tmp htmlcssguide.html
	sed -e 's,</th,</td,g' htmlcssguide.html > htmlcssguide.html.tmp && mv htmlcssguide.html.tmp htmlcssguide.html

htmlcssguide.asciidoc: htmlcssguide.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc htmlcssguide.html > $@

#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' htmlcssguide.asciidoc  > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
	sed -e 's/^.*▶.*$$//g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_/]*\)\(\[\)|\1\L\2\E\3|g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc


vimscriptfull.html: vimscriptfull.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl vimscriptfull.xml > vimscriptfull.html
# fix table parsing bug
	sed -e 's/<th/<td/g' vimscriptfull.html > vimscriptfull.html.tmp && mv vimscriptfull.html.tmp vimscriptfull.html
	sed -e 's,</th,</td,g' vimscriptfull.html > vimscriptfull.html.tmp && mv vimscriptfull.html.tmp vimscriptfull.html


vimscriptfull.asciidoc: vimscriptfull.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc vimscriptfull.html > $@

#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
## fix block within list ('+' artifact remains after block)
	sed -e 's/\*\* --/--/g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' vimscriptfull.asciidoc  > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
	sed -e 's/^.*▶.*$$//g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_./]*\)\(\[\)|\1\L\2\E\3|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z_-]*\)\.\([a-z_/-]*\[\)|\1-\2|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/-]*\[\)|\1-\2|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/-]*\[\)|\1-\2|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/-]*\[\)|\1-\2|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
	sed -e 's|\(link:#[a-z-]*\)--\([a-z_/-]*\[\)|\1-\2|g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc

vimscriptguide.html: vimscriptguide.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl vimscriptguide.xml > vimscriptguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' vimscriptguide.html > vimscriptguide.html.tmp && mv vimscriptguide.html.tmp vimscriptguide.html
	sed -e 's,</th,</td,g' vimscriptguide.html > vimscriptguide.html.tmp && mv vimscriptguide.html.tmp vimscriptguide.html

vimscriptguide.asciidoc: vimscriptguide.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc vimscriptguide.html > $@

	rm vimscriptguide.html
#  fix css classes breaking asciidoc
	sed -e 's/[ ]*code,badcode//g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
## fix block within list ('+' artifact remains after block)
	sed -e 's/\*\* --/--/g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' vimscriptguide.asciidoc  > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
	sed -e 's/^.*▶.*$$//g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_/]*\)\(\[\)|\1\L\2\E\3|g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc

javascriptguide.html: javascriptguide.xml Makefile
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl javascriptguide.xml > javascriptguide.html

javascriptguide.asciidoc: javascriptguide.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc javascriptguide.html > $@

	sed -e 's/code,badcode//g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
# Fix missing empty line before list
#	perl -p -e 's/^\*/\n*/' javascriptguide.asciidoc  > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's/^.*▶.*$$//g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
# lowercase links
	sed -e 's|\(link:#\)\([a-zA-Z_/]*\)\(\[\)|\1\L\2\E\3|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
# slashes and underscores to dashes
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)/\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)_\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)--\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)--\([a-z_/]*\[\)|\1-\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
	sed -e 's|\(link:#[a-z-]*\)-\(\[\)|\1\2|g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc

angularjs-google-style.asciidoc: angularjs-google-style.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc angularjs-google-style.html > $@

	sed -e 's/code,prettyprint,lang-js//g' angularjs-google-style.asciidoc > angularjs-google-style.asciidoc.tmp && mv angularjs-google-style.asciidoc.tmp angularjs-google-style.asciidoc
	sed -e 's/code,prettyprint//g' angularjs-google-style.asciidoc > angularjs-google-style.asciidoc.tmp && mv angularjs-google-style.asciidoc.tmp angularjs-google-style.asciidoc


xmlstyle.html.tmp: xmlstyle.html Makefile

	sed -e 's,C++,{cpp},g' xmlstyle.html > xmlstyle.html.tmp
# fix missing newlines
	sed -e 's/<br>/\n/g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp
	sed -e 's,&nbsp;,\n,g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp
	sed -e 's,\(<h[0-9]>\)*[0-9]*\. ,\1,g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp
	sed -e 's,>_,,g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp


xmlstyle.asciidoc: xmlstyle.html.tmp
	pandoc --atx-headers --no-wrap -f html -t asciidoc xmlstyle.html.tmp > xmlstyle.asciidoc

	sed -e 's/code,badcode//g' xmlstyle.asciidoc > xmlstyle.asciidoc.tmp && mv xmlstyle.asciidoc.tmp xmlstyle.asciidoc


# Generic patterns, html favored
%.asciidoc: %.html
	pandoc --atx-headers --no-wrap -f html -t asciidoc $< > $@
	sed -e 's/code,badcode//g' $@ > $@.tmp && mv $@.tmp $@
	sed -e 's/^.*▶.*$$//g' $@ > $@.tmp && mv $@.tmp $@

%.asciidoc: %.xml
	pandoc --atx-headers --no-wrap -f html -t asciidoc $< > $@
	sed -e 's/code,badcode//g' $@ > $@.tmp && mv $@.tmp $@
	sed -e 's/^.*▶.*$$//g' $@ > $@.tmp && mv $@.tmp $@
