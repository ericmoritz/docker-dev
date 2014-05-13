FROM ericmoritz/docker-test-base
MAINTAINER Eric Moritz <http://ericmoritz.name/>
RUN apt-get install -y git emacs libmemcached-dev
ADD ./emacs-install.el ./emacs-install.el
RUN emacs --batch --script ./emacs-install.el
RUN echo "export EDITOR=emacs" >> ~root/.bashrc

