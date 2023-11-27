NAME=xcstrings-enum-generate

all: debug
	./$(NAME) \
		--xcstrings-path ~/prj/ios/quible/Quible/Resources/Localizable.xcstrings \
		--enum-name XcodeString \
		--enum-typealias X \
		--output-filename ~/prj/ios/quible/Quible/Const/Generated/XcodeString.swift

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

doc:
	./$(NAME) --help > USAGE.md

publish: release doc