# Attribute

This gem is a fork of `nutshell-crm` created by [mshafrir@gmail.com](mailto:mshafrir@gmail.com).

## Description ##

Nutshell Crm is a Ruby wrapper for the Nutshell Crm API.

[Nutshell API Reference](https://www.nutshell.com/api/detail/class_core.html)

## Reference ##

- {NutshellCrmAPI::Client}


## Install ##

    gem install nutshell-crm-api



## Install ##

    gem install nutshell-crm
    

## Example Usage ##

    require "nutshell-crm"

    # Instantiate the Nutshell client.
    nutshell = NutshellCrm::Client.new "user@example.com", "MY_API_KEY"

    # Get the first open lead with stub data (default).
    nutshell.find_leads({status: 0}).first
    #=> {"stub"=>true, "id"=>1001, "entityType"=>"Leads", "name"=>"Lead\u20131001", "status"=>0, "primaryAccountName"=>nil}

    # Enable non-stub responses.
    nutshell.stub_responses = false

    # Get the first open lead with full data.
    nutshell.find_leads({status: 0}).first
    #=> {"id"=>1001, "entityType"=>"Leads", "name"=>"Lead\u20131001", "status"=>0, "primaryAccountName"=>nil, "creator"=>{}}
