FROM octoprint/octoprint:latest

RUN apt -y install socat

COPY startOctoprint.sh .

ENTRYPOINT ["./startOctoprint.sh"]
