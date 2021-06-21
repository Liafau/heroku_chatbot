FROM ubuntu:18.04
ENTRYPOINT []
RUN apt-get update
ADD . /app/
RUN apt-get install -y python3 python3-pip
RUN apt-get -y install git
COPY requirements.txt ./
RUN pip3 install -r requirements.txt
RUN git clone https://github.com/RasaHQ/rasa-nlu-examples@a5c50932e5a526cb4d70da03cd1d32f44a10288a
RUN chmod +x /app/start_services.sh
CMD /app/start_services.sh
