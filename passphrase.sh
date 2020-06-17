#!/bin/bash

# ToDo: Add an optional length limit.
# ToDo: Alternate language sources?

aRandomWord() {
    randomWordLength=0
    # Select a random word LENGTH between 4 and 9 characters: randomWordLength
    while [ $randomWordLength -lt "3" ] || [ $randomWordLength -gt "8" ]
    do
        randomWordLength=$(( ( RANDOM % 10 )))
    done
    # Select a random word of randomWordLength from the wordlist at /usr/share/dict/words
    dictionaryList=/usr/share/dict/words
    randomWord=$( grep -ie "^.\{$randomWordLength\}$" $dictionaryList | sort -uR | head -n 1 )
    rand=$[ $RANDOM % 2 ]
    if [ "$rand" = "1" ]; then
        randomWord="$(tr '[:lower:]' '[:upper:]' <<< ${randomWord:0:1})${randomWord:1}"
    fi
    echo -n "${randomWord}"
}

aRandomChar() {
    # Choose a random special character (safeChars) to follow the word. Unicode would be ideal, but these ASCII characters are least problematic for most password handlers.
    safeChars="@$%^()-=[]{},./_+:?"
    # The length of the string, $safeChars
    puncCharLen=${#safeChars}
    randomInteger=$(( ( RANDOM % puncCharLen ) ))
    randomChar=${safeChars:randomInteger:1}
    echo -n "${randomChar}"
}

aRandomDigit() {
    # Choose a random digit
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
    echo ""
}

generatePhrase
