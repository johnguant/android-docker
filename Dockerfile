FROM openjdk:8

RUN apt-get update && apt-get -y install git
RUN apt-get install -y bundler
RUN gem install fastlane

RUN cd /opt && \
wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
unzip android-sdk.zip -d android-sdk/ && \
rm android-sdk.zip

ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:/opt/scripts

RUN yes | sdkmanager --licenses
RUN sdkmanager tools platform-tools "platforms;android-27" "build-tools;26.0.2"
