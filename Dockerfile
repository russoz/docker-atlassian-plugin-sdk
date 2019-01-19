FROM alpine
MAINTAINER Alexei Znamensky <russoz@gmail.com>

RUN apk add --no-cache openjdk8 wget stow bash screen \
  && wget -nv https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz -O /sdk.tar.gz
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/

RUN mkdir -p /project/{root,user/.m2,user/.java/.userPrefs} /usr/local/stow \
  && tar xvfz /sdk.tar.gz -C /usr/local/stow \
  && chmod go+x /usr/local/stow/atlassian-*/bin/* /usr/local/stow/atlassian-*/*maven*/bin/* \
  && rm -f /sdk.tar.gz \
  && cd /usr/local/stow \
  && stow -v * \
  && atlas-update

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /project/root
EXPOSE 2990

ENTRYPOINT ["/entrypoint.sh"]
