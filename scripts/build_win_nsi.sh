#!/bin/sh
export PATH='/cygdrive/c/Program Files (x86)/Microsoft Visual Studio/2019/Community/Common7/IDE':$PATH
export PATH='/cygdrive/c/Program Files (x86)/NSIS':$PATH
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
cd $SHELL_FOLDER
PRODUCT_VERSION=`cat new_version.txt`
MAKENSIS="${MAKENSIS:-makensis}"
OSSLSIGNCODE="${OSSLSIGNCODE:-osslsigncode}"
ROOT="${ROOT:-$PWD}/_image"
OPENVPN_ROOT="${ROOT}"
OPENVPN_ROOT_I686="${ROOT}/i686"
OPENVPN_ROOT_X86_64="${ROOT}/x86_64"
EASYRSA_ROOT="${ROOT}/easy-rsa"
OPENVPN_PACKAGE_NAME="ElectronBuilderDemo"

dospath() {
	local p="$1"
	echo "$p" | sed 's/\//\\/g'|sed 's#\\cygdrive\\d#d:#g'
}
# test="$(dospath "${OPENVPN_ROOT_I686}")"
# echo $ROOT
# echo $test
# exit 1;


# rm -fr *.exe

"${MAKENSIS}" \
		-DARCH="${ARCH}" \
		-DPRODUCT_VERSION="${PRODUCT_VERSION}" \
		-DPACKAGE_NAME="${OPENVPN_PACKAGE_NAME}" \
		-DVERSION_STRING="${VERSION_STRING}" \
		-DSPECIAL_BUILD="${SPECIAL_BUILD}" \
		-DOPENVPN_ROOT="$(dospath "${OPENVPN_ROOT}")" \
		-DOPENVPN_ROOT_I686="$(dospath "${OPENVPN_ROOT_I686}")" \
		-DOPENVPN_ROOT_X86_64="$(dospath "${OPENVPN_ROOT_X86_64}")" \
		-DTAP_WINDOWS_INSTALLER="$(dospath "${TAP_WINDOWS_INSTALLER}")" \
		${TAP_WINDOWS_INSTALLER:+-DUSE_TAP_WINDOWS} \
		-DWINTUN_INSTALLER_X86_64="$(dospath "${WINTUN_INSTALLER_X86_64}")" \
		-DWINTUN_INSTALLER_I686="$(dospath "${WINTUN_INSTALLER_I686}")" \
		-DOPENVPNSERV2_EXECUTABLE="$(dospath "${OPENVPNSERV2_EXECUTABLE}")" \
		-DEASYRSA_ROOT="$(dospath "${EASYRSA_ROOT}")" \
		${EASYRSA_TARBALL:+-DUSE_EASYRSA} \
		-DUSE_OPENVPN_GUI \
		-DOUTPUT="${OUTPUT}" \
		./SmartConnect.nsi || die "makensis"
