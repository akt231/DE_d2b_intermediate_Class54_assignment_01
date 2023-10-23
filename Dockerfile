FROM ubuntu
LABEL Adegbayo Akintunde
RUN apt-get update
RUN apt-get install -y python
ADD hello.py /home/hello.py
ADD overridehello.py /home/overridehello.py
CMD ["/home/hello.py"]
ENTRYPOINT ["python"]