FROM python:3.11-bullseye

WORKDIR  /usr/src/app

RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt
COPY . /usr/src/app/

CMD [ "gunicorn", "-b", "0.0.0.0:8000", "--threads", "10",  "app_wsgi:app" ]

