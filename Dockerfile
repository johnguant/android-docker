FROM openjdk:8

RUN apt-get update && apt-get install git

RUN cd /opt && \
wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \
unzip android-sdk.zip -d android-sdk/ && \
rm android-sdk.zip

ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:/opt/scripts

RUN yes | sdkmanager --licenses
RUN sdkmanager tools platform-tools "platforms;android-25" "build-tools;25.0.3"
