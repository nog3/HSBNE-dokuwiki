FROM istepanov/dokuwiki
MAINTAINER Brendan Halliday <nog3@nog3.net>

# This is a customized docker install of dokuwiki which adds the openauth plugin.

RUN apt-get update && \
    apt-get install -y unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add todo plugin
RUN curl -O -L "https://github.com/cosmocode/dokuwiki-plugin-oauth/zipball/master" && \
    unzip cosmocode-dokuwiki-plugin-oauth-d9da59c.zip -d /var/www/lib/plugins/ && \
    mv /var/www/lib/plugins/cosmocode-dokuwiki-plugin-oauth-d9da59c /var/www/lib/plugins/oauth && \
    rm -rf cosmocode-dokuwiki-plugin-oauth-d9da59c.zip
