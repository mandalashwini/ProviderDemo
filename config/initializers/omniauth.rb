Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, "717036620525-f042ht0i5m4a42a4hr65m93ingvdt3rq.apps.googleusercontent.com", "eMzuGv1rW7c1LSChbvt9oU9X"
    {
      name: 'google',
      scope: 'email, profile, plus.me, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
    }
end