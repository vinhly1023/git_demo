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
  @database = doc.search('//database').text
  @port = doc.search('//port').text

  def self.my_sql_connection(querystring)
    # Initiate connection to mysql database
    con = Mysql.new @server, @username, @password, @database, @port

    # Excute query to get categories for French page
    rs = con.query querystring

    # Close connection
    con.close
    rs
  end
end
