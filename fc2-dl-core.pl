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
    print "Usage: $CMD <UPID> <MODE={1/2}> [LOCAL_FILE]\n";
}

if ((scalar(@ARGV) != 2) && (scalar(@ARGV) != 3))
{
    print "Fail! -- Expecting 2 or 3 arguments! ==> @ARGV\n";
    show_help;
    exit 1;
}

my $UPID       = $ARGV[0];
my $MODE       = $ARGV[1];
my $LOCAL_FILE = $ARGV[2];

if (scalar(@ARGV) < 3)
{
    $LOCAL_FILE = "";
}

my $client = WWW::FC2Video::Download->new();

my $EXTRACTED_URL = $client->get_video_url($UPID);
my $TITLE         = $client->get_title($UPID);
my $SUFFIX        = $client->get_suffix($UPID);

if ($MODE != 2)
{
    my $PWD = getcwd();
    $LOCAL_FILE = "$PWD/${TITLE}.$SUFFIX";
}

if ($MODE == 1)
{
    print $LOCAL_FILE;
    exit
}

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
