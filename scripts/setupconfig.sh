configurationdirectory=/root/verium/
configurationfile="$configurationdirectory"verium.conf
if [ ! -f "$configurationfile" ]; then
    echo "$configurationfile not exist"

    mkdir -p $configurationdirectory

/bin/cat <<EOM >$configurationfile
veriumminer_test=test
EOM

chmod +x $configurationfile

fi