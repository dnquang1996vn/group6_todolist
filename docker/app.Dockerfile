FROM ubuntu:16.04

ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y --no-install-recommends python python-dev python3.5 python3.5-dev python-pip virtualenv libssl-dev libpq-dev git build-essential libfontconfig1 libfontconfig1-dev apt-utils
RUN apt-get -y install nginx
RUN pip install setuptools pip --upgrade --force-reinstall
RUN apt-get install -y python3-pip python3-venv libmysqlclient-dev
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

EXPOSE 22 80 443 5000
CMD ["nginx", "-g", "daemon off;"]