SHELL=/bin/bash -O extglob -c

.PHONY: activate_env docker

# activate pipenv
activate:
	-pipenv shell

# build and run development docker container
docker:
	scripts/docker_build.sh
	scripts/docker_run.sh

# run sphinx documentation
doc:
	echo "Please commit your changes or stash them before running documentation."
	make activate
	-rm -rf docs/build
	cd docs && make clean && make html
	git checkout gh-pages  2>/dev/null || git checkout --orphan gh-pages
	rm -rf !(.git|docs)
	mv docs/build/html/* .
	touch .nojekyll
	rm -rf docs
	git add --all
	git commit -m "Update Documentation"
	git checkout master
