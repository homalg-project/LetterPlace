#############################################################################
##
##  Singular.gi                                          LetterPlace package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##  Copyright 2011, Max Horn,        University of Braunschweig
##
##  Implementation stuff for the external computer algebra system Singular.
##
#############################################################################

####################################
#
# global functions and variables:
#
####################################

##
InstallValue( LetterPlaceMacrosForSingular,
        rec(
            
            )
        
        );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( Indeterminates,
        "for letter place rings",
        [ IsHomalgRing and IsLetterPlaceRing ],
        
  function( L )
    
    return IndeterminatesOfLetterPlaceRing( L );
    
end );

####################################
#
# constructor functions and methods:
#
####################################

##
InstallMethod( LetterPlaceRing,
        "for homalg rings in Singular",
        [ IsHomalgExternalRingInSingularRep and IsFreePolynomialRing, IsInt ],
        
  function( R, deg_bound )
    local ext_obj, S, indets, var, RP, r;
    
    homalgSendBlocking( [ "LIB \"freegb.lib\"" ], "need_command", R, HOMALG_IO.Pictograms.initialize );
    
    ext_obj := homalgSendBlocking( [ "makeLetterplaceRing(", deg_bound, ");" ] , [ "def" ], TheTypeHomalgExternalRingObjectInSingular, R, HOMALG_IO.Pictograms.CreateHomalgRing );
    
    S := CreateHomalgExternalRing( ext_obj, TheTypeHomalgExternalRingInSingular );
    
    indets := Indeterminates( R );
    
    var := ListX( indets, [ 1 .. deg_bound ],
                  function( v, i ) return Concatenation( Name( v ), "(",  String( i ), ")" );
    end );
    
    var := List( var, a -> HomalgExternalRingElement( a, S ) );
    
    Perform( var, function( v ) SetName( v, homalgPointer( v ) ); end );
    
    SetIsLetterPlaceRing( S, true );
    SetIndeterminatesOfLetterPlaceRing( S, var );
    
    r := CoefficientsRing( R );
    
    RP := homalgTable( S );
    
    RP!.RingName := L -> Concatenation( RingName( r ), "[", JoinStringsWithSeparator( List( indets, Name ) ), ",(", String( deg_bound ), ")]" );
    
    _Singular_SetRing( S );
    
    RP!.BasisOfRowModule :=
      function( M )
        local N;
        
        N := HomalgVoidMatrix(
                     "unknown_number_of_rows",
                     NrColumns( M ),
                     HomalgRing( M )
                     );
    
        homalgSendBlocking(
                [ "matrix ", N, " = matrix(letplaceGBasis(ideal(", M, ")))" ],
                "need_command",
                HOMALG_IO.Pictograms.BasisOfModule
                );
        
        return N;
        
    end;
    
    Unbind( RP!.BasisOfColumnModule );
    
    if HasIsIntegersForHomalg( r ) and IsIntegersForHomalg( r ) then
        RP!.IsUnit := RP!.IsUnit_Z;
        RP!.GetColumnIndependentUnitPositions := RP!.GetColumnIndependentUnitPositions_Z;
        RP!.GetRowIndependentUnitPositions := RP!.GetRowIndependentUnitPositions_Z;
        RP!.GetUnitPosition := RP!.GetUnitPosition_Z;
    fi;
    
    return S;
    
end );

####################################
#
# transfer methods:
#
####################################

####################################
#
# View, Print, and Display methods:
#
####################################

