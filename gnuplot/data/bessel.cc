#include<iostream>
#include<sstream>
#include<fstream>
#include<cstring>
#include<cmath>
#include<vector>
#include<complex>
#include<numeric>

#include <gsl/gsl_sf_bessel.h>


int main ( int argc, char * argv[] )
{
  if ( argc != 2 )
    {
      std::cerr << "Usage: " << argv[0] << " <n> " << std::endl;
      return 1;
    }
  int n       = atof ( argv[1] );
  int Npts    = 1000;
  double xi   = 0.0;
  double xf   = 20.0;
  double step = ( xf - xi ) / ( (double) Npts );
  double x    = xi;


  for ( int i = 1; i <= Npts; i++ )
    {
      std::cout << x << " " <<  gsl_sf_bessel_Jn (n, x) << std::endl;
      x += step;
    }
  return 0;
}
