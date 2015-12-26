# encoding: utf-8

require 'vcardigan'
require 'date'
require 'pry'
require 'trello'

TRELLO_DEVELOPER_PUBLIC_KEY = 'A'
TRELLO_MEMBER_TOKEN = 'B'

# Configure Trello
Trello.configure do |config|
  config.developer_public_key = TRELLO_DEVELOPER_PUBLIC_KEY
  config.member_token = TRELLO_MEMBER_TOKEN
end

data = File.read('build/dunya_kirkali.vcard')
vcard = VCardigan.parse(data)

leads_board = Trello::Board.find("leads")
leads_card = Trello::Card.find(title: vcard.full_name)
result = leads_board.create_card(title: vcard.full_name) if leads_card.nil?

puts result
