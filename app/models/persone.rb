class Persone < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :status

  include PgSearch
  # pg_search_scope :search_by_full_name, 
  # 	:against => [:first_name, :last_name],
  # 	:ignoring => :accents,
  # 	:using => {:tsearch => {:dictionary => "english"}}

  # pg_search_scope :search_name, :against => :first_name, :using => [:tsearch, :trigram, :dmetaphone]

  pg_search_scope :that_sounds_like,
                  :against => [:first_name, :last_name],
                  :using => [:trigram, :dmetaphone]


  def self.search(query)
    if query.present?
      that_sounds_like(query)
    else
      scoped
    end
  end
end
