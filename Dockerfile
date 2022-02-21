FROM python:3.8

RUN pip3 install flask

WORKDIR /app
EXPOSE 5050


COPY . .

CMD ["python3", "/app/app.py"]