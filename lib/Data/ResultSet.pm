package Data::ResultSet;
use warnings;
use strict;

our $VERSION = '0.001';

1;
__END__

=head1 NAME
 
Data::ResultSet - Container for aggregating and examining multiple results
 
=head1 SYNOPSIS

    # Subclass the module
    package MyApp::ResultSet;
    use base qw( Data::ResultSet );

    # Generate methods to wrap 'is_success'
    __PACKAGE__->generate_wrappers( qw( is_success is_error ) );

    # And elsewhere...
    package MyApp;
    use MyApp::ResultSet;
    sub something
    {
        # Create a resultset object
        my $result = MyApp::ResultSet->new();

        foreach my $thing ( @_ ) {
                # Add results of calling do_something() to the result
                # set
                $result->add(
                         $thing->do_something();
                );
        }

        # Return the results
        return $result;
    }

    # And, check your results
    my $r = something( @some_data );

    if( $r->all_success ) {
        # Only true if each result's ->is_success method returns true
        print "happiness and puppies!\n";
    } elsif ( $r->all_error ) {
        # Only true if each result's ->is_error method returns true
        die 'Oh noes! Everything errored out!';
    } else {
        foreach my $failed ( $r->list_not_success() ) {
                # Do something with each failed result
        }
    }
  
=head1 DESCRIPTION

Data::ResultSet is a container object for aggregating and examining
multiple results.  It allows multiple result objects matching the same
method signature to be returned as a single object that can then be
queried for success or failure in a number of ways.

This is accomplished by generating wrappers to methods in the
underlying list of result objects.  For example, if 

=head1 CLASS METHODS

=head2 new ( )

Creates a new Data::ResultSet object.  Generally you will want to do
this on a subclass, not on Data::ResultSet.

=head2 generate_wrappers ( @method_names )

Generates all wrapper methods ( all_, has_, get_, get_not ) for the
provided method names.  The resulting wrapper will consist of the
provided name and the appropriate prefix, with the exception that
provided names beginning with is_ will have the is_ stripped first.

The wrappers can be generated individually using other methods (see below).

=head2 generate_all_wrappers

TODO

=head2 generate_has_wrappers

TODO

=head2 generate_get_wrappers

TODO

=head2 generate_get_not_wrappers

TODO

=head1 INSTANCE METHODS

=head2 add ( $object ) 

Adds an object to the result set.

=head2 all_METHOD ( )

Generated method that returns true if the METHOD called on every object
within the set returns true.

=head2 has_METHOD ( ) 

Generated method that returns true if one object within the set returns
true for METHOD.

=head2 get_METHOD ( ) 

Generated method that returns all objects for which METHOD returns true.

=head2 get_not_METHOD ( ) 

Generated method that returns all objects for which METHOD returns false.
 
=head1 INCOMPATIBILITIES

There are no known incompatibilities with this module.
 
=head1 BUGS AND LIMITATIONS
 
There are no known bugs in this module. 

Please report problems to the author.

Patches are welcome.
 
=head1 AUTHOR
 
Dave O'Neill (dmo@roaringpenguin.com)
 
=head1 LICENCE AND COPYRIGHT

Copyright (c) 2007 Roaring Penguin Software, Inc.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
