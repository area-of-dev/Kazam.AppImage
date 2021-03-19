# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

all:

	mkdir --parents $(PWD)/build/Boilerplate.AppDir/vendor

	apprepo --destination=$(PWD)/build appdir boilerplate kazam python3.8 python3.8-dev python3.8-psutil python3-xlib \
										python3.8-setuptools python3-pip python3-dnf python3-apt python3-xdg \
										python3-distutils python3-distutils-extra python3-gi python3-dbus python3-cairo \
										openssl libffi7 intltool libgudev-1.0-0 libffi libgudev gir1.2-gudev-1.0

	echo 'PYTHONPATH=$${PYTHONPATH}:$${APPDIR}/vendor' 								>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export PYTHONPATH=$${PYTHONPATH}' 										>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' 																		>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' 																		>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'GI_TYPELIB_PATH=$${GI_TYPELIB_PATH}:$${APPDIR}/lib64' 					>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'GI_TYPELIB_PATH=$${GI_TYPELIB_PATH}:$${APPDIR}/lib64/girepository-1.0' 	>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export GI_TYPELIB_PATH=$${GI_TYPELIB_PATH}'								>> $(PWD)/build/Boilerplate.AppDir/AppRun

	echo 'case "$${1}" in' 															>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo "  '--python') exec \$${APPDIR}/bin/python3.8 \$${*:2} ;;" 				>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '  *)   $${APPDIR}/bin/python3.8 $${APPDIR}/vendor/bin/kazam $${@} ;;' 	>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'esac' 																	>> $(PWD)/build/Boilerplate.AppDir/AppRun


	sed -i 's/#APPDIR=`pwd`/APPDIR=`dirname \$${0}`/' $(PWD)/build/Boilerplate.AppDir/AppRun
	$(PWD)/build/Boilerplate.AppDir/AppRun --python -m pip install  -r $(PWD)/requirements.txt --target=$(PWD)/build/Boilerplate.AppDir/vendor --upgrade
	$(PWD)/build/Boilerplate.AppDir/AppRun --python -m pip uninstall typing -y
	sed -i 's/APPDIR=`dirname \$${0}`/#APPDIR=`pwd`/' $(PWD)/build/Boilerplate.AppDir/AppRun


	rm -f $(PWD)/build/Boilerplate.AppDir/*.png 		| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.desktop 	| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.svg 		| true	

	cp --force $(PWD)/AppDir/*.svg 		$(PWD)/build/Boilerplate.AppDir 			| true	
	cp --force $(PWD)/AppDir/*.desktop 	$(PWD)/build/Boilerplate.AppDir 			| true	
	cp --force $(PWD)/AppDir/*.png 		$(PWD)/build/Boilerplate.AppDir 			| true	


	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage  $(PWD)/build/Boilerplate.AppDir $(PWD)/Kazam.AppImage
	chmod +x $(PWD)/Kazam.AppImage

clean:
	rm -rf ${PWD}/build


	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	# wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/openssl-libs-1.1.1c-15.el8.x86_64.rpm
	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	# wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libffi-3.1-21.el8.x86_64.rpm
	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	# wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/intltool-0.51.0-11.el8.noarch.rpm
	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	# wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libgudev-232-4.el8.x86_64.rpm
	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	# wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libappindicator-gtk3-12.10.0-19.el8.x86_64.rpm
	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	# wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libindicator-gtk3-12.10.1-14.el8.x86_64.rpm
	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	# wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/g/gstreamer1-plugins-base-1.16.2-2.fc32.x86_64.rpm
	# cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..



	# mkdir -p $(PWD)/build/AppDir/python
	# cp -r $(PWD)/build/usr/* $(PWD)/build/AppDir/python

	# cp --force $(PWD)/AppDir/AppRun $(PWD)/build/AppDir/AppRun
	# chmod +x $(PWD)/build/AppDir/AppRun

	# mkdir -p $(PWD)/build/AppDir/vendor
	# $(PWD)/build/AppDir/AppRun --python -m pip install  -r $(PWD)/requirements.txt --target=$(PWD)/build/AppDir/vendor --upgrade
	# $(PWD)/build/AppDir/AppRun --python -m pip uninstall typing -y

	# cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/AppDir/
	# cp --force $(PWD)/AppDir/*.png $(PWD)/build/AppDir/ || true
	# cp --force $(PWD)/AppDir/*.svg $(PWD)/build/AppDir/ || true

	# export ARCH=x86_64 && $(PWD)/bin/appimagetool-x86_64.AppImage  $(PWD)/build/AppDir $(PWD)/Kazam.AppImage
	# @echo "done: Kazam.AppImage"
	# make clean


clean:
	rm -rf ${PWD}/build
