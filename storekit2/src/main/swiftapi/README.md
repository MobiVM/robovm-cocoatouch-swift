Extracted SwiftAPI for StoreKit2 

use following command line to extract api+doc similar as Xcode does

> sourcekitten request --yaml req.yml | jq -r '.["key.sourcetext"]' > storekit_27.0.swift