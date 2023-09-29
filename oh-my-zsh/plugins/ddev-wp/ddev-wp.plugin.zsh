alias wpp='ddev wp plugin'
alias wppl='ddev wp plugin list'
alias wppi='ddev wp plugin install --activate'
alias wppd='ddev wp plugin deactivate --uninstall'
alias wppu='ddev wp plugin update'

function wpps() {
	slug=$1

	PLUGINS_DIR='wp-content/plugins'
	PLUGINS_STORE_DIR='wp-content/plugins-store'

	if [ ! -d $PLUGINS_DIR ]
	then
		echo 'ERROR: Not in WordPress root directory'
		return 1
	fi

	if [ -z $slug ]
	then
		echo "Usage: $0 <slug>"
		return 1
	fi


	version=`wpp get --field=version $slug`
	mkdir -p $PLUGINS_STORE_DIR/$slug/$version

	rsync -aP --delete $PLUGINS_DIR/$slug/ $PLUGINS_STORE_DIR/$slug/$version/
}

function wppis() {
	slug=$1
	version=$2

	PLUGINS_DIR='wp-content/plugins'
	PLUGINS_STORE_DIR='wp-content/plugins-store'

	if [ ! -d $PLUGINS_DIR ] || [ ! -d $PLUGINS_STORE_DIR ]
	then
		echo 'ERROR: Not in WordPress root directory'
		return 1
	fi

	if [ -z $slug ] || [ -z $version ]
	then
		echo "Usage: $0 <slug> <version>"
		return 1
	fi

	rsync -aP --delete $PLUGINS_STORE_DIR/$slug/$version/ $PLUGINS_DIR/$slug/

	wpp activate $slug
}