#!/usr/bin/perl

# REFERENCE:
# https://github.com/akiym/WWW-FC2Video-Download

use strict;
use warnings;
use WWW::FC2Video::Download;
use File::Basename;
use Cwd;

my $CMD = basename($0);

sub show_help
{
    print "Usage: $CMD <UPID>\n";
}

if (scalar(@ARGV) != 1)
{
    print "fail! -- expect 1 arguments! ==> @ARGV\n";
    show_help;
    exit 1;
}

my $UPID = $ARGV[0];

my $client = WWW::FC2Video::Download->new();

my $EXTRACTED_URL = $client->get_video_url($UPID);
my $TITLE         = $client->get_title($UPID);
my $SUFFIX        = $client->get_suffix($UPID);

my $PWD = getcwd();
my $LOCAL_FILE = "$PWD/${TITLE}.$SUFFIX";

print "\nDownloading video from.. ==> $EXTRACTED_URL\n";
my $fh;
$client->download($UPID, sub {
    my ($data, $res, $proto) = @_;
    unless ($fh)
    {
        open $fh, '>', "$LOCAL_FILE" or die $!;
    }
    print {$fh} $data;
});
print "\nDownload complete! ==> $LOCAL_FILE\n"
