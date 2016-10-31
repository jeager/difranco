json.extract! task, :id, :client_name, :value, :discount, :final_value, :status, :created_at, :updated_at
json.url task_url(task, format: :json)