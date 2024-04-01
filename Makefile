BINARY_NAME = todo

.PHONY: all
all: build

.PHONY: build
build:
	go build -o $(BINARY_NAME)

.PHONY: download
download:
	@if [ ! -f ./bin/air ]; then \
		curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s; \
	fi
	@if [ ! -f templ ]; then \
		go install github.com/a-h/templ/cmd/templ@latest; \
	fi

.PHONY: run
run: download
	./bin/air
