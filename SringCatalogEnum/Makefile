NAME=xcstrings-enum-generate

all: debug
	./$(NAME) \
		--xcstrings-path ~/prj/ios/quible/Quible/Resources/Localizable.xcstrings \
		--enum-name XcodeStrings \
		--enum-type-alias X

debug:
	swift build
	cp ./.build/debug/$(NAME) .

release: clean
	swift build -c release
	cp ./.build/release/$(NAME) .

test:
	swift test

clean:
	rm -rf $(NAME)