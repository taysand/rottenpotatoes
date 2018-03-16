OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '246451323080-nan85tmapcj5uh9l1m7b4l73h6a3pgld.apps.googleusercontent.com', 'X--KGYOjgwaUMF1VQawSipNz', {skip_jwt: true}
end