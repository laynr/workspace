# docker build -t workspace .
# docker run -it -v $(pwd):/home/pyuser workspace /bin/bash   # bash/wsl
# docker run -it -v "%cd%":/home/pyuser workspace /bin/bash   # cmd

FROM python:3

# pull in contrib to get vim
RUN echo "deb http://deb.debian.org/debian buster contrib" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y vim-tiny

# set up user
RUN adduser pyuser --disabled-password --disabled-login
USER pyuser
WORKDIR /home/pyuser

# install python packages
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
