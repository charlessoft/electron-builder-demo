run:
	yarn electron:serve

	
build:
	yarn electron:build
cp:
	cp -r ./dist_electron/*.zip /tmp/download
	cp -r ./dist_electron/*.dmg /tmp/download
	cp ./dist_electron/latest*.yml /tmp/download
cp_win:
	cp -r ./dist_electron/*.exe /tmp/download
	cp ./dist_electron/latest*.yml /tmp/download
