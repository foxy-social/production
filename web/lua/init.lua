-- AWS S3 handling

aws_sig = require('aws-signature')

function clear_request()
  -- Get rid of any client state that could cause
  -- issues for the proxied request
  for h, _ in pairs(ngx.req.get_headers()) do
    if string.lower(h) ~= 'range' then
      ngx.req.clear_header(h)
    end
  end

  ngx.req.set_uri_args({})
  ngx.req.discard_body()
end

function sign_aws_request()
  -- The API token used should not allow writing, but
  -- sanitize this anyway to stop an upstream error
  if ngx.req.get_method() ~= 'GET' then
    ngx.status = ngx.HTTP_UNAUTHORIZED
    ngx.say('Unauthorized')
    return ngx.exit(ngx.HTTP_UNAUTHORIZED)
  end

  clear_request()
  aws_sig.s3_set_headers(ngx.var['S3_HOST'], ngx.var.uri)
end
