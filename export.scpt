on writeToFile(filePath, content)
    do shell script "echo > " & quoted form of filePath
    set fileObject to POSIX file filePath
    set fileDescriptor to open for access fileObject with write permission
    write content to fileDescriptor starting at eof  as «class utf8»
    close access fileDescriptor
end writeToFile

on cleanName(name)
    set name to my replace(name, "/", "_")
    set name to my replace(name, ":", "_")
    set name to my replace(name, " ", "_")
    repeat while name contains "__"
        set name to my replace(name, "__", "_")
    end repeat
    if name ends with "_" then
        set validFileName to text 1 through -2 of validFileName
    end if
    set alphaName to ""
    repeat with i from 1 to length of name
        set c to character i of name
        if c is in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_." then
            set alphaName to alphaName & c
        end if
    end repeat
    return alphaName
end

on replace(s, find, replace)
    set AppleScript's text item delimiters to find
    set s to text items of s
    set AppleScript's text item delimiters to replace
    set s to s as string
    set AppleScript's text item delimiters to ""
    return s
end replaceText

on run argv
    set dir to (do shell script "pwd") & "/"
    tell application "Notes"
        set theAccounts to every account
        repeat with anAccount in theAccounts
            set accountName to my cleanName(name of anAccount)
            set theFolders to every folder of anAccount
            repeat with aFolder in theFolders
                set folderName to my cleanName(name of aFolder)
                set theNotes to notes of aFolder
                repeat with theNote in theNotes
                    set title to my cleanName(name of theNote)
                    set noteName to accountName & "." & folderName & "." & title & ".html"
                    set writeLocation to dir & noteName
                    set htmlContent to body of theNote
                    -- log noteName
                    my writeToFile(writeLocation, htmlContent)
                end repeat
            end repeat
        end repeat
    end tell
end run
