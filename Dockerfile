FROM alpine
MAINTAINER Alexei Znamensky <russoz@gmail.com>

RUN apk add --no-cache openjdk8 wget stow bash screen \
  && wget -nv https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz -O /sdk.tar.gz
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/

RUN mkdir /project /usr/local/stow /.m2 \
  && tar xvfz /sdk.tar.gz -C /usr/local/stow \
  && chmod go+x /usr/local/stow/atlassian-*/bin/* /usr/local/stow/atlassian-*/*maven*/bin/*\
  && rm -f /sdk.tar.gz \
  && cd /usr/local/stow \
  && stow -v *

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /project
EXPOSE 2990

ENTRYPOINT ["/entrypoint.sh"]
