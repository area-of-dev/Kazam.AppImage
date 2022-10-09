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

.PHONY: all

all: clean init

	mkdir --parents $(PWD)/build/Boilerplate.AppDir/vendor

	$(PWD)/bin/Apprepo.AppImage --destination=$(PWD)/build appdir boilerplate kazam \
										python3.8 python3.8-dev python3.8-psutil python3-xlib \
										python3.8-setuptools python3-xdg python3-pip \
										python3-distutils python3-distutils-extra python3-gi python3-dbus python3-cairo \
										openssl libffi7 intltool libgudev-1.0-0 libffi libgudev gir1.2-gudev-1.0 \
										libtinfo6 libncurses6 libtinfo5 libgtk-3-0 libwayland-cursor0 libselinux1


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

	rm -f $(PWD)/build/Boilerplate.AppDir/*.png 		|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.desktop 	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.svg 		|| true	

	cp --force $(PWD)/AppDir/*.svg 		$(PWD)/build/Boilerplate.AppDir  || true	
	cp --force $(PWD)/AppDir/*.desktop 	$(PWD)/build/Boilerplate.AppDir  || true	
	cp --force $(PWD)/AppDir/*.png 		$(PWD)/build/Boilerplate.AppDir  || true	


	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage  $(PWD)/build/Boilerplate.AppDir $(PWD)/Kazam.AppImage
	chmod +x $(PWD)/Kazam.AppImage


init:
	mkdir --parents $(PWD)/bin

	wget https://apprepo.de/appimage/download/apprepo \
		--output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
