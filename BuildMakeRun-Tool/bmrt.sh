#!/bin/bash

clear

# 初始化参数
build_flag=false
make_flag=false
run_flag=false

build_dir=true
build_file=true

# 解析命令行参数
while getopts "mbr" opt; do
  case $opt in
    m)
      make_flag=true
      ;;
    b)
      build_flag=true
      ;;
    r)
	  run_flag=true
	  ;;
    \?)
      echo "无效的选项: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# 起始检查
echo "------ Begin ------"
echo ""

# 判断当前目录下是否有build文件夹
echo "------ check build ------"
if [ -d "build" ]; then
    # 如果存在build文件夹，检查是否有文件
    build_dir=true
    if [ "$(ls -A build)" ]; then
        echo "build[√] build->file[√]"
        build_file=true
    else
        echo "build[√] build->file[×]"
        build_file_false
    fi
else
	build_dir=false
fi

# 流程开始
echo "------ flow ------"
if $build_flag; then
	# build pre
	echo "------ build pre ------"
    if ! $build_dir; then
		echo "->mkdir build"
		mkdir build
	else
		if $build_file; then
			echo "->rm build file"
			rm -r build/*
		fi
	fi
	
	# build main
    echo "------ cmake ------"
    echo "->cd build"
	cd build
    echo "->cmake"
    sudo cmake ../
    echo "->cd back"
	cd ../
fi

if $make_flag; then
	echo "------ make ------"
	if $build_dir; then
		if $build_file; then
			echo "->cd build"
			cd build
			echo "->make"
			sudo make -j5
			echo "->cd back"
			cd ../
		else 
			echo "E: none make file"
		fi
	else
		echo "E: none make dir"
	fi
fi

if $run_flag; then
	if $build_dir; then
		if $build_file; then
			echo "------ run ------"
			echo "->cd build"
			cd build
			sudo ./garbage
			echo "->cd back"
			cd ../
		else 
			echo "E: none make file"
		fi
	else
		echo "E: none make dir"
	fi
fi

echo ""
echo "------ end ------"
