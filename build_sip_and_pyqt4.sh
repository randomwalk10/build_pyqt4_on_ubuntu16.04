#enter virtualenv
workon py2
#download sip
SIP_FILENAME="sip-4.17.tar.gz"
SIP_DIR="sip-4.17"
if [ ! -f "$SIP_FILENAME" ]; then
	wget -O $SIP_FILENAME https://sourceforge.net/projects/pyqt/files/sip/sip-4.17/sip-4.17.tar.gz/download
fi
if [ -d "$SIP_DIR" ]; then
	cd $SIP_DIR
	make clean
	cd ..
	rm -rf $SIP_DIR
fi
tar -xvzf $SIP_FILENAME
#build sip
cd $SIP_DIR
python configure.py
make -j$(getconf _NPROCESSORS_ONLN)
sudo make install
cd ..
#download pyqt
PYQT_FILENAME="PyQt-x11-gpl-4.11.4.tar.gz"
PYQT_DIR="PyQt-x11-gpl-4.11.4"
if [ ! -f "$PYQT_FILENAME" ]; then
	wget -O $PYQT_FILENAME https://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.4/PyQt-x11-gpl-4.11.4.tar.gz/download
fi
if [ -d "$PYQT_DIR" ]; then
	cd $PYQT_DIR
	sudo make uninstall
	make clean
	cd ..
	rm -rf $PYQT_DIR
fi
tar -xvzf $PYQT_FILENAME
#install pyqt
cd $PYQT_DIR
python configure.py
make -j$(getconf _NPROCESSORS_ONLN)
sudo make install
cd ..
