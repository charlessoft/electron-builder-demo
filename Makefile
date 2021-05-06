run:
	yarn electron:serve

	
build:
	yarn electron:build
cp:
	scp -r ./dist_electron/*.zip root@sdwanvpn2:/tmp/download
	scp -r ./dist_electron/*.dmg root@sdwanvpn2:/tmp/download
	scp ./dist_electron/latest*.yml root@sdwanvpn2:/tmp/download
cp_win:
	scp -r ./dist_electron/*.exe root@sdwanvpn2:/tmp/download
	scp ./dist_electron/latest*.yml root@sdwanvpn2:/tmp/download
