#!/usr/bin/env bash
default_prefix="evo"

CUR_DIR=$(cd `dirname $0`;pwd)
cd $CUR_DIR
if [[ $# -lt 1 ]]; then
	echo "usage $0 image">&2
	exit -1
fi

$(echo "$1" | awk -F":" '{printf("export set prefix='%s' img='%s' tag='%s'",$1,$2,$3);}')
if [[ "" == "$img" || ! -d "$img" || ! -f "$img/Dockerfile.tpl" ]]; then 
	echo "invalid image-name, or no $img/Dockerfile.tpl for that.">&2
	exit -1
fi

if [[ "" == "$prefix" ]]; then 
	prefix=$default_prefix
fi

if [[ "" == "$tag" ]]; then 
	tag="latest"
fi

echo "try to build '${prefix}-${img}' with tag '$tag'..."
sleep 5

function func_need_private_token(){
echo -n "private-token:"
read private_token
}

function func_build(){
	cat ./$1/Dockerfile.tpl | sed "s/{{PRIVATE_TOKEN}}/$private_token/g" > ./$1/Dockerfile
	docker build -t ${prefix}-$1:$2 ./$1
	rm -rf ./$1/Dockerfile
}

func_build $img $tag

