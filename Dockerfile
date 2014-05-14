FROM ericmoritz/docker-test-base
MAINTAINER Eric Moritz <http://ericmoritz.name/>
RUN apt-get install -y git emacs libmemcached-dev man
ADD ./emacs-install.el ./emacs-install.el
RUN emacs --batch --script ./emacs-install.el
ADD ./home/bash_profile /root/.bash_profile
WORKDIR /src
ENV HOME /root
ENTRYPOINT bash --login
