run:
	yarn electron:serve

	
build:
	yarn electron:build
build_nsi:
	cd scripts && \
		sh build_win_nsi.sh && \
		sh build_hash.sh
	rsync ./dist_electron/latest*.yml root@sdwanvpn2:/tmp/download
cp:
	scp -r ./dist_electron/*.zip root@sdwanvpn2:/tmp/download
	scp -r ./dist_electron/*.dmg root@sdwanvpn2:/tmp/download
	scp ./dist_electron/latest*.yml root@sdwanvpn2:/tmp/download
cp_win:
	rsync -r ./dist_electron/*.exe root@sdwanvpn2:/tmp/download
	rsync ./dist_electron/latest*.yml root@sdwanvpn2:/tmp/download
	rsync ./dist_electron/*blockmap root@sdwanvpn2:/tmp/download
	cp ./dist_electron/win-unpacked/resources/app-update.yml ./dist_electron/

