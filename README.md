<div align="center">
  <img src="https://123job.vn/images/logo/logo349x137tim.png" width="400">
</div>

<div align="center">
    <a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</div>

## 1. Install

### 1.1 Install Docker
- [Link hướng dẫn install](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04).
    ```
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt update
    apt-cache policy docker-ce
    sudo apt install docker-ce
    sudo systemctl status docker
    sudo usermod -aG docker ${USER}
    su - ${USER}
    id -nG
    sudo usermod -aG docker username
    docker --version
    ```
### 1.2 Install Docker-Compose
- [Link hướng dẫn install](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04).
    ```
    sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    ```
### 1.3 Install Docker-Machine
- [Link hướng dẫn install](https://upcloud.com/community/tutorials/get-started-docker-machine/).
    ```
    base=https://github.com/docker/machine/releases/download/v0.16.0 &&
    curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
    sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
    chmod +x /usr/local/bin/docker-machine
    ```

### 1.4 Install Virtualbox
- [Link hướng dẫn install](https://tecadmin.net/install-virtualbox-on-ubuntu-18-04/).
    ```
    sudo apt update
    sudo apt upgrade
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
    sudo apt update
    sudo apt install virtualbox-6.1  
    virtualbox
    ```
- Hoặc có thể vào AppStore của Ubutnu để install.

- Nếu không tạo được máy ảo thì fix theo [Link](https://askubuntu.com/questions/920689/how-to-fix-modprobe-vboxdrv-error-in-virtualbox)

## 2. Thao tác
### 2.1 Docker Machine
- Command:
    ```
    # Liệt kê các máy Docker Machine trong hệ thống
    docker-machine ls
    
    # Chạy một Docker Machine đang dừng
    docker-machine start name-machine
  
    #Tạo các máy Docker Machine
    docker-machine create --driver virtualbox vps1
    docker-machine create --driver virtualbox vps2
    docker-machine create --driver virtualbox vps3
    
    # Dừng một Docker Machine đang chạy
    docker-machine stop name-machine
    
    # Xóa một Docker Machine
    docker-machine rm name-machine
    
    # Lấy thông tin địa chỉ IP của 1 Docker Machine đang chạy
    docker-machine ip name-machine
    
    # Copy dữ liệu từ máy Host vào một máy Docker Machine đang chạy
    docker-machine scp filesource name-machine:/path-docke-machine/
    docker-machine scp -r directory name-machine:/path-docke-machine/
    
    # VÀO TERMINAL CỦA DOCKER MACHINE
    docker-machine ssh name-machine
    ```

### 2.2 Docker Swarm
- Command:
    ``` 
    #Tạo swarm
    docker swarm init --advertise-addr=ip
    
    #Kiểm tra swarm có bao nhiêu node
    docker node ls
    
    #Lấy token cho các node worker join vào swarm
    docker swarm join-token worker
    
    #Rời khỏi swarm (thực hiện trên các máy node worker)
    docker swarm leave
  
    #Xóa node 
    docker node rm id_node
    
    ```
- Command Stack
    ```
    #Copy docker-compose file vào node manage chạy stack
    docker stack deploy --compose-file docker-compose.yml teststack
    
    #Kiểm tra stack list
    docker stack ls
    
    #Kiểm tra service trong stack
    docker stack services teststack
  
    #Kiểm tra chi tiết service trong stack
    docker service ps name_service
  
    #Remove stack
    docker stack rm name_stack
    ```



