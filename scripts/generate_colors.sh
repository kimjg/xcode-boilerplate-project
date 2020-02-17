#!/usr/bin/env bash
if [ "$#" -lt 1 ]; then
    exit 1
fi
outputfile=$1

touch tempStrings.swift

echo "import UIKit" >> tempStrings.swift

echo "enum Color {" >> tempStrings.swift

for colorset in ${SRCROOT}/$PROJECT_NAME/Resources/Colors.xcassets/*.colorset; do
   colorset_name=$(basename "$colorset")
   echo $colorset_name
   colorset_name=$(echo "$colorset_name" | cut -f 1 -d '.')
   echo "    static let $colorset_name = UIColor(named: \"$colorset_name\")" >> tempStrings.swift
done

echo "}" >> tempStrings.swift
cat tempStrings.swift > $outputfile
rm tempStrings.swift
