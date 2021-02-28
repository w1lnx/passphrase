# passphrase
Quick tool to generate meaningful memorable password phrases.

Presently in macOS 10.15.5, the Password Assistant offers only these four options with (examples for reference):

* Letters & Numbers: BWib0hGLZg0N...

* Numbers Only: 3311049148...

* Random: x*B{m6MNH\...

* FIPS-181 Compliant: wehritirby...

Every one of them will generate a password that is either quite difficult for a human to remember, or, paradoxically, trivially-simple for a computer to brute-force. See also: [xkcd #936](https://xkcd.com/936/)

This is an expeditious interim solution.

Uses the word list that is included with all macOS / OS X versions and randomly selects a word length and uses generally-safe characters to separate them.

## Usage
Only need to run the passphrase.sh script:

    ./passphrase.sh
