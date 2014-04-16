FROM moul/emacs
RUN apt-get install -y git
ADD ./emacs-install.el ./emacs-install.el
RUN emacs --batch --script ./emacs-install.el

