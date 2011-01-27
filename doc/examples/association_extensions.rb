class Person
  include Mongoid::Document
  field :name
  embeds_many :addresses do
    def california
      @target.select { |address| address.state == "CA" }
    end

    def domestic
      @target.select { |address| address.country == @parent.country_of_origin }
    end
  end
end
