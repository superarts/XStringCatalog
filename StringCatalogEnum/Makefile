NAME=xcstrings-enum-generate
FILENAME_USAGE=USAGE.md
BUILD_PATH=./.build/apple/Products/Release/

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
	swift build -c release --arch x86_64 --arch arm64
	cp $(BUILD_PATH)/$(NAME) .
	cp xcstrings-enum-generate $(EXPORT_PROJECT_ROOT)/utility/

test:
	swift test

clean:
	rm -rf $(NAME)

doc:
	echo "# USAGE" > $(FILENAME_USAGE)
	echo >> $(FILENAME_USAGE)
	echo '```console' >> $(FILENAME_USAGE)
	./$(NAME) --help >> $(FILENAME_USAGE)
	echo '```' >> $(FILENAME_USAGE)

publish: release doc