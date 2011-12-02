use strict;
use warnings;
package C3000::RepUtils;
use C3000;
use File::Basename;
use Config::Tiny;
use Win32;
use File::Spec::Functions;
use Win32::ExcelSimple;



sub init{
my $c3000_h = C3000->new();
my $Config  = read_conf();
my $dt_parser = DateTime::Format::Natural->new(
        lang      => 'en',
        format    => 'yyyy/mm/dd',
        time_zone => 'Asia/Taipei',
    );
my $excel_h = $Config
}

sub read_conf{

   Config::Tiny->new();
my $path = dirname($0);
my $file_name = basename($0);
   substr($file_name, -2, 2, 'ini');
   $path = Win32::GetFullPathName($path);
my $abs_ini = catfile($path, $file_name);
my $Config = Config::Tiny->read($abs_ini) or die "can't open config file! $!";
   return $Config->{_};
}

sub make_name{



}

sub RepAuto_callback{
        
	next if !defined $_[0]->{Value};
            if ( $_[0]->{Value} =~ /^~~~/ ) {

                my @a =
                  split( /__/,
                    substr( $_[0]->{Value}, 3 ) )
                  ;    #grab useful string
				  $_0->{Value} = 
                if ( scalar @a == 3 ) {
                    $a[2] =
                      convert_xls_date( $parser_from, $parser_to, $parser_now,
                        $a[2] );
					   print @a if DEBUG == 1;
                    $_[0]->{Value} =
                      $hl->get_single_LP( 'ADAS_VAL_RAW', @a );
                }
                if ( scalar @a == 4 ) {
                    if ( $a[3] =~ /^\[/ ) {
                        $a[2] =
                          convert_xls_date( $parser_from, $parser_to,
                            $parser_now, $a[2] );
                        $_[0]->{Value} =
                          $hl->get_single_LP( 'ADAS_VAL_RAW', @a );
                    }
                    else {
                        $a[2] =
                          convert_xls_date( $parser_from, $parser_to,
                            $parser_now, $a[2] );
                        $a[3] =
                          convert_xls_date( $parser_from, $parser_to,
                            $parser_now, $a[3] );

                        $_[0]->{Value} =
                          $hl->accu_LP( 'ADAS_VAL_NORM', @a );
                    }
                }
                if ( scalar @a == 5 ) {
                    $a[2] =
                      convert_xls_date( $parser_from, $parser_to, $parser_now,
                        $a[2] );
                    $a[3] =
                      convert_xls_date( $parser_from, $parser_to, $parser_now,
                        $a[3] );
                    $_[0]->{Value} =
                      $hl->accu_LP( 'ADAS_VAL_NORM', @a );


}
}
}



1;

