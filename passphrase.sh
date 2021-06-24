#!/bin/bash

# ALWAYS have a default minimum state.

# ToDo: Add an optional length limit.
# ToDo: Alternate language sources?

aRandomWord() {
    # Select a random word LENGTH between three and 12 characters:
    # randomWordLength
    randomWordLength=0
    lowerWordLength=3
    upperWordLength=12
    while [ $randomWordLength -lt "${lowerWordLength}" ] || [ $randomWordLength -gt "${upperWordLength}" ]
    do
        randomWordLength=$(( ( RANDOM % upperWordLength ) ))
    done
    # Select a random word of randomWordLength from the wordlist at
    # /usr/share/dict/words
    dictionaryList=/usr/share/dict/words
    randomWord=$( grep -ie "^.\{$randomWordLength\}$" $dictionaryList | sort -uR | head -n 1 )
    randNumber=$[ $RANDOM % 2 ]
    if [ "$randNumber" = "1" ]; then
        randomWord="$(tr '[:lower:]' '[:upper:]' <<< ${randomWord:0:1})${randomWord:1}"
    fi
    echo -n "${randomWord}"
}

aRandomChar() {
    # Choose a random special character (safeChars) to follow the word. Unicode
    # would be ideal, but these ASCII characters are least problematic for most
    # password handlers -- and they're our LCD.
    chChars="@$%^()-=[]{},./_+:?"
    # Yep, unicode. You're welcome:
    utf8Chars="🤔💭❓💡❗️§⌘📗😂🖕Ωμ🛩🧾‽🎵🎶"
    safeChars=${chChars}+${utf8Chars}
    #   altCharList1="\!\"#$%&'()*+,-./:;<=>?@[\]^>\`\\{|\}~"
    #       ->  \!"#$%&'()*+,-./:;<=>?@[\]^>`\{|\}~
    puncCharLen=${#safeChars}
        # The actual length of the safeChars string above.
    randomInteger=$(( ( RANDOM % puncCharLen ) ))
        # A random position in that string.
    randomChar=${safeChars:randomInteger:1}
        # The character at that random position.
    echo -n "${randomChar}"
}

aRandomDigit() {
    # Choose a random digit from 0 to 9.
    echo $(( $RANDOM % 10))
}

generatePhrase() {
    #repeat two times
    loop=0
    while [ "${loop}" -lt 2 ]
    do
        aRandomWord
        aRandomChar
        loop=$(( loop + 1 ))
    done
    aRandomWord
    aRandomDigit
}

generatePhrase
