FROM ubuntu:20.04

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

COPY . .

# Compile all sources together
RUN gcc -o myapp main.c biggest3.c factorial.c

CMD ["./myapp"]

