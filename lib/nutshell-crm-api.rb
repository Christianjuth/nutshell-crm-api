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

      params ={username: @username}
      payload = build_payload(params)
      result = exec_request(payload, 'http://api.nutshell.com/v1/json')
      api_host = result['api']
      @api_url = "https://#{api_host}/api/v1/json"
    end

    # For testing.
    def add(num1, num2)
      params = {num1: num1, num2: num2}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Delete an account.
    def delete_account(account_id, rev)
      params = {accountId: account_id, rev: rev}
      payload = build_payload params
      exec_request(payload)
    end

    # Delete an activity.
    def delete_activity(activity_id, rev)
        params = {activityId: activity_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end
    
    # Delete a contact. 
    def delete_contact(contact_id, rev)
        params = {contactId: contact_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Delete a lead.
    def delete_lead(lead_id, rev)
        params = {leadId: activity_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Deletes the given note.
    def delete_note(note_id, rev)
        params = {noteId: activity_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Delete a product.
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

    # Delete a team.
    def delete_team(team_id, rev)
        params = {teamId: team_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Delete a user.
    def delete_user(user_id, rev)
        params = {userId: user_id, rev: rev}
        payload = build_payload params
        exec_request(payload)
    end

    # Edit an account.
    def edit_account(account_id, rev, account)
      params = {accountId: account_id, rev: rev, account: account}
      payload = build_payload params
      exec_request(payload)
    end

    # Edit an activity.
    def edit_activity(activity_id, rev, activity)
      params = {activityId: activity_id, rev: rev, activity: activity}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Edit a contact.
    def edit_contact(contact_id, rev, contact)
      params = {contactId: contact_id, rev: rev, contact: contact}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Edit a lead.
    def edit_lead(lead_id, rev, lead)
      params = {leadId: lead_id, rev: rev, lead: lead}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Edits the given note (note that notes can
    # only be edited for 24 hours by the note author)
    def edit_note(note_id, rev, note)
      params = {noteId: note_id, rev: rev, note: note}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Edit a product.
    def edit_product(product_id, rev, product)
      params = {productId: product_id, rev: rev, product: product}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Update a process step.
    def edit_step(step_id, rev, step)
      params = {stepId: step_id, rev: rev, step: step}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Edit a task.
    def edit_task(task_id, rev, task)
      params = {taskId: task_id, rev: rev, task: task}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Edit a team.
    def edit_team(team_id, rev, team)
      params = {teamId: team_id, rev: rev, team: team}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Edit a user.
    def edit_user(user_id, rev, user)
      params = {userId: user_id, rev: rev, user: user}
      payload = build_payload(params)
      exec_request(payload)
    end


    # Find accounts matching a specified query.
    def find_accounts(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all active account types (to be applied to an account).
    def find_account_types(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Find activities matching a specified query. 
    def find_activities(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all active activity types.
    def find_activity_types(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # List available and running backups.
    def find_backups
      exec_request build_payload
    end

    # Returns stubs for all active Competitors.
    def find_competitors(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Find contacts associated with a specified account or lead.
    def find_contacts(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Gets all of the custom fields available for Leads, Accounts 
    # and Contacts, including appropriate meta-information.
    def find_custom_fields
      exec_request(build_payload)
    end

    # Returns stubs for all active Delays (seen in Step 
    # responses in availableDelayIds)
    def find_delays(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Returns stubs for all active Industries (to be applied to an account)
    def find_industries(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all possible outcomes for a closed lead.
    def find_lead_outcomes(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params, 'findLead_Outcomes')
      exec_request(payload)
    end

    # Find leads matching a specified query.
    def find_leads(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Returns stubs for all active Markets.
    def find_markets(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all active milestones.
    def find_milestones(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Returns stubs for all active Origins.
    def find_origins(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Finds all processes associated with an entity.
    def find_processes(query)
      params = {query: query}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all active products.
    def find_products(order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return all publicly-visible settings.
    def find_settings(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Returns stubs for all active Sources.
    def find_sources(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all active tags.
    def find_tags
      exec_request(build_payload)
    end

    # Returns an array containing tasks for the given query.
    def find_tasks(query)
      params = {query: query}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all active Teams.
    def find_teams(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get all territories.
    def find_territories(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Find timeline events (Activities, Emails and Notes) for an Entity.
    def find_timeline(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Find users matching a specified query.
    def find_users(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Get the specified Account.
    def get_account(account_id, rev = nil)
      params = {accountId: account_id, rev: rev}
      exec_request build_payload(params)
    end

    # Get the specified Activity.
    def get_activity(activity_id, rev = nil)
      params = {activityId: activity_id, rev: rev}
      exec_request build_payload(params)
    end

    # Returns graph data and overview information for various sales analytics reports.
    def getAnalyticsReport(report_type, period, filter_entity = nil, options = nil)
      params = {reportType: report_type, period: period, filter: filter_entity, options: options}
      exec_request build_payload(params)
    end

    # Get the specified Contact.
    def get_contact(contact_id, rev = nil)
      params = {contactId: contact_id, rev: rev}
      exec_request build_payload(params)
    end

    # Get the specified Email.
    def get_email(email_id, rev = nil)
      params = {emailId: email_id, rev: rev}
      exec_request build_payload(params)
    end

    # Get the specified Lead.
    def get_lead(lead_id, rev = nil)
      params = {leadId: lead_id, rev: rev}
      exec_request build_payload(params)
    end

    # Get the specified Note.
    def get_note(note_id, rev = nil)
      params = {noteId: note_id, rev: rev}
      exec_request build_payload(params)
    end

    # Get all information for a product (including full price list).
    def get_product(product_id, rev = nil)
      params = {productId: product_id, rev: rev}
      exec_request build_payload(params)
    end

    # Get the specified Task.
    def get_task(task_id, rev = nil)
      params = {taskId: task_id, rev: rev}
      exec_request build_payload(params)
    end

    # Get the specified Team.
    def get_task(team_id, rev = nil)
      params = {teamId: team_id, rev: rev}
      exec_request build_payload(params)
    end

    # Gets the last-updated times of each of the provisioning bins.
    def get_update_times
      exec_request(build_payload)
    end

    # Get all info about a user.
    def get_user(user_id = nil, rev = nil)
      params = {userId: user_id, rev: rev}
      exec_request build_payload(params)
    end

    # Return data related to authenticated Nutshell instance.
    def instance_data
      exec_request(build_payload)
    end

    # Create a new account.
    def new_account(account)
      params = {account: account}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Create a new activity.
    def new_activity(activity)
      params = {activity: activity}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Initiate downloadable backup.
    def new_backup
      exec_request(build_payload)
    end

    # Create a new Contact.
    def new_contact(contact)
      params = {contact: contact}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Saves the given e-mail message.
    def new_email(emailString)
      params = {emailString: emailString}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Create a new Lead.
    def new_lead(lead)
      params = {lead: lead}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Adds the note to the given entity.
    def new_note(entity, note)
      params = {entity: entity, note: note}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Create a new product.
    def new_product(product)
      params = {product: product}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Given a source name, fetches an existing
    # source or creates a new one if it does not exist.
    def new_source(name)
      params = {name: name}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Create a new tag.
    def new_tag(tag)
      params = {tag: tag}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Create a new Task.
    def new_task(task)
      params = {task: task}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Create a new Team.
    def new_team(team)
      params = {team: team}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Create a new User.
    def new_user(user)
      params = {user: user}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Account stubs matching a given search string.
    def search_accounts(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of stubs matching a given search string for
    # all entities that could be participants in an Activity.
    def search_activity_participants(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Works just like searchUniversal, but only searches by email address.
    def search_by_email(email_address)
      params = {emailAddressString: email_address}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Competitor stubs matching a given search string.
    def search_competitors(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Contact stubs matching a given search string.
    def search_contacts(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Contact and User stubs matching a given search string.
    def search_contacts_and_users(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Lead stubs matching a given search string.
    def search_leads(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Returns an array of mentionable entities matching the string,
    # but excluding any that the client already knows about, 
    # as indicated by knownLocalResults.
    def search_mentionable_entities(query, entityType, entityId, knownLocalEntities, limit = nil)
      params = {string: query, entityType: entityType, entityId: entityId, knownLocalEntities: knownLocalEntities, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Product stubs matching a given search string.
    def search_products(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Source stubs matching a given search string.
    def search_sources(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of Contact, Lead, and Account stubs matching a given search string.
    def search_universal(query)
      params = {string: query}
      payload = build_payload(params)
      exec_request(payload)
    end

    # Return a list of User and Team stubs matching a given search string.
    def search_users_and_teams(query, limit = nil)
      params = {string: query, limit: limit}
      payload = build_payload(params)
      exec_request(payload)
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
      payload = {method: camelcase(method), id: generate_request_id}

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
        basic_auth: {username: @username, password: @api_key},
        body: payload,
        query: {output: :json}
      )

      unless response['error'].nil?
        error = response['error']
        error_code = error['code']
        error_msg = error['message']
        raise "Nutshell API Error: #{error_msg} (#{error_code})"
      end

      response['result']
    end

    # Conbert method_name to camelcase so it can
    # call the correct API function.
    def camelcase(method_name)
      parts = []
      method_name.split('_').each_with_index {|str, idx| parts << (idx == 0 ? str : str.capitalize)}
      parts.join ''
    end
  end
end
