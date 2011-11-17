##  <#GAPDoc Label="Singular">
##  <Subsection Label="Singular">
##  <Heading>&Singular;</Heading>
##  <Example><![CDATA[
##  ]]></Example>
##  </Subsection>
##  <#/GAPDoc>

LoadPackage( "LetterPlace" );

Print( "~~~~~~~~~~~\n\n" );
Print( "Singular\n\n" );

R := HomalgFieldOfRationalsInSingular( ) * "x,y,z";
L := LetterPlaceRing( R, 4 );

m := HomalgMatrix( "[ \
x(1)*y(2) + y(1)*z(2), \
x(1)*x(2) + x(1)*y(2) - y(1)*x(2) - y(1)*y(2) \
]", 2, 1, L );

b := BasisOfRows( m );

Assert( 0, RingName( L ) = "Q[x,y,z,(4)]" );
Assert( 0, NrRows( b ) = 8 );
