FROM registry.federation.mip.hbp/mip_base/r-job:latest

MAINTAINER ludovic.claude54@gmail.com

LABEL eu.humanbrainproject.function=summary-stats \
      eu.humanbrainproject.function.location=node \
      eu.humanbrainproject.function.version=0.1 \
      eu.humanbrainproject.function.author="Lester Melie-Garcia" \
      eu.humanbrainproject.function.organisation="LREN, CHUV" \
      eu.humanbrainproject.function.date="2015-06-27"

COPY main.R /src/

RUN installGithub.r LREN-CHUV/hbpsummarystats@6f6a42e
