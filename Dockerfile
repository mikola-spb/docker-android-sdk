FROM openjdk:8-jdk

MAINTAINER Nikolay Khasanov <nk.khasanov@gmail.com>

RUN \
    # Temporary install soft required for buiding image
    apt-get update && \
    apt-get install -y wget unzip && \
    \
    # Install c++ compiler packages
    apt-get install -y lib32stdc++6 lib32z1 && \
    \
    # Download Android SDK tools
    wget --quiet --output-document=/tmp/android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \
    unzip -q /tmp/android-sdk.zip -d /opt/android-sdk-linux && \
    \
    # Cleanup
    rm -rf /tmp/* && \
    apt-get -y remove wget unzip && \
    apt-get -y autoremove

ENV ANDROID_HOME=/opt/android-sdk-linux \
    PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/android-sdk-linux/tools/bin
