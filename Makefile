APP := autotag

include scripts/make/common.mk
include scripts/make/common-go.mk

build::
	CGO_ENABLED=0 go build -o $(APP)/$(APP)  $(APP)/*.go

snapshot:
	@goreleaser --rm-dist --snapshot --debug

.PHONY:: test-gha
test-gha:: test-go test-coveralls ## for running unit tests on GitHub Actions

# change
