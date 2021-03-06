FROM ibizaman/docker-archlinux

RUN pacman -Syu --noconfirm \
    gsettings-desktop-schemas \
    gtk2 \
    imagemagick \
    java-environment=8 \
    libxrender \
    libxtst \
    socat \
    ttf-dejavu \
    unzip \
    xorg-server \
    xorg-server-xvfb

#TODO: remove skipchecksums whenever possible
RUN aur-install.sh ib-tws --skipchecksums
RUN aur-install.sh ib-controller --skipchecksums

COPY start.sh /start.sh
RUN chmod a+x /start.sh
RUN cp /etc/ibcontroller/edemo.ini /etc/ibcontroller/conf.ini

EXPOSE 4003

CMD ["/start.sh"]
