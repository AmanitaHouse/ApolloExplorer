#!/bin/bash

clear
brew install qt
rm -r -f .qmake.stash
cd acp
make clean distclean
cd ../AmigaIconReader
make clean distclean
cd ../Amiga/M
make clean distclean
cd ../ApolloExplorerPC
make clean distclean
cd ..

qmake -recursive
make -j16

#mkdir ApolloExplorerPC/ApolloExplorer.app/Contents/Resources
#cp ApolloExplorerPC/icons/ApolloExplorer.icns ApolloExplorerPC/ApolloExplorer.app/Contents/Resources/ 

#rm -r -f /Applications/ApolloExplorer.app
#cp -r -f ApolloExplorerPC/ApolloExplorer.app /Applications/ApolloExplorer.app

clear
brew install qt
rm -r -f .qmake.stash
cd acp
make clean 
cd ../AmigaIconReader
make clean 
cd ../Amiga/M
make clean 
cd ../ApolloExplorerPC
make clean 
cd ..
