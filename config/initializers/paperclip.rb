Paperclip.interpolates(:s3_eu_url) { |attachment, style|
  "#{attachment.s3_protocol}://s3-eu-central-1.amazonaws.com/#{attachment.bucket_name}/screenshots/#{attachment.path(style).gsub(%r{^/}, '')}"
}

Paperclip::Attachment.default_options[:url] = ':s3_eu_url'
Paperclip::Attachment.default_options[:path] = 'screenshots/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3.eu-central-1.amazonaws.com'
