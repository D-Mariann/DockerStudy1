FROM python:3.11

WORKDIR /pythonProjectDocker


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD pytest -s -v tests/*