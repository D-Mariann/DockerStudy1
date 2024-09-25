FROM python:3.11-alpine3.20
# FROM python:3.11

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.20/main" >> /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/v3.20/community" >> /etc/apk/repositories

# RUN apk update
# RUN apk add --update --no-cache g++ chromium chromium-chromedriver

RUN apk update
RUN apk add chromium chromium-chromedriver
RUN apk add libffi-dev

WORKDIR /pythonProjectDocker

COPY requirements.txt .
RUN pip install --upgrade pip
# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -r requirements.txt


COPY . .

# CMD pytest -s -v tests/*
# CMD ['pytest', '-s', '-v', 'tests/*']
# CMD ['pytest', '-s -v', 'tests/*']

CMD pytest --driver Chrome --driver-path \driver\chromedriver.exe tests\*
