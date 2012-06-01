CONFIG["url_base"] ||= "http://" + CONFIG["server_host"]

%w(session_secret_key user_password_salt).each do |key|
  CONFIG[key] = ServerKey[key] if ServerKey[key]
end

require 'post_save'
require 'base64'
require 'diff/lcs/array'
require 'image_size'
require 'ipaddr'
require 'open-uri'
require 'socket'
require 'time'
require 'uri'
require 'net/http'
require 'aws/s3' if [:amazon_s3, :local_flat_with_amazon_s3_backup].include?(CONFIG["image_store"])
require 'danbooru_image_resizer/danbooru_image_resizer'
require 'google_chart' if CONFIG["enable_reporting"]
require 'core_extensions'
require 'download'
require 'sys/cpu' if CONFIG["load_average_threshold"]
require 'fileutils'
require 'versioning'
require 'dtext'
