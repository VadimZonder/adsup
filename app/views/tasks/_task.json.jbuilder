json.extract! task, :id, :ldap, :instruction, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
