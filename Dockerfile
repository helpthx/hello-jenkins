FROM python:3.6
MAINTAINER Qubo Tecnologia

ENV PYTHONUNBUFFERED 1
ENV TZ=UTC
RUN apt-get clean && apt-get update && apt-get -y install cron && apt-get install nano

RUN mkdir /hello-jenkins-python
WORKDIR /hello-jenkins-python
COPY . /hello-jenkins-python/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000
