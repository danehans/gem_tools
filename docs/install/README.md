# gemini project

Automates the deployment of CoreOS on baremetal for Kubernetes clusters.

Clone this repo:
```
# git clone https://github.com/danehans/gemini.git
```

Clone the Kubernetes Contrib repo:
```
# git clone https://github.com/kubernetes/contrib.git
```

Update group_vars/all.yml and copy the contents to ~/contrib/ansible/group_vars/all.yml

Rename host_vars/gemini_master_example to host_vars/${GEMINI_MASTER_FQDN_OR_IP} then edit the file
according to your deployment environment.

Replace gem-master-example in inventory/gemini-master with ${GEMINI_MASTER_FQDN_OR_IP}

Run the pre-setup script to populate the gemini ansible roles. For example:
```
# pwd
/root/gemini/ansible

# ./pre-setup.sh 
Cloning into '/root/gemini/ansible/roles/ansible-controller'...
remote: Counting objects: 20, done.
remote: Total 20 (delta 0), reused 0 (delta 0), pack-reused 20
Unpacking objects: 100% (20/20), done.
Cloning into '/root/gemini/ansible/roles/httpd'...
remote: Counting objects: 128, done.
remote: Total 128 (delta 0), reused 0 (delta 0), pack-reused 128
Receiving objects: 100% (128/128), 19.27 KiB | 0 bytes/s, done.
Resolving deltas: 100% (50/50), done.
Cloning into '/root/gemini/ansible/roles/tftp'...
remote: Counting objects: 172, done.
remote: Total 172 (delta 0), reused 0 (delta 0), pack-reused 172
Receiving objects: 100% (172/172), 23.85 KiB | 0 bytes/s, done.
Resolving deltas: 100% (64/64), done.
Cloning into '/root/gemini/ansible/roles/dnsmasq'...
remote: Counting objects: 147, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 147 (delta 0), reused 0 (delta 0), pack-reused 145
Receiving objects: 100% (147/147), 18.42 KiB | 0 bytes/s, done.
Resolving deltas: 100% (55/55), done.
Cloning into '/root/gemini/ansible/roles/coreos-cloudinit'...
remote: Counting objects: 32, done.
remote: Total 32 (delta 0), reused 0 (delta 0), pack-reused 32
Unpacking objects: 100% (32/32), done.
total 28
drwxr-xr-x. 7 root root 4096 Mar 26 06:21 .
drwxr-xr-x. 7 root root 4096 Mar 26 06:20 ..
drwxr-xr-x. 5 root root   74 Mar 26 06:21 ansible-controller
drwxr-xr-x. 7 root root 4096 Mar 26 06:21 coreos-cloudinit
drwxr-xr-x. 9 root root 4096 Mar 26 06:21 dnsmasq
drwxr-xr-x. 9 root root 4096 Mar 26 06:21 httpd
-rw-r--r--. 1 root root  690 Mar 26 06:18 README.md
drwxr-xr-x. 9 root root 4096 Mar 26 06:21 tftp
-> Your Gemini Ansible roles have been successfully created
```

Run the setup script to deploy the gemini-master node. For example:
```
# pwd
/root/gemini/ansible

# ./setup.sh 
