FROM ruby:2.1

# Common
RUN apt-get update && \
	apt-get install -y \
	vim nano ngrep mongodb-clients mysql-client build-essential \
	traceroute screen inotify-tools curl libssl-dev wget unzip \
	libxss1 libappindicator1 libindicator7 && \
	apt-get clean all

# google chrome + Xvfb
RUN apt-get install -y gconf-service libasound2 libgconf-2-4 libnspr4 libnss3 \
    libpango1.0-0 libxtst6 fonts-liberation xdg-utils xvfb  && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome*.deb && \
    apt-get install -f

# chromedriver
RUN wget -N http://chromedriver.storage.googleapis.com/2.20/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    chmod +x ~/chromedriver && \
    mv ~/chromedriver /usr/local/share/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/bin/chromedriver


# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install the needed gems
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

# copy the tests and run cucumber
COPY features /usr/src/app/features
RUN cucumber
