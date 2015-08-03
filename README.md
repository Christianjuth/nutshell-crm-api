# Attribute

This gem is a fork of `nutshell-crm` created by [mshafrir@gmail.com](mailto:mshafrir@gmail.com). Without his groundwork this Gem would not be possible.

## Description

Nutshell-crm-api is a Ruby wrapper for the [Nutshell API](https://www.nutshell.com/api/).

## Install

```
gem install nutshell-crm-api
```


## Example Usage

```ruby
require "nutshell-crm-api"

# Initialize the Nutshell client.
nutshell = NutshellCrmAPI::Client.new "user@example.com", "MY_API_KEY"

# Get the first open lead with stub data (default).
nutshell.find_leads({status: 0}).first
# {"stub"=>true, "id"=>1001, "entityType"=>"Leads", "name"=>"Lead\u20131001", "status"=>0, "primaryAccountName"=>nil}

# Enable non-stub responses.
nutshell.stub_responses = false

# Get the first open lead with full data.
nutshell.find_leads({status: 0}).first
# {"id"=>1001, "entityType"=>"Leads", "name"=>"Lead\u20131001", "status"=>0, "primaryAccountName"=>nil, "creator"=>{}}
```

_For a full list of functions please reference [Nutshell's API documentation](https://www.nutshell.com/api/detail/class_core.html). All functions should match, but instead of cammelcase names they are called using standard Ruby method naming convention. The `getLead` function would be called `get_lead`._
