Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '717036620525-f042ht0i5m4a42a4hr65m93ingvdt3rq.apps.googleusercontent.com', 'XGPQzwQGzIsTImllNsgOOgD4'
    {
      name: 'google_oauth2',
      scope: GMAIL_SCOPES,
      access_type: 'offline',
      prompt: 'consent select_account',
      image_aspect_ratio: 'original',
      image_size: 50,
      skip_jwt: true
    }
end

