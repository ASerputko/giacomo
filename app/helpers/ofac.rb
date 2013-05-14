require "mechanize"

module Ofac
	class << self
		attr_accessor :agent, :uids

		def url; "http://www.treasury.gov/ofac/downloads/sdn.xml"; end

		def fetch &block
			@agent ||= Mechanize.new
			@uids = []

			xml = Nokogiri::XML @agent.get(url).body
			(xml/:sdnEntry).each do |entry|
				uid = entry.at(:uid).text.to_i rescue nil
				@uids << uid
				first_name = entry.at(:firstName).text rescue nil
				last_name = entry.at(:lastName).text rescue nil

				if sdn = Sdn.find_by_uid(uid)
					sdn.update_attributes!(uid: uid, first_name: first_name, last_name: last_name)
				else
					sdn = Sdn.create(uid: uid, first_name: first_name, last_name: last_name)
				end
			end
 
			sdn_uids = Sdn.all.map { |sdn| sdn.uid }
			should_be_deleted = sdn_uids - @uids
			should_be_deleted.each { |uid| Sdn.find_by_uid(uid).destroy }
		end
	end
end