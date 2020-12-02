FROM ubuntu:latest
RUN apt-get update -y
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN apt-get install -y $(grep -vE "^\s*#" requirements.txt | tr "\n" " ")
COPY src/* /app/
ENTRYPOINT ["python3"]
CMD ["app.py"]
