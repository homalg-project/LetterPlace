##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

## we need the Modules book loaded
LoadPackage( "Modules" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/LetterPlace.bib" );
WriteBibXMLextFile( "doc/LetterPlaceBib.xml", bib );

Read( "ListOfDocFiles.g" );

PrintTo( "VERSION", PackageInfo( "LetterPlace" )[1].Version );

MakeGAPDocDoc( "doc", "LetterPlace", list, "LetterPlace" );

GAPDocManualLab( "LetterPlace" );

QUIT;
