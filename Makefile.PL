use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Data::ResultSet',
    AUTHOR              => q{Dave O'Neill <dmo@roaringpenguin.com>},
    VERSION_FROM        => 'lib/Data/ResultSet.pm',
    ABSTRACT_FROM       => 'lib/Data/ResultSet.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Data-ResultSet-*' },
);
