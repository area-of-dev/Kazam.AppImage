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
	rm -rf $(PWD)/build
	mkdir -p $(PWD)/build
	mkdir -p $(PWD)/build/AppDir

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-3.8.0-6.module_el8.2.0+317+61fa6e7d.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-devel-3.8.0-6.module_el8.2.0+317+61fa6e7d.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/aarch64/os/Packages/python38-pip-19.2.3-5.module_el8.2.0+317+61fa6e7d.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-setuptools-41.6.0-4.module_el8.2.0+317+61fa6e7d.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/python38-libs-3.8.0-6.module_el8.2.0+317+61fa6e7d.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/openssl-libs-1.1.1c-15.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libffi-3.1-21.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/intltool-0.51.0-11.el8.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libgudev-232-4.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-distro-1.4.0-5.fc32.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-dbus-1.2.16-1.fc32.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-distutils-extra-2.39-16.fc32.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-pyxdg-0.26-9.fc32.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-gobject-base-3.36.0-2.fc32.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-gobject-3.36.0-2.fc32.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/g/gstreamer1-plugins-base-1.16.2-2.fc32.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-cairo-1.18.2-4.fc32.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm  https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-xlib-0.26-2.fc32.noarch.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..



	mkdir -p $(PWD)/build/AppDir/python
	cp -r $(PWD)/build/usr/* $(PWD)/build/AppDir/python

	cp --force $(PWD)/AppDir/AppRun $(PWD)/build/AppDir/AppRun
	chmod +x $(PWD)/build/AppDir/AppRun

	mkdir -p $(PWD)/build/AppDir/vendor
	$(PWD)/build/AppDir/AppRun --python -m pip install  -r $(PWD)/requirements.txt --target=$(PWD)/build/AppDir/vendor --upgrade
	$(PWD)/build/AppDir/AppRun --python -m pip uninstall typing -y

	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/AppDir/
	cp --force $(PWD)/AppDir/*.png $(PWD)/build/AppDir/ || true
	cp --force $(PWD)/AppDir/*.svg $(PWD)/build/AppDir/ || true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool-x86_64.AppImage  $(PWD)/build/AppDir $(PWD)/Kazam.AppImage
	@echo "done: Kazam.AppImage"
	make clean


clean:
	rm -rf ${PWD}/build
