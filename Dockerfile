FROM java:jre-alpine

MAINTAINER Alejandro González-Pérez <alejandro.gon.per@gmail.com>

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-01-31.zip

RUN unzip stanford-corenlp-full-2018-01-31.zip && \
	rm stanford-corenlp-full-2018-01-31.zip

WORKDIR stanford-corenlp-full-2018-01-31

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-models-current.jar
RUN wget http://nlp.stanford.edu/software/stanford-english-corenlp-models-current.jar

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer