package XML::IODEF::Simple::Plugin::TLP;

use warnings;
use strict;

our $VERSION = '0.00_02';
$VERSION = eval $VERSION;

my $map = {
    amber   => 'need-to-know',
    red     => 'private',
    white   => 'public',
    green   => 'need-to-know',
    default => 'private',
};

sub prepare {
    my $class   = shift;
    my $info    = shift;
    return unless($info->{'restriction'});
    return unless(exists($map->{lc($info->{'restriction'})}));
    return(1);
}

sub convert {
    my $class = shift;
    my $info = shift;
    my $iodef = shift;
    my $r = lc($info->{'restriction'});
    $info->{'restriction'} = $map->{$r};
    return($iodef);
}

1;
__END__
=head1 NAME

XML::IODEF::Simple::Plugin::TLP - XML::IODEF::Simple plugin for converting from TLP

=head1 SYNOPSIS

  use XML::IODEF::Simple;
  my $report = XML::IODEF::Simple->new({
    restriction => 'amber',
    address     => 'example.com',
  });

=head1 SEE ALSO

XML::IODEF::Simple, http://code.google.com/p/collective-intelligence-framework/

=head1 AUTHOR

Wes Young, E<lt>wes@barely3am.comE<gt>

=head1 COPYRIGHT AND LICENSE

 Copyright 2011 The Trustees of Indiana University, indiana.edu
 Copyright 2011 REN-ISAC, ren-isac.net
 Copyright 2011 Wes Young, claimid.com/wesyoung

 This library is free software; you can redistribute it and/or modify
 it under the same terms as Perl itself, either Perl version 5.10.0 or,
 at your option, any later version of Perl 5 you may have available.

=cut
