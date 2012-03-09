#!/usr/bin/env ruby
require "webrick"
require "erb"
require 'tilt'
require 'active_support/all'
require 'haml'
require 'maruku'
require 'compass'
require './lib/view_helpers'
require "./lib/dynamic_handler"

["haml", "erb", "markdown"].each do |ext|
  WEBrick::HTTPServlet::FileHandler.add_handler(ext, WEBrick::HTTPServlet::DynamicHandler)
end

project_path = File.absolute_path( ARGV[0] )
file_name = Compass.detect_configuration_file( project_path )
Compass.add_project_configuration(file_name)
Compass.configuration.project_path = project_path

release_dir = File.join(project_path, "document_root")
FileUtils.mkdir_p( release_dir)
file_extensions = WEBrick::HTTPServlet::FileHandler::HandlerTable.keys.join(',')
Dir.glob( File.join(project_path, '**', "[^_]*.html.{#{file_extensions}}") ) do |file|
  if file =~ /document_root/
    next
  end

  extname=File.extname(file[project_path.size..-1])# get .erb, .html, .php

  request = WEBrick::HTTPRequest.new({})
  request.path = file[project_path.size ... (extname.size*-1)]
  handler = (WEBrick::HTTPServlet::FileHandler::HandlerTable[extname[1..-1]])
  content = handler.new(nil, file).send(:parse, request, nil)

  new_file = File.join(release_dir, request.path)
  FileUtils.mkdir_p( File.dirname(  new_file ))
  File.open(new_file, 'w') {|f| f.write(content) }
  puts "Create: #{request.path}"
end

Dir.glob( File.join(project_path, '**', '[^_]*.{html,swf,txt,ico,png,json,xml}') ) do |file|
  if file =~ /document_root/
    next 
  end
    new_file = File.join(release_dir, file[project_path.size..-1])
  FileUtils.mkdir_p( File.dirname(  new_file ))
  FileUtils.cp( file, new_file )
  puts "Copy: #{file[project_path.size..-1]}"
end

%w{images css javascripts}.each do |asset|
  asset_path = Compass.configuration.send("#{asset}_path")
  if File.exists?(asset_path)
    FileUtils.cp_r(asset_path, release_dir) 
    puts "Copy directory: #{asset_path[project_path.size..-1]}"
  end
end
