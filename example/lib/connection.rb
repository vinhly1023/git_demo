require 'lib/const'
require 'mysql'

# This class initiate connection to MySql and execute queries
class Connection
  # get information from lib/data.xml file
  xml_content = File.read("#{File.expand_path File.dirname(__FILE__)}/data.xml")
  doc = Nokogiri::XML(xml_content)

  @server = doc.search('//server').text
  @username = doc.search('//username').text
  @password = doc.search('//password').text
  @database = doc.search('//db_name').text
  @port_number = doc.search('//port_number').text

  def self.sql_connection(querystring)
    con = Mysql.new @server, @username, @password, @database, @port_number
    rs = con.query querystring
    con.close
    rs
  end
end

