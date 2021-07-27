FROM ubuntu:20.04
ENTRYPOINT []
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/kebo.pens.ac.id\/ubuntu\//' /etc/apt/sources.list
RUN apt-get update
ADD . /app/
RUN apt-get install -y python3 python3-pip git
COPY requirements.txt ./
RUN pip3 install -r requirements.txt
RUN pip3 install git+https://github.com/RasaHQ/rasa-nlu-examples
RUN chmod +x /app/start_services.sh
CMD /app/start_services.sh
