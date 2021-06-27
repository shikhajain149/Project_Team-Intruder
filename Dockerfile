FROM ubuntu

LABEL author.email = "pkhokya25@gmail.com"
LABEL author.name="Prateek Khandelwal"


RUN  apt update -y
RUN  apt install python3 -y


RUN mkdir /python_code



COPY timepass.py  /python_code/timepass.py


WORKDIR  /python_code
CMD  ["python3","timepass.py"] 
