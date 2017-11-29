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

use 5.18.1;

my $rc = '/etc/rc.d/rc.';
my @actions = qw(start stop restart status);

my $service = shift;
$service = safechars($service);
my $daemon = $rc . $service;
if (-x $daemon) {
  my $action = shift;
  $action = safechars($action);
  if ($action ~~ @actions) {
    system "$daemon $action";
  } else {
    say "$action is not a valid action";
  }
} else {
  say "$service is not a valid service";
}


sub safechars {
  my $string = shift;
  $string =~ tr/a-zA-Z0-9//dc;
  return $string;
}
