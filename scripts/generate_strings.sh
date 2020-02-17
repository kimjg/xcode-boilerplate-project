#!/usr/bin/env bash
if [ "$#" -lt 1 ]; then
    exit 1
fi
outputfile=$1
touch tempStrings.swift
echo "import Foundation" >> tempStrings.swift
echo "extension String {" >> tempStrings.swift
echo "    var localized: String {" >> tempStrings.swift
echo "        return NSLocalizedString(self, comment: \"\")" >> tempStrings.swift
echo "    }" >> tempStrings.swift
echo "}" >> tempStrings.swift

echo "enum Strings {" >> tempStrings.swift
inputfile=${SRCROOT}/$PROJECT_NAME/Resources/ko.lproj/Localizable.strings
while IFS= read -r line
do
echo $line
pattern='^[a-zA-Z]+(.*)[\\s]*=[\\s]*(.*);$'
if [[ $line =~ $pattern ]]
then
    variableName=$(echo ${line%%=*})
echo $variableName
if [ "$variableName" != "" ]; then
echo "    static let $variableName = \"$variableName\".localized" >> tempStrings.swift
fi
fi
done <"$inputfile"
echo "}" >> tempStrings.swift
cat tempStrings.swift > $outputfile
rm tempStrings.swift
