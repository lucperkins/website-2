serve:
	hugo server \
		--buildDrafts \
		--buildFuture \
		--disableFastRender \
		--bind 0.0.0.0

serve-production:
	hugo server \
		--disableFastRender \
		--buildFuture \
		--bind 0.0.0.0

production-build:
	hugo --minify \
		--buildFuture

preview-build:
	hugo \
		--buildDrafts \
		--buildFuture \
		--baseURL $(DEPLOY_PRIME_URL) \
		--minify

clean:
	rm -rf public

build:
	hugo

link-checker-setup:
	curl https://raw.githubusercontent.com/wjdp/htmltest/master/godownloader.sh | bash

run-link-checker:
	bin/htmltest

check-internal-links: clean build link-checker-setup run-link-checker

check-all-links: clean build link-checker-setup
	bin/htmltest --conf .htmltest.external.yml
