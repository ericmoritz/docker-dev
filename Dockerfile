FROM ericmoritz/docker-test-base
MAINTAINER Eric Moritz <http://ericmoritz.name/>
RUN apt-get install -y git emacs
ADD ./emacs-install.el ./emacs-install.el
RUN emacs --batch --script ./emacs-install.el

