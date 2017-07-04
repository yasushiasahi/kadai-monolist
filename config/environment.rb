# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
      associate_tag:     'monolist80-22',
      AWS_access_key_id: 'AKIAJCSTZHW5QFT7BSRQ',
      AWS_secret_key:   '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'
}