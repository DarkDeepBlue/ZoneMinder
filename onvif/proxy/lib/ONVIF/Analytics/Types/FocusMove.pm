package ONVIF::Analytics::Types::FocusMove;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'http://www.onvif.org/ver10/schema' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %Absolute_of :ATTR(:get<Absolute>);
my %Relative_of :ATTR(:get<Relative>);
my %Continuous_of :ATTR(:get<Continuous>);

__PACKAGE__->_factory(
    [ qw(        Absolute
        Relative
        Continuous

    ) ],
    {
        'Absolute' => \%Absolute_of,
        'Relative' => \%Relative_of,
        'Continuous' => \%Continuous_of,
    },
    {
        'Absolute' => 'ONVIF::Analytics::Types::AbsoluteFocus',
        'Relative' => 'ONVIF::Analytics::Types::RelativeFocus',
        'Continuous' => 'ONVIF::Analytics::Types::ContinuousFocus',
    },
    {

        'Absolute' => 'Absolute',
        'Relative' => 'Relative',
        'Continuous' => 'Continuous',
    }
);

} # end BLOCK








1;


=pod

=head1 NAME

ONVIF::Analytics::Types::FocusMove

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
FocusMove from the namespace http://www.onvif.org/ver10/schema.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * Absolute


=item * Relative


=item * Continuous




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # ONVIF::Analytics::Types::FocusMove
   Absolute =>  { # ONVIF::Analytics::Types::AbsoluteFocus
     Position =>  $some_value, # float
     Speed =>  $some_value, # float
   },
   Relative =>  { # ONVIF::Analytics::Types::RelativeFocus
     Distance =>  $some_value, # float
     Speed =>  $some_value, # float
   },
   Continuous =>  { # ONVIF::Analytics::Types::ContinuousFocus
     Speed =>  $some_value, # float
   },
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut

