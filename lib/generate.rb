# encoding: utf-8

require 'vcardigan'
require 'date'
require 'pry'

# Data
employees = {
  dunya: {
    fullname: "Dunya Kirkali",
    name: 'Dunya Kirkali',
    email: 'dunyakirkali@ahtung.co',
    bday: Date.parse('11-05-1984'),
    x_skype: 'aynudilakrik',
    sound: 'http://www.ahtung.co/dunya.ogg',
    photo: 'http://www.ahtung.co/dunyakirkali.jpg',
    tel: '0031626689471',
    caldaruri: 'http://calendar.ahtung.co/dunyakirkali',
    tz: 'Europe/Amsterdam',
    source: 'http://www.ahtung.co/dunyakirkali.vcf'
  },
  onur: {
    fullname: "Onur Küçükkeçe",
    name: 'Onur Küçükkeçe',
    email: 'onurkucukkece@ahtung.co',
    bday: Date.parse('09-06-1984'),
    x_skype: 'onurkucukkece',
    sound: 'http://www.ahtung.co/onur.ogg',
    photo: 'http://www.ahtung.co/onurkucukkece.jpg',
    tel: '00905374050051',
    caldaruri: 'http://calendar.ahtung.co/onurkucukkece',
    tz: 'Europe/Istanbul',
    source: 'http://www.ahtung.co/onurkucukkece.vcf'
  }
}

employees.each do |employee, details|
  # Create
  vcard = VCardigan.create(version: '4.0')

  # General
  vcard.kind 'Organization'
  vcard.geo '39.95', '-75.1667' # TODO
  vcard.lang 'TR' # TODO

  # Personal
  vcard.gender 'M' # TODO
  details.each do |key, value|
    vcard.send(key, value)
  end

  # Organization
  vcard.org 'Ahtung Teknoloji Ltd. Sti.', title: 'CEO'
  vcard.logo 'http://www.ahtung.co/ahtung.png', mediatype: 'image/png'
  vcard.adr 'H. Edip Adivar Mah.', 'Meliksah Sk. 18.7', 'Sisli', 'Istanbul', type: 'work'

  # Other
  vcard.categories 'swimmer, biker' # TODO
  vcard.url 'http://www.ahtung.co'
  vcard.note 'TODO ODOT DOTO OTOD TODO'

  vcard.rev Time.now.to_i

  # Generate
  File.open("build/#{details[:fullname].downcase.gsub(' ', '_')}.vcard", 'w') do |file|
    file.write(vcard)
  end
end
