FROM python:3.9-slim-buster
ENV TZ=America/New_York

RUN mkdir /code
WORKDIR /code

RUN apt-get update -y && \
    apt-get install -y gcc git && \
    pip install requests_aws4auth boto3 flask warrant && \
	git clone https://github.com/akropp/waterguru-api && \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#ADD . /code/
CMD [ "python3.9", "/code/waterguru-api/waterguru_flask.py" ]
