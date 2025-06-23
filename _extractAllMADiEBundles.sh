#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-cli-3.8.0.jar
input_cache_path=./input-cache
madie_bundle_dir=./bundles/madie

set -e

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	echo Extracting bundle $madie_bundle_dir
	java -jar $tooling -ExtractMatBundle $madie_bundle_dir -dir

else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling -ExtractMatBundle $madie_bundle_dir -dir
	else
		echo cqf Tooling jar NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
