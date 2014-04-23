FROM ericmoritz/ubuntu-14.04-test-agent
RUN apt-get install -y git emacs nodejs npm
ADD ./emacs-install.el ./emacs-install.el
RUN emacs --batch --script ./emacs-install.el

