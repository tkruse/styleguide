## Makes asciidoc for all guides.
## Requires
## * pandoc ( >= 1.13)
## * xsltproc

.PHONY: default
default: all

.PHONY: all
all: Rguide.asciidoc javaguide.asciidoc angularjs-google-style.asciidoc \
cppguide.asciidoc htmlcssguide.asciidoc javaguide.asciidoc \
javascriptguide.asciidoc jsoncstyleguide.asciidoc lispguide.asciidoc \
objcguide.asciidoc pyguide.asciidoc shell.asciidoc vimscriptfull.asciidoc \
vimscriptguide.asciidoc xmlstyle.asciidoc

.PHONY: git-init
git-init:
	git svn init http://google-styleguide.googlecode.com/svn/trunk

.PHONY: git-fetch
git-fetch:
	git svn fetch


# specific files
cppguide.asciidoc: cppguide.html
# fix C++ breaking asciidoc
	sed -e 's,C++,{cpp},g' cppguide.html > cppguide.html.tmp
# fix bad table parsing pandoc bug
	sed -e 's/<tbody>//g' cppguide.html.tmp > cppguide.html.tmp2 && mv cppguide.html.tmp2 cppguide.html.tmp
	sed -e 's,</tbody>,,g' cppguide.html.tmp > cppguide.html.tmp2 && mv cppguide.html.tmp2 cppguide.html.tmp

	pandoc -f html -t asciidoc cppguide.html.tmp >> $@

	rm cppguide.html.tmp
#  fix css classes breaking asciidoc
	sed -e 's/code,badcode//g' cppguide.asciidoc > cppguide.asciidoc.tmp && mv cppguide.asciidoc.tmp cppguide.asciidoc
# fix escaped cpp macro
	sed -e 's/\\{cpp}/{cpp}/g' cppguide.asciidoc > cppguide.asciidoc.tmp && mv cppguide.asciidoc.tmp cppguide.asciidoc
# fix bad list items pandoc bug
	perl -p -e 's/^\*\n/* /' cppguide.asciidoc  > cppguide.asciidoc.tmp && mv cppguide.asciidoc.tmp cppguide.asciidoc



shell.asciidoc: shell.xml
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl shell.xml > shell.html

	pandoc -f html -t asciidoc shell.html >> $@

	rm shell.html
	sed -e 's/code,badcode//g' shell.asciidoc > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' shell.asciidoc  > shell.asciidoc.tmp && mv shell.asciidoc.tmp shell.asciidoc


lispguide.asciidoc: lispguide.xml
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl lispguide.xml > lispguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' lispguide.html > lispguide.html.tmp && mv lispguide.html.tmp lispguide.html
	sed -e 's,</th,</td,g' lispguide.html > lispguide.html.tmp && mv lispguide.html.tmp lispguide.html

	pandoc -f html -t asciidoc lispguide.html >> $@

	rm lispguide.html
#  fix css classes breaking asciidoc
	sed -e 's/code,badcode//g' lispguide.asciidoc > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' lispguide.asciidoc  > lispguide.asciidoc.tmp && mv lispguide.asciidoc.tmp lispguide.asciidoc


objcguide.asciidoc: objcguide.xml
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl objcguide.xml > objcguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' objcguide.html > objcguide.html.tmp && mv objcguide.html.tmp objcguide.html
	sed -e 's,</th,</td,g' objcguide.html > objcguide.html.tmp && mv objcguide.html.tmp objcguide.html

	pandoc -f html -t asciidoc objcguide.html >> $@

	rm objcguide.html
#  fix css classes breaking asciidoc
	sed -e 's/code,badcode//g' objcguide.asciidoc > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' objcguide.asciidoc  > objcguide.asciidoc.tmp && mv objcguide.asciidoc.tmp objcguide.asciidoc

htmlcssguide.asciidoc: htmlcssguide.xml
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl htmlcssguide.xml > htmlcssguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' htmlcssguide.html > htmlcssguide.html.tmp && mv htmlcssguide.html.tmp htmlcssguide.html
	sed -e 's,</th,</td,g' htmlcssguide.html > htmlcssguide.html.tmp && mv htmlcssguide.html.tmp htmlcssguide.html

	pandoc -f html -t asciidoc htmlcssguide.html >> $@

#	rm htmlcssguide.html
#  fix css classes breaking asciidoc
	sed -e 's/code,badcode//g' htmlcssguide.asciidoc > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' htmlcssguide.asciidoc  > htmlcssguide.asciidoc.tmp && mv htmlcssguide.asciidoc.tmp htmlcssguide.asciidoc


vimscriptfull.asciidoc: vimscriptfull.xml
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl vimscriptfull.xml > vimscriptfull.html
# fix table parsing bug
	sed -e 's/<th/<td/g' vimscriptfull.html > vimscriptfull.html.tmp && mv vimscriptfull.html.tmp vimscriptfull.html
	sed -e 's,</th,</td,g' vimscriptfull.html > vimscriptfull.html.tmp && mv vimscriptfull.html.tmp vimscriptfull.html

	pandoc -f html -t asciidoc vimscriptfull.html >> $@

	rm vimscriptfull.html
#  fix css classes breaking asciidoc
	sed -e 's/code,badcode//g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
## fix block within list ('+' artifact remains after block)
	sed -e 's/\*\* --/--/g' vimscriptfull.asciidoc > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' vimscriptfull.asciidoc  > vimscriptfull.asciidoc.tmp && mv vimscriptfull.asciidoc.tmp vimscriptfull.asciidoc


vimscriptguide.asciidoc: vimscriptguide.xml
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl vimscriptguide.xml > vimscriptguide.html
# fix table parsing bug
	sed -e 's/<th/<td/g' vimscriptguide.html > vimscriptguide.html.tmp && mv vimscriptguide.html.tmp vimscriptguide.html
	sed -e 's,</th,</td,g' vimscriptguide.html > vimscriptguide.html.tmp && mv vimscriptguide.html.tmp vimscriptguide.html

	pandoc -f html -t asciidoc vimscriptguide.html >> $@

	rm vimscriptguide.html
#  fix css classes breaking asciidoc
	sed -e 's/code,badcode//g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
## fix block within list ('+' artifact remains after block)
	sed -e 's/\*\* --/--/g' vimscriptguide.asciidoc > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc
# Fix missing empty line before list
	perl -p -e 's/^\*/\n*/' vimscriptguide.asciidoc  > vimscriptguide.asciidoc.tmp && mv vimscriptguide.asciidoc.tmp vimscriptguide.asciidoc


javascriptguide.asciidoc: javascriptguide.xml
# fix CUSTOM XSL TAGS
	xsltproc styleguide.xsl javascriptguide.xml > javascriptguide.html

	pandoc -f html -t asciidoc javascriptguide.html >> $@

#	rm javascriptguide.html
	sed -e 's/code,badcode//g' javascriptguide.asciidoc > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc
# Fix missing empty line before list
#	perl -p -e 's/^\*/\n*/' javascriptguide.asciidoc  > javascriptguide.asciidoc.tmp && mv javascriptguide.asciidoc.tmp javascriptguide.asciidoc


angularjs-google-style.asciidoc: angularjs-google-style.html
	pandoc -f html -t asciidoc angularjs-google-style.html >> $@

	sed -e 's/code,prettyprint,lang-js//g' angularjs-google-style.asciidoc > angularjs-google-style.asciidoc.tmp && mv angularjs-google-style.asciidoc.tmp angularjs-google-style.asciidoc
	sed -e 's/code,prettyprint//g' angularjs-google-style.asciidoc > angularjs-google-style.asciidoc.tmp && mv angularjs-google-style.asciidoc.tmp angularjs-google-style.asciidoc


xmlstyle.asciidoc: xmlstyle.html

	sed -e 's,C++,{cpp},g' xmlstyle.html > xmlstyle.html.tmp
# fix missing newlines
	sed -e 's/<br>/\n/g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp
	sed -e 's,&nbsp;,\n,g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp
	sed -e 's,\(<h[0-9]>\)*[0-9]*\. ,\1,g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp
	sed -e 's,>_,,g' xmlstyle.html.tmp > xmlstyle.html.tmp2 && mv xmlstyle.html.tmp2 xmlstyle.html.tmp

	pandoc -f html -t asciidoc xmlstyle.html.tmp >> xmlstyle.asciidoc

	rm xmlstyle.html.tmp

	sed -e 's/code,badcode//g' xmlstyle.asciidoc > xmlstyle.asciidoc.tmp && mv xmlstyle.asciidoc.tmp xmlstyle.asciidoc

# Generic patterns, html favored
%.asciidoc: %.html
	pandoc -f html -t asciidoc $< >> $@
	sed -e 's/code,badcode//g' $@ > $@.tmp && mv $@.tmp $@

%.asciidoc: %.xml
	pandoc -f html -t asciidoc $< >> $@
	sed -e 's/code,badcode//g' $@ > $@.tmp && mv $@.tmp $@


.PHONY: clean
clean:
	rm *.asciidoc
