#!/usr/bin/perl

# File: slackwareservice.pl
# Version 1.0
# Copyright Joey Kelly (joeykelly.net)
# November 28, 2017
# License: GPL version 2

# This is a simple wrapper around the various Slackware RC scripts.
# See the GitHub README for usage: https://github.com/mmlj4/slackware-service

use strict;
#use warnings;
# we don't want any "experimental" warnings, so...
no warnings;

use 5.18.1;

my $rc = '/etc/rc.d/rc.';
my @actions = qw(start stop restart status);

# what service do we want to manage?
my $service = shift;
$service = safechars($service);

my $daemon = $rc . $service;
if (-x $daemon) {
  # we have a valid service, so what do we want to do with it?
  my $action = shift;
  $action = safechars($action);
  if ($action ~~ @actions) {
    # we have a valid service and a plausible action, so let's do it
    # ...but we want to vacate any shell environment variables, etc., so we use "env -i"
    system "env -i $daemon $action";
  } else {
    say "$action is not a valid action";
  }
} else {
  say "$service is not a valid service";
}


# let's sanitize user input, like a good programmer should...
sub safechars {
  my $string = shift;
  $string =~ tr/a-zA-Z0-9//dc;
  return $string;
}
