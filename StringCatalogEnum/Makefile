NAME=xcstrings-enum-generate

# TODO: get from ENV
EXPORT_PROJECT_ROOT=~/prj/business/quible/quible-ios
# TODO: remove other hard-coded paths

all: debug
	./$(NAME) \
		--xcstrings-path $(EXPORT_PROJECT_ROOT)/Quible/Resources/Localizable.xcstrings \
		--enum-name XcodeString \
		--enum-typealias X \
		--output-filename $(EXPORT_PROJECT_ROOT)/Quible/Const/Generated/XcodeString.swift

debug:
	swift build
	cp ./.build/debug/$(NAME) .

release: clean
	swift build -c release
	cp ./.build/release/$(NAME) .
	cp xcstrings-enum-generate $(EXPORT_PROJECT_ROOT)/utility/

test:
	swift test

clean:
	rm -rf $(NAME)