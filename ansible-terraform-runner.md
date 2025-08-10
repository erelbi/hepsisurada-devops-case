```
# Download the binary for your system
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

# Give it permission to execute
sudo chmod +x /usr/local/bin/gitlab-runner

# Create a GitLab Runner user
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# Install and run as a service
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
sudo gitlab-runner start


```


```

gitlab-runner register \
  --url http://gitlab.local \
  --token glrt-_t3i9-iFmBQDIbAy3OEgxm86MQp0OjEKdToxCw.01.120dfomeb

```

```
root@ansible-terraform:/home/ansible-terraform# gitlab-runner register \
  --url http://gitlab.local \
  --token glrt-_t3i9-iFmBQDIbAy3OEgxm86MQp0OjEKdToxCw.01.120dfomeb
Runtime platform                                    arch=amd64 os=linux pid=1871 revision=cc489270 version=18.2.1
Running in system-mode.                            
                                                   
Enter the GitLab instance URL (for example, https://gitlab.com/):
[http://gitlab.local]: 
Verifying runner... is valid                        correlation_id=01K276BX01AH1VGQ259QP38M3E runner=_t3i9-iFm
Enter a name for the runner. This is stored only in the local config.toml file:
[ansible-terraform]: 
Enter an executor: shell, docker+machine, kubernetes, docker-autoscaler, custom, ssh, parallels, virtualbox, docker, docker-windows, instance:
shell
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!
 
Configuration (with the authentication token) was saved in "/etc/gitlab-runner/config.toml" 

```

```
root@ansible-terraform:/home/ansible-terraform# ssh-keygen 
Generating public/private ed25519 key pair.
Enter file in which to save the key (/root/.ssh/id_ed25519): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_ed25519
Your public key has been saved in /root/.ssh/id_ed25519.pub
The key fingerprint is:
SHA256:dZ63CTlNaow6yPni4MQuHptOP4CUbVYnCGyVZe5CVE8 root@ansible-terraform
The key's randomart image is:
+--[ED25519 256]--+
|..oo=+ E         |
| o.oooo.         |
|. o...o.  . . .  |
| o.+.    . = *   |
|..o. .  S . X o  |
|. .... o . . + o |
|  o.+ + o     o  |
| ..O.... .       |
| o=.+o...        |
+----[SHA256]-----+

```

```
root@ansible-terraform:/home/ansible-terraform# ssh-copy-id  root@docker-host.local
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_ed25519.pub"
The authenticity of host 'docker-host.local (192.168.122.92)' can't be established.
ED25519 key fingerprint is SHA256:pqrS+qL1UOffJGiMJkee46cLSl4SvqqfAjUMz85EPa8.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@docker-host.local's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@docker-host.local'"
and check to make sure that only the key(s) you wanted were added.

root@ansible-terraform:/home/ansible-terraform# 
```

### TerraForm

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

```
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

```
sudo apt-get update
sudo apt-get install terraform
```

```
 apt-get install -y docker-cli

```
Uzaktan yönetmek için

```
sudo apt-get install -y ansible 
```