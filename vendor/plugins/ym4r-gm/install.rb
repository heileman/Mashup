require 'fileutils'

#Copy the Javascript files
FileUtils.copy(Dir[File.dirname(__FILE__) + '/javascript/*.js'], File.dirname(__FILE__) + '/../../../public/javascripts/')

#Copy the controller and view files
FileUtils.mkdir_p("app/views/locations/")
FileUtils.copy(Dir[File.dirname(__FILE__) + '/app/controllers/locations_controller.rb'], File.dirname(__FILE__) + '/../../../app/controllers/')
FileUtils.copy(Dir[File.dirname(__FILE__) + '/app/views/locations/index.html.erb'], File.dirname(__FILE__) + '/../../../app/views/locations/')
FileUtils.copy(Dir[File.dirname(__FILE__) + '/app/helpers/locations_helper.rb'], File.dirname(__FILE__) + '/../../../app/helpers/')

#copy the gmaps_api_key file
gmaps_config = File.dirname(__FILE__) + '/../../../config/gmaps_api_key.yml'
unless File.exist?(gmaps_config)
  FileUtils.copy(File.dirname(__FILE__) + '/gmaps_api_key.yml.sample', gmaps_config)
end