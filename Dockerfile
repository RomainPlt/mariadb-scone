FROM registry.scontain.com:5050/sconecuratedimages/apps:mariadb-alpine-scone3.0

RUN SCONE_MODE=SIM SCONE_HEAP=2G SCONE_LOG=7 SCONE_HASH=1 \
&& MRENCLAVE="$(SCONE_MODE=SIM SCONE_HEAP=2G SCONE_LOG=7 SCONE_HASH=1 SCONE_ALPINE=1 mysql --innodb-use-native-aio=0 --verbose --help --log-bin-index=/tmp/tmp.HHiiGc )" \
&& echo "<MRENCLAVE>$MRENCLAVE</MRENCLAVE>"

RUN mysql --innodb-use-native-aio=0 --verbose --help --log-bin-index=/tmp/tmp.HHiiGc 
