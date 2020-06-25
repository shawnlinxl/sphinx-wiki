#!/bin/bash
docker run --rm -v $(pwd):/sphinx-wiki -i -t -d sphinx-wiki /bin/bash
