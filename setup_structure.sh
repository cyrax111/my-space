#!/bin/bash

# Create directory structure
mkdir -p packages/core_domain/{lib/src/{failures,use_case,value_objects},test}
mkdir -p packages/core_logging/{lib/src,test}
mkdir -p packages/core_storage/{lib/src,test}
mkdir -p packages/core_ui/{lib/src/{theme,layout,widgets},test}
mkdir -p packages/core_network/{lib/src,test}
mkdir -p packages/core_platform/{lib/src,test}

mkdir -p packages/feature_blog/{lib/src/{domain/{entities,repositories,use_cases},data/{models,repositories,data_sources},presentation/{bloc,pages,widgets}},test}
mkdir -p packages/feature_portfolio/{lib/src/{domain/{entities,repositories,use_cases},data/{models,repositories,data_sources},presentation/{bloc,pages,widgets}},test}
mkdir -p packages/feature_about/{lib/src/{domain/{entities,repositories,use_cases},data/{models,repositories,data_sources},presentation/{bloc,pages,widgets}},test}
mkdir -p packages/feature_contact/{lib/src/{domain/{entities,repositories,use_cases},data/{models,repositories,data_sources},presentation/{bloc,pages,widgets}},test}

mkdir -p apps/my_space/{lib/{core/di,config,router},test,integration_test}

echo "✅ Directory structure created"
