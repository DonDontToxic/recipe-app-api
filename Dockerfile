FROM python:3.7-alpine
# MAINTAINER FPT dev

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Authentication purpose -> Prevent running on root user
RUN adduser -D user
USER user
