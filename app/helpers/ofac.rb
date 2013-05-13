require "mechanize"

module Ofac
	class << self
		attr_accessor :agent

		def url; "http://www.treasury.gov/ofac/downloads/sdn.xml"; end

		def fetch
			@agent ||= Mechanize.new
			xml = Nokogiri::XML @agent.get(url).body
			(xml/:sdnEntry).each do |entry|
				uid = entry.at(:uid).text rescue nil
				first_name = entry.at(:firstName).text rescue nil
				last_name = entry.at(:lastName).text rescue nil

				puts "#{uid}, #{first_name}, #{last_name}"

				# SdnEntry.create!(uid: uid, first_name: first_name, last_name: last_name)
			end
		end


	end
end
