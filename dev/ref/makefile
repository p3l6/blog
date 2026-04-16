# Builds a dash docset from markdown files in this directory
# https://kapeli.com/docsets#dashDocset

# todo:
# - mermaid
# - new github alert quote callouts
# - latex math
# - https://kapeli.com/docsets#settingindexpage
# - https://kapeli.com/docsets#addingicon


DOCSET_NAME=.util/tmp/Reference

MD=$(wildcard *.md)
HTML=$(MD:%.md=$(DOCSET_NAME).docset/Contents/Resources/Documents/%.html)

all: $(DOCSET_NAME).docset.zip
.phony: all

$(DOCSET_NAME).docset.zip: $(DOCSET_NAME).docset/Contents/Info.plist .util/tmp/github-markdown.css $(HTML) $(DOCSET_NAME).docset/Contents/Resources/docSet.dsidx
	zip -r $@ $(DOCSET_NAME).docset/

.util/tmp/dbload.sql: $(HTML)
	mkdir -p .util/tmp
	echo '.open $(DOCSET_NAME).docset/Contents/Resources/docSet.dsidx' > $@
	echo 'DROP TABLE IF EXISTS searchIndex;' >> $@
	echo 'CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);' >> $@
	echo 'CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);' >> $@

	for f in $(HTML) ; do \
		name=$$(basename $$f) ; \
		sed -nE 's|<h. id="([^"]*)"[^>]*>([^<]*) +<!-- *([^ ]*) *--><.h.>|INSERT OR IGNORE INTO searchIndex(name, type, path) VALUES ('"'\2', '\3', '$$name#\1');|p" $$f >> $@ ; \
	done

$(DOCSET_NAME).docset/Contents/Resources/docSet.dsidx: .util/tmp/dbload.sql
	mkdir -p $(DOCSET_NAME).docset/Contents/Resources
	rm -rf $(DOCSET_NAME).docset/Contents/Resources/optimizedIndex.dsidx
	sqlite3 < $^

$(DOCSET_NAME).docset/Contents/Resources/Documents/%.html: %.md
	mkdir -p $(DOCSET_NAME).docset/Contents/Resources/Documents
	pandoc --standalone --template=.util/scripts/template \
		--embed-resource -c .util/tmp/github-markdown.css \
		--lua-filter=.util/scripts/dash-anchor-filter.lua \
		--wrap=preserve \
		-f gfm -t html -o $@ $^

$(DOCSET_NAME).docset/Contents/Info.plist: .util/scripts/Info.plist
	mkdir -p $(DOCSET_NAME).docset/Contents
	sed s|__DOCSET_NAME__|$(DOCSET_NAME)| $^ > $@

.util/tmp/github-markdown.css:
	mkdir -p .util/tmp
	curl "https://raw.githubusercontent.com/sindresorhus/github-markdown-css/gh-pages/github-markdown.css" > $@

clean:
	rm -rf $(DOCSET_NAME).docset
	rm -rf .util/tmp
