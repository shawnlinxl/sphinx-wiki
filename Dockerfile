FROM python:3.8

LABEL maintainer="shawn.lin@gatech.edu"

ADD Pipfile /sphinx-wiki/
ADD Pipfile.lock /sphinx-wiki/
WORKDIR /sphinx-wiki
RUN cat Pipfile
RUN pip install pipenv \
  && pipenv install --deploy --ignore-pipfile --dev

CMD [ "/bin/bash" ]
