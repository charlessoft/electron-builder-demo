run:
	yarn electron:serve

	
build:
	yarn electron:build
cp:
	cp -r ./dist_electron/*.zip /tmp/download
	cp -r ./dist_electron/*.dmg /tmp/download
	cp ./dist_electron/latest-mac.yml /tmp/download
