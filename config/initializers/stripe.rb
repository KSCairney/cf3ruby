if Rails.env.production?
    Rails.configuration.stripe = {
        publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
        secret_key: ENV['STRIPE_SECRET_KEY']
    }
else
    Rails.configuration.stripe = {
        publishable_key: 'pk_test_CyIytE75UPszbsqA6m3C0Yi4',
        secret_key: 'sk_test_QOo8kfu8EBYlXooAfDgD2ODU'
    }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]