if [ ! -e DONE ] ; then mkdir DONE ; fi
for i in `ls *.zip`
do
	mkdir `echo $i | sed 's/\.zip//g'`
	unzip $i -d `echo $i | sed 's/\.zip//g'`
	cd `echo $i | sed 's/\.zip//g'`/00*
	if [ $? -ne 0 ]
	then
		echo "============== ERROR with $i ================"
		rm -rf `echo $i | sed 's/\.zip//g'`
		break
	fi
	zip -r $i . 
	mv $i ../../DONE/ 
	cd ../../
	rm -rf `echo $i | sed 's/\.zip//g'`
done