#sidirius/docker-lxde-vnc

Manual Build:
--
    git clone https://github.com/Sidirius/docker-lxde-vnc.git
    cd docker-lxde-vnc
    ./build.sh

Run:
--
    docker run -dt --name lxde_vnc -p 5900:5900 -p 5800:5800 -e passwd="*your_password_for_vnc*" sidirius/docker-lxde-vnc
