FROM ericmoritz/test-base
RUN apt-get install -y git emacs
ADD ./emacs-install.el ./emacs-install.el
RUN emacs --batch --script ./emacs-install.el

