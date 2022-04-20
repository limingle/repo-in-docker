# repo-in-docker
基于 alpine 构建 包含repo 工具的 Docker 镜像  

## 1. 构建docker image
在当前目录执行：

> ./scripts/build.sh

会创建名称为 **${USERNAME}/repo-a:latest** 的docker image  
例如：用户alice创建的默认image名称为 alice/repo-a:latest


## 2. 安装脚本

构建完毕后，在当前目录执行：

> ./scripts/install.sh [TargetPath]

**TargetPath** 的默认值为： `${HOME}/.local`  
如不指定**TargetPath**，则生成的脚本为：`${HOME}/.local/docker_env/repo_repo-a_env`  

## 3. 使用方法
对于用户alice, 参考安装脚本提示：

<pre>First, exec: 
    source /home/alice/.local/docker_env/repo_repo-a_env
Then, use: 
    [ENTRY=&lt;entry&gt;] docker_repo [arg1]...
you can also use *repo-init* for docker_repo init, e.g.
    repo-init -u &lt;git_repo&gt; -b &lt;branch&gt; -m &lt;manifest_xml&gt;
and
    *repo-sync* for docker_repo sync

their are little differences between them, check the definitions by:
    type repo-init
    type repo-sync</pre>

如需永久生效，可将
>source /home/alice/.local/docker_env/repo_repo-a_env

添加到${HOME}/.bashrc
