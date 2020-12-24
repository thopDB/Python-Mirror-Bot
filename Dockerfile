FROM lzzy12/mega-sdk-python:latest

WORKDIR /usr/src/app

RUN apt-get -qq update && \
    apt-get install -y software-properties-common && \
    rm -rf /var/lib/apt/lists/* && \
    apt-add-repository non-free && \
    apt-get -qq update && \
    apt-get -qq install -y p7zip-full p7zip-rar aria2 curl pv jq ffmpeg locales python3-lxml && \
    apt-get purge -y software-properties-common

COPY requirements.txt .
COPY extract /usr/local/bin
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
COPY netrc /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]


