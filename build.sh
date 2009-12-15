# This file builds webapp for local running

# makes the dir for downloaded files
mkdir cache 
cd cache

# download dependencies
wget http://gwtwiki.googlecode.com/files/bliki.3.0.13.zip
wget http://googleappengine.googlecode.com/files/appengine-java-sdk-1.3.0.zip
wget http://mirrors.ibiblio.org/pub/mirrors/maven2/commons-fileupload/commons-fileupload/1.2.1/commons-fileupload-1.2.1.jar
wget http://mirrors.ibiblio.org/pub/mirrors/maven2/org/apache/commons/commons-io/1.3.2/commons-io-1.3.2.jar
wget http://prdownloads.sourceforge.net/nanoxml/nanoxml-lite-2.2.1.jar

# unzipping the GAE SDK and bliki
echo "unpacking AppEngine SDK..."
unzip -d ../ appengine-java-sdk-1.3.0.zip > /dev/null
echo "unpacking bliki..."
unzip -j -d ../war/WEB-INF/lib bliki.3.0.13.zip info.bliki.wiki/bliki-core/target/bliki-core-3.0.13.jar > /dev/null

# copying Apache Commons libraries
mkdir -p ../war/WEB-INF/classes
mkdir -p ../war/WEB-INF/lib
cp *.jar ../war/WEB-INF/lib

# go to the build directory and run Ant build script
#rm list
cd ../build
ant compile && echo "Done, enjoy!"



