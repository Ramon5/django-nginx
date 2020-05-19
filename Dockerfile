FROM python:3.7-alpine

LABEL manteiner="uaicom tecnologies"

ENV PYTHONBUFFERED 1
ENV SECRET_KEY ^efn8quf@f1v-^x^5cre5*pyv37j)ryx5-gib*p@xd5w4v-tic
ENV DB_HOST db


RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev nginx

RUN mkdir -p /code/static

WORKDIR /code
COPY requirements.txt /code/
COPY . /code/

RUN pip install --upgrade pip
RUN pip install -U pip setuptools
RUN pip install -r requirements.txt

RUN rm /etc/nginx/conf.d/default.conf

RUN python manage.py collectstatic --noinput

EXPOSE 8000
