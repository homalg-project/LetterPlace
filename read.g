#############################################################################
##
##  read.g                                               LetterPlace package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##  Copyright 2011, Max Horn,        University of Braunschweig
##
##  Reading the implementation part of the LetterPlace package.
##
#############################################################################

if not ( IsBound( LOADED_LetterPlace_implementation ) and
         LOADED_LetterPlace_implementation = true ) then

## init
ReadPackage( "LetterPlace", "gap/LetterPlace.gi" );

## all the supported external computer algebra systems
ReadPackage( "LetterPlace", "gap/Singular.gi" );

fi;
