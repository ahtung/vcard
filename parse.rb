# encoding: utf-8

require 'vcardigan'
require 'date'
require 'pry'

data = File.read('build/dunya_kirkali.vcard')

vcard = VCardigan.parse(data)

puts vcard
