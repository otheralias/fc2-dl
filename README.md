fc2-dl
======

A script to download fc2 videos.

Usage
-----

<pre>
fc2-dl &lt;URL&gt;
</pre>

Detailed Usage
--------------

1. Open a webpage with the fc2 applet.
2. Click the hovering VIDEO caption at the top of the applet. This should redirect you to the main video page.
3. Copy the current browser URL.
4. Issue command "fc2-dl \<URL\>" into a bash terminal (URL is the copied text. Do not include angle brackets).
5. Find the downloaded flv in the current working directory.

Installation (Debian)
---------------------

1. git clone https://github.com/otheralias/fc2-dl.git
2. cd fc2-dl
3. git clone https://github.com/akiym/WWW-FC2Video-Download.git
4. sudo aptitude install curl
5. sudo aptitude install perl
6. download and install perl module requirements, then add module lib paths to PERL5LIB environment variable

Requirements
------------

* bash
* perl
* curl
* http://video.fc2.com
* Perl module "[WWW::FC2Video::Download](https://github.com/akiym/WWW-FC2Video-Download)"
* Perl module "[HTTP-Message-6.11](http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/HTTP-Message-6.11.tar.gz)"
* Perl module "[libwww-perl-5.837](http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/libwww-perl-5.837.tar.gz)"
* Perl module "[HTTP-Date-6.02](http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/HTTP-Date-6.02.tar.gz)"
* Perl module "[URI-1.69](http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/URI-1.69.tar.gz)"

Keywords
--------

    How to download fc2 videos?
