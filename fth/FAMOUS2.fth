\ "No Weighting" from Starting Forth Chapter 12
VARIABLE DENSITY
VARIABLE THETA
VARIABLE ID

: Q ( -- addr )   [CHAR] Q WORD DUP C@ 1+ ALLOT ;

: MATERIAL ( addr n1 n2 -- )    \ addr=string, n1=density, n2=theta
   CREATE  , , , 
   DOES> ( -- )   DUP @ THETA !
   CELL+ DUP @ DENSITY !  CELL+ @ ID ! ;

: .SUBSTANCE ( -- )   ID @ COUNT TYPE ;
: FOOT ( n1 -- n2 )   10 * ;
: INCH ( n1 -- n2 )   100 12 */  5 +  10 /  + ;
: /TAN ( n1 -- n2 )   1000 THETA @ */ ;

: PILE ( n -- )         \ n=scaled height
   DUP DUP 10 */ 1000 */  355 339 */  /TAN /TAN
   DENSITY @ 200 */  ." = " . ." tons of "  .SUBSTANCE ;

\ table of materials
\   string-address  density  tan[theta] 
   Q cement Q           131        700  MATERIAL CEMENT
   Q loose gravel Q      93        649  MATERIAL LOOSE-GRAVEL
   Q packed gravel Q    100        700  MATERIAL PACKED-GRAVEL
   Q dry sand Q          90        754  MATERIAL DRY-SAND
   Q wet sand Q         118        900  MATERIAL WET-SAND
   Q clay Q             120        727  MATERIAL CLAY
