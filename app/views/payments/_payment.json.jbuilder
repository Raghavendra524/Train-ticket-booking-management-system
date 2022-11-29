json.extract! payment, :id, :pay_id, :status, :type, :created_at, :updated_at
json.url payment_url(payment, format: :json)
