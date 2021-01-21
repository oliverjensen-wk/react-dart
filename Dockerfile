FROM drydock-prod.workiva.net/workiva/dart_build_image:1

# Chrome install taken from https://github.com/Workiva/dart_unit_test_image/blob/master@%7B13-01-2021%7D/Dockerfile

# Set the expected Chrome major version. This allows us to update the expected version when
# we need to roll out a new version of this base image with a new chrome version as the only change
ENV EXPECTED_CHROME_VERSION=87

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get -qq update && apt-get install -y google-chrome-stable && \
    mv /usr/bin/google-chrome-stable /usr/bin/google-chrome && \
    sed -i --follow-symlinks -e 's/\"\$HERE\/chrome\"/\"\$HERE\/chrome\" --no-sandbox/g' /usr/bin/google-chrome

# Fail the build if the version doesn't match what we expected
RUN google-chrome --version | grep " $EXPECTED_CHROME_VERSION\."

# TODO: Remove this and instead run it within the github actions CI on the stable channel once SDK lower bound is >=2.9.3
RUN dartfmt --line-length=120 --dry-run --set-exit-if-changed .

# TODO: Remove these test runs once SDK lower bound is >=2.9.3
RUN pub run build_runner test --release -- --preset dart2js --exclude-tags=dart-2-7-dart2js-variadic-issues
RUN pub run build_runner test -- --preset dartdevc

# We need 2.9.2 to verify the Chrome MemoryInfo workaround: https://github.com/cleandart/react-dart/pull/280
# TODO remove the workaround as well as this config once SDK lower bound is >=2.9.3
FROM google/dart:2.9.2
RUN dart --version

# Don't allow the dart package to be updated via apt
RUN apt-mark hold dart

# Update image - required by aviary
RUN apt-get update -qq && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get clean all
# Install deps for Chrome install
RUN apt-get install -y \
	build-essential \
	curl \
	git \
	make \
	parallel \
	wget \
	&& rm -rf /var/lib/apt/lists/*

# Chrome install taken from https://github.com/Workiva/dart_unit_test_image/blob/master@%7B13-01-2021%7D/Dockerfile

# Set the expected Chrome major version. This allows us to update the expected version when
# we need to roll out a new version of this base image with a new chrome version as the only change
ENV EXPECTED_CHROME_VERSION=87

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get -qq update && apt-get install -y google-chrome-stable && \
    mv /usr/bin/google-chrome-stable /usr/bin/google-chrome && \
    sed -i --follow-symlinks -e 's/\"\$HERE\/chrome\"/\"\$HERE\/chrome\" --no-sandbox/g' /usr/bin/google-chrome

# Fail the build if the version doesn't match what we expected
RUN google-chrome --version | grep " $EXPECTED_CHROME_VERSION\."

WORKDIR /build/
ADD . /build/

RUN pub get
# Run DDC tests to verify Chrome workaround
RUN pub run build_runner test -- --preset dartdevc
# Run dart2js tests that fail in 2.7
RUN pub run build_runner test --release -- --preset dart2js --tags=dart-2-7-dart2js-variadic-issues

FROM scratch
