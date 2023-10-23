# using ubuntu LTS version
FROM ubuntu:20.04 AS builder-image

LABEL Adegbayo Akintunde

# avoid stuck build due to user prompt
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y python3.9 python3.9-dev python3.9-venv python3-pip python3-wheel build-essential && \
	apt-get clean && rm -rf /var/lib/apt/lists/*


ADD hello.py /home/hello.py
ADD overridehello.py /home/overridehello.py
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
CMD ["/home/hello.py"]
ENTRYPOINT ["python"]