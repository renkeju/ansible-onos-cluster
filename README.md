# Ansible ONOS Cluster
创建 ONOS 集群的 Ansible 模板

## 测试环境

* 3个Atomix节点
* 4个ONOS节点
* Ubuntu 16.04 & Ubuntu 18.04 (master branch)

## 步骤

* 准备部署节点（在此节点安装 ansible）

    ```
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt update
    sudo apt install ansible
    ```

* 克隆仓库

    ```
    git clone https://github.com/renkeju/ansible-onos-cluster.git
    ```

* 检查部署节点使用root用户可以访问所有节点
  
    ```
    ansible -i inventory/hosts.ini all -m ping
    ```

* 修改变量

    * inventory/group_vars/all.yml
    * inventory/group_vars/atomix.yml
    * inventory/group_vars/onos.yml
    * inventory/group_vars/ha.yml

## 执行 ansible playbook
  
    ```
    ansible-playbook main.yml -i inventory/hosts.ini
    ansible-playbook ha.yml -i inventory/hosts.ini
    ```
