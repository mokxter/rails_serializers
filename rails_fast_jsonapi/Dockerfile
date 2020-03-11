FROM ruby:2.7
LABEL maintainer=ianbuena081191@gmail.com

ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

# Setup some dependencies (git for bundler, nokogiri and mysql bits)
RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends build-essential git libxml2-dev libxslt1-dev \
  default-libmysqlclient-dev cmake pkg-config nodejs yarn && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV BUNDLE_JOBS=4 \
  BUNDLE_RETRY=5 \
	GEM_HOME=/gems \
	BUNDLE_PATH=/gems \
	BUNDLE_BIN=/gems/bin


ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR $INSTALL_PATH

RUN gem install bundler

COPY docker-entrypoint.rails.dev.sh ./

ENTRYPOINT "./docker-entrypoint.rails.dev.sh"

# CMD ['bundle', 'exec', 'rails', 's', '-b', '0.0.0.0']
