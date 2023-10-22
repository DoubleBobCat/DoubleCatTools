#!/bin/bash

clear

# ��ʼ������
build_flag=false
make_flag=false
run_flag=false

build_dir=true
build_file=true

# ���������в���
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
      echo "��Ч��ѡ��: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# ��ʼ���
echo "------ Begin ------"
echo ""

# �жϵ�ǰĿ¼���Ƿ���build�ļ���
echo "------ check build ------"
if [ -d "build" ]; then
    # �������build�ļ��У�����Ƿ����ļ�
    build_dir=true
    if [ "$(ls -A build)" ]; then
        echo "build[��] build->file[��]"
        build_file=true
    else
        echo "build[��] build->file[��]"
        build_file_false
    fi
else
	build_dir=false
fi

# ���̿�ʼ
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
