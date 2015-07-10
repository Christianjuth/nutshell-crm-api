require "nutshell-crm-api/version"

require 'json'
require 'httparty'

# @author Michael Shafrir
module NutshellCrmAPI
  class Client

    attr_accessor :api_url

    # Global setting for stubResponses parameter.
    attr_accessor :stub_responses

    include HTTParty
    format :json

    # A new instance of the NutshellCrm client.
    # Configure at https://app01.nutshell.com/setup/api-key
    #
    # @param [String] username
    # @param [String] api_key
    #   API key
    def initialize(username, api_key)
      @username = username
      @api_key = api_key
      @stub_responses = nil

      result = exec_request(build_payload({:username => @username}), 'http://api.nutshell.com/v1/json')
      api_host = result['api']
      @api_url = "https://#{api_host}/api/v1/json"
    end

    # Saves the given e-mail message.
    #
    # @param [String] e-mail in RFC 822 format
    def add_email(email_string)
      exec_request build_payload({:emailString => email_string})
    end

    # Gets all of the custom fields available for Leads, Accounts and Contacts, including appropriate meta-information.
    #
    # @return [Object] the custom fields available for Leads, Accounts and Contacts, including appropriate meta-information 
    def describe_custom_fields
      exec_request build_payload
    end

    def delete_account(account_id, rev)
      params = {accountId: account_id, rev: rev}
      payload = build_payload params
      exec_request payload
    end

    # Delete an Activity
    def delete_activity(activity_id, rev)
        params = {activityId: activity_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end
    
    # Delete a contact. 
    def delete_contact(contact_id, rev)
        params = {:contactId => contact_id, :rev => rev}
        payload = build_payload params
        exec_request(payload)
    end

    def delete_lead(lead_id, rev)
        params = {leadId: activity_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    def delete_note(note_id, rev)
        params = {noteId: activity_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    def delete_product(product_id, rev)
        params = {productId: product_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Delete a task.
    def delete_task(task_id, rev)
        params = {taskId: task_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Delete a task.
    def delete_team(team_id, rev)
        params = {teamId: team_id, :rev => rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Delete a user.
    def delete_user(user_id, rev)
        params = {userId: user_id, :rev => rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Edit an account.
    #
    # @param [Integer] account_id
    #   account ID to edit
    # @param [String] rev
    #   the revision
    # @param [Hash] account
    #   updated account information
    def edit_account(account_id, rev, account)
      exec_request build_payload({:accountId => account_id, :rev => rev, :account => account})
    end

    # Edit an activity.
    def edit_activity(activity_id, rev, activity)
      exec_request build_payload({:activityId => activity_id, :rev => rev, :activity => activity})
    end

    # Edit a contact.
    def edit_contact(contact_id, rev, contact)
      exec_request build_payload({:contactId => contact_id, :rev => rev, :contact => contact})
    end

    # Edit a lead.
    def edit_lead(lead_id, rev, lead)
      exec_request build_payload({:leadId => lead_id, :rev => rev, :lead => lead})
    end

    # Update a process step.
    def edit_step(step_id, rev, step)
      exec_request build_payload({:stepId => step_id, :rev => rev, :step => step})
    end

    # Edit a task.
    def edit_task(task_id, rev, task)
      exec_request build_payload({:taskId => task_id, :rev => rev, :task => task})
    end

    # Find accounts matching a specified query.
    def find_accounts(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {:query => query, :orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page, :stubResponses => stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active account types (to be applied to an account).
    def find_account_types(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Find activities matching a specified query. 
    def find_activities(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {:query => query, :orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page, :stubResponses => stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active activity types.
    def find_activity_types(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active Competitors.
    def find_competitors(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Find contacts associated with a specified account or lead.
    def find_contacts(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {:query => query, :orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page, :stubResponses => stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active Delays (seen in Step responses in availableDelayIds).
    def find_delays(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active Industries (to be applied to an account)
    def find_industries(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all possible outcomes for a closed lead.
    def find_lead_outcomes(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params, 'findLead_Outcomes'
      exec_request(payload)
    end

    # Find leads matching a specified query.
    def find_leads(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {:query => query, :orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page, :stubResponses => stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active markets.
    def find_markets(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active milestones.
    def find_milestones(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active Origins.
    def find_origins(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active products.
    def find_products(order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page, :stubResponses => stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    # Return all publicly-visible settings.
    def find_settings(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active Sources.
    def find_sources(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active tags.
    def find_tags
      exec_request build_payload
    end

    # Returns an array containing tasks for the given query.
    def find_tasks(query)
      params = {:query => query}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active Teams.
    def find_teams(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all territories.
    def find_territories(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Find timeline events (Activities, Emails and Notes) for an Entity.
    def find_timeline(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {:query => query, :orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page, :stubResponses => stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    # Get all active Users.
    def find_users(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {:orderBy => order_by, :orderDirection => order_direction, :limit => limit, :page => page}
      payload = build_payload params
      exec_request(payload)
    end

    # Get the specified Account.
    def get_account(account_id, rev = nil)
      params = {:accountId => account_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Get the specified Activity.
    def get_activity(activity_id, rev = nil)
      params = {:activityId => activity_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Returns graph data and overview information for various sales analytics reports.
    def getAnalyticsReport(report_type, period, filter_entity = nil, options = nil)
      params = {:reportType => report_type, :period => period, :filter => filter_entity, :options => options}
      exec_request build_payload(params)
    end

    # Get the specified Contact.
    def get_contact(contact_id, rev = nil)
      params = {:contactId => contact_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Get the specified Email.
    def get_email(email_id, rev = nil)
      params = {:emailId => email_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Get the specified lead.
    def get_lead(lead_id, rev = nil)
      params = {:leadId => lead_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Return all mobile-related settings in a simple key-value array.
    def get_mobile_settings
      exec_request build_payload
    end

    # Get the specified Note.
    def get_note(note_id, rev = nil)
      params = {:noteId => note_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Get all information for a product (including full price list).
    def get_product(product_id, rev = nil)
      params = {:productId => product_id, :rev => rev}
      exec_request build_payload(params)
    end

    def get_task(task_id, rev = nil)
      params = {:taskId => task_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Gets the last-updated times of each of the provisioning bins.
    def get_update_times
      exec_request build_payload
    end

    # Get all info about a user.
    def get_user(user_id = nil, rev = nil)
      params = {:userId => user_id, :rev => rev}
      exec_request build_payload(params)
    end

    # Create a new account.
    def new_account(account)
      exec_request build_payload({:account => account})
    end

    # Create a new activity.
    def new_activity(activity)
      exec_request build_payload({:activity => activity})
    end

    # Create a new contact.
    def new_contact(contact)
      exec_request build_payload({:contact => contact})
    end

    # Create a new Lead.
    def new_lead(lead)
      exec_request build_payload({:lead => lead})
    end

    # Create a new Lead.
    def new_note(entity, note)
      exec_request build_payload({:entity => entity, :note => note})
    end

    # Create a new tag.
    #
    # @param [Hash] tag
    #   See {Nut_Api_Render_Model_Tag}[http://www.nutshell.com/api/detail/class_nut___api___render___model___tag.html]
    def new_tag(tag)
      exec_request build_payload({:tag => tag})
    end

    # Create a new Task.
    def new_task(task)
      exec_request build_payload({:task => task})
    end

    # Return a list of Account stubs matching a given search string.
    def search_accounts(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    # Works just like searchUniversal, but only searches by email address.
    def search_by_email(email_address)
      exec_request build_payload({:emailAddressString => email_address})
    end

    # Return a list of Competitor stubs matching a given search string.
    def search_competitors(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    # Return a list of Contact stubs matching a given search string.
    def search_contacts(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    # Return a list of Contact and User stubs matching a given search string.
    def search_contacts_and_users(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    # Return a list of Lead stubs matching a given search string.
    def search_leads(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    # Return a list of Product stubs matching a given search string.
    def search_products(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    # Return a list of Source stubs matching a given search string.
    def search_sources(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    # Return a list of Contact, Lead, and Account stubs matching a given search string.
    def search_universal(query)
      exec_request build_payload({:string => query})
    end

    # Return a list of User and Team stubs matching a given search string.
    def search_users_and_teams(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end


    private

    # Builds the payload for a request.
    #
    # @param [Hash] params 
    # @param [String] override_method
    #   needed if the Nutshell API method cannot be determined from the class method name
    # @return [String] the payload in JSON format
    def build_payload(params = nil, override_method = nil)
      # Calculate the Nutshell API method name based on the Ruby method name (with a few exceptions)
      if override_method.nil?
        method = caller[0][/`.*'/][1..-2]
        method = 'getApiForUsername' if method == 'initialize'
      else
        method = override_method
      end

      if (not params.nil?) && params.has_key?(:stubResponses) && (not @stub_responses.nil?)
        params[:stubResponses] = @stub_responses
      end

      # Create the payload
      payload = {:method => camelcase(method), :id => generate_request_id}

      # Filter out keys with nil values.
      payload[:params] = params.reject {|k,v| v.nil?} unless params.nil?

      # Return as JSON
      payload.to_json
    end


    # All Nutshell API requests need a request id.
    #
    # @return [String] request id
    def generate_request_id
      Digest::MD5.hexdigest(rand.to_s).slice(0..8)
    end

    # Executes an arbitrary request.
    def exec_request(payload, override_url = nil)
      response = HTTParty.post(override_url.nil? ? @api_url : override_url,
        :basic_auth => {:username => @username, :password => @api_key},
        :body => payload,
        :query => {:output => :json}
      )

      unless response['error'].nil?
        error = response['error']
        error_code = error['code']
        error_msg = error['message']
        raise "Nutshell API Error: #{error_msg} (#{error_code})"
      end

      response['result']
    end

    def camelcase(method_name)
      parts = []
      method_name.split('_').each_with_index {|str, idx| parts << (idx == 0 ? str : str.capitalize)}
      parts.join ''
    end
  end
end
