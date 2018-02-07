FROM ubuntu:latest

RUN apt-get update && apt-get install -y apt-transport-https \
&& apt-get -y install r-base \
&& apt-get -y install gdebi-core \
&& apt install wget
&& wget https://download2.rstudio.org/rstudio-server-1.1.419-amd64.deb \
&& gdebi --option=APT::Get::force-yes=1,APT::Get::Assume-Yes=1 -n rstudio-server-1.1.419-amd64.deb \
&& rm rstudio-server-1.1.419-amd64.deb \
&& echo "server-app-armor-enabled=0"  >  /etc/rstudio/rserver.conf \
&& rstudio-server restart

EXPOSE 8787




