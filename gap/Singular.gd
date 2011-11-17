#############################################################################
##
##  Singular.gd                                          LetterPlace package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##  Copyright 2011, Max Horn,        University of Braunschweig
##
##  Declaration stuff for the external computer algebra system Singular.
##
#############################################################################

####################################
#
# global variables:
#
####################################

DeclareGlobalVariable( "LetterPlaceMacrosForSingular" );

####################################
#
# properties:
#
####################################

DeclareAttribute( "IsLetterPlaceRing",
        IsHomalgRing );

####################################
#
# attributes:
#
####################################

DeclareAttribute( "IndeterminatesOfLetterPlaceRing",
        IsHomalgRing );

####################################
#
# global functions and operations:
#
####################################

DeclareOperation( "LetterPlaceRing",
        [ IsHomalgRing, IsInt ] );

DeclareOperation( "Indeterminates",
        [ IsHomalgRing ] );
