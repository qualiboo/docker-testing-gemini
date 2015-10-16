capture:
	gemini --config=/var/work/.gemini.yml gather /var/work/suite/
test:
	gemini --config=/var/work/.gemini.yml test --reporter html --reporter flat /var/work/suite/
version:
	gemini --version
help:
	gemini --help
