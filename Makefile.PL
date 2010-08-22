use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME		=> 'FTN::Log',
    AUTHOR		=> 'Robert James Clay <jame@rocasa.us>',
    VERSION_FROM	=> 'lib/FTN/Log.pm',
    ABSTRACT_FROM       => 'lib/FTN/Log.pm',
    LICENSE        	=> 'perl',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'FTN-Log-*' },
);
