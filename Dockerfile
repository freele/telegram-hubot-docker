FROM makeomatic/node:6.5.0


WORKDIR /src
# cache npm modules
COPY package.json /src/
# RUN npm install --production

RUN \
  apk --no-cache add --virtual .buildDeps \
    git \
  && npm install --production \
  && npm dedupe \
  && apk del \
    .buildDeps \
    git \
  && rm -rf \
    /tmp/* \
    /root/.npm

# move source code
COPY ./ /src/
