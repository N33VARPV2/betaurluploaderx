FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Fix the pip upgrade command
RUN pip3 install --upgrade pip

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
COPY requirements.txt /requirements.txt
RUN cd /
RUN pip3 install -U -r requirements.txt
RUN mkdir /UPLOADER-BOT-V3
WORKDIR /UPLOADER-BOT-V3
COPY start.sh /start.sh
CMD ["/bin/bash", "python", "bot.py", "/start.sh"]
