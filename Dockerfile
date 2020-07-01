FROM ubuntu

RUN echo 'deb https://download.jitsi.org stable/' >> /etc/apt/sources.list.d/jitsi-stable.list && wget -qO -  https://download.jitsi.org/jitsi-key.gpg.key | apt-key add - && apt-get install apt-transport-https && apt update

RUN apt -y install jitsi-videobridge2

COPY ./config /etc/jitsi/videobridge/ 
COPY ./sip-communicator.properties /etc/jitsi/videobridge

RUN /etc/init.d/jitsi-videobridge2 restart

