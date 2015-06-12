# 帐号组研发环境-Docker镜像脚本
## vim
> 最小版本，带编辑环境`vim`

* 创建
```bash
bash build.sh vim
#bash build.sh vim:$TAG
#默认TAG为latest
```

* 运行(**注意: 退出，即删除**)
```bash
docker run --rm -it evo-vim:latest
#OR
docker run --rm -it evo-vim
```

* 运行(映射`宿主路径`，作为容器目录`/project/`)
```
docker run --rm -it -v 宿主路径:/project/  evo-vim:latest
#OR
docker run --rm -it -v 宿主路径:/project/  evo-vim
```

## dev-cpp
> c++开发环境，包含常用依赖包

`TODO`

