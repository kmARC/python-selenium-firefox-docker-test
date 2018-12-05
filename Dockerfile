FROM alpine:3.8

RUN apk --no-cache add \
        firefox-esr \
        xvfb \
        ttf-freefont \
        dbus-x11 \
        python3

# Alpine 3.8 ships Firefox-ESR 52.9, while the geckodriver v0.18 recommends 
# Firefox version greater than 53. Therefore using older selenium driver
ARG SELENIUM_VERSION=0.17.0
RUN wget https://github.com/mozilla/geckodriver/releases/download/v${SELENIUM_VERSION}/geckodriver-v${SELENIUM_VERSION}-linux64.tar.gz -O /tmp/geckodriver.tar.gz \
 && tar xzf /tmp/geckodriver.tar.gz -C /usr/local/bin \
 && rm -rf /tmp/geckodriver.tar.gz

COPY requirements.txt /
RUN pip3 install --no-cache-dir  -r requirements.txt

COPY test.py /

CMD ["python3", "test.py"]
