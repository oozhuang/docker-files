# 研发环境-Docker镜像脚本
## dev
> 最小版本，带vim、sshd的研发环境`dev`

### 创建
```bash
# 使用命令生成镜像：${PREFIX}-dev:${TAG}
#
bash build.sh ${PREFIX}:dev:${TAG}
```
>  默认$PREFIX为evo，$TAG为latest。 后续，将直接描述为 `evo-dev:latest` 或 `evo-dev`

### 单容器场景
> 场景描述，采用`evo-dev:latest`生成临时容器，用完即弃。

#### 运行
0. ==第一次运行==, 请制作`${CONFIG_DIR}`
```bash
# 创建目录
#
mkdir -p ${CONFIG_DIR}
```
```bash
# 完善name、email、alias等
#
vi ${CONFIG_DIR}/.gitconfig
```
```bash
# RSA授权，以便后续免密码登录
#
cat ~/.ssh/id_rsa.pub > ${CONFIG_DIR}/authorized_keys
```

0. 准备名为`develop`的数据卷
```bash
# 将宿主的配置目录，映射至容器固定目录/config/
# 将宿主的项目目录，映射至容器目录/git/，此路径可自定义
# 并命名为develop
#
docker run --name develop -d \
    -v ${CONFIG_DIR}/:/config/:ro \
    -v ${PROJECT_DIR}/:/git/ \
    busybox sh
```
> 容器内`/config/`为==固定路径==； `${CONFIG_DIR}`、`${PROJECT_DIR}` 要求采用==绝对路径==。

0. 基于数据卷`develop`运行
```bash
docker run -d --volumes-from develop -p 2201:22 evo-dev
```

#### 使用
0. 登录到dev容器
```bash
# ${HSOT_IP} 取值:
# [1] 在boot2docker环境中 HOST_IP=Docker服务所在vm的IP
# [2] 在linux本机docker环境中，HOST_IP=127.0.0.1
# 
ssh root@$HOST_IP -p 2201
```

### 多容器场景
> 场景描述，采用==基于==`evo-dev:latest`的景象生成多个容器，并需要统一跳板机管理。

#### 运行
0. 第一次运行，请制作`${CONFIG_DIR}`, 参考**单容器场景**。
0. 第一次运行，生成跳板机id_rsa*
```bash
bash build.sh evo:ssh-jump:
bash build.sh evo:ssh-jump-tool:
```
```bash
docker run --rm -it -v ${CONFIG_DIR}:/config/ evo-ssh-jump-tool gen
```
0. 准备名为`develop`的数据卷, 参考**单容器场景**。
0. 基于数据卷`develop`生成多个dev容器，并赋予容器名称
```bash
docker run -d -name aaa --volumes-from develop evo-dev
docker run -d -name bbb --volumes-from develop evo-dev
docker run -d -name bbb --volumes-from develop evo-dev
```
0. 基于数据卷`develop`生成跳板机容器
```bash
docker run -d -name jump --volumes-from develop \
--link aaa:aaa.ii \
--link bbb:bbb.ii \
--link ccc:ccc.ii \
evo-dev
```

#### 使用
0. 登录跳板机容器
```bash
# ${HSOT_IP} 取值:
# [1] 在boot2docker环境中 HOST_IP=Docker服务所在vm的IP
# [2] 在linux本机docker环境中，HOST_IP=127.0.0.1
# 
ssh root@$HOST_IP -p 2200
```

0. 登录到dev容器
```bash
# 在跳板机环境中
#
ssh aaa.ii
#
# 登录 bbb.ii, ccc.ii 方法亦相同
```



## dev-go
> go开发环境

## dev-openresty
> openresty开发环境

`TODO`
