FROM alpine:3.14

LABEL version="1.0.0"
LABEL repository=""
LABEL homepage="https://adroitcc.co.uk"
LABEL maintainer="Adroit Cloud Consulting"
LABEL "com.github.actions.name"="Adroit jFrog Tasks"
LABEL "com.github.actions.description"="Runs jFrog Commands"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="green"

RUN apk add curl
RUN apk add nodejs npm
RUN apk add bash
RUN apk update

RUN curl -fL https://getcli.jfrog.io | sh \
    && mv ./jfrog /usr/bin/ \
    && chmod +x /usr/bin/jfrog

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]