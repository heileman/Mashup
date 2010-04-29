class AddTestData < ActiveRecord::Migration
  def self.up
    Location.delete_all
    BluePerson.delete_all
    RedPerson.delete_all
    
    locations = Location.create(
      [ {:address => "31 Cedar Hill PL NE, Albuquerque, NM", :locatable_type => "BluePerson", :locatable_id => 1},
        {:address => "100 Gold Ave SW, Albuquerque, NM", :locatable_type => "BluePerson", :locatable_id => 2},
        {:address => "2715 San Diego Ave SE, Albuquerque, NM", :locatable_type => "BluePerson", :locatable_id => 3},
        {:address => "109 Columbia Dr SE, Albuquerque, NM", :locatable_type => "BluePerson", :locatable_id => 4},
        {:address => "120 Cornell Dr. SE, Albuquerque NM", :locatable_type => "BluePerson", :locatable_id => 5},
        {:address => "2602 Silver Ave SE, Albuquerque, NM", :locatable_type => "BluePerson", :locatable_id => 6},
        {:address => "8800 Corona Ave NE, Albuquerque, NM", :locatable_type => "RedPerson", :locatable_id => 1},
        {:address => "8608 Animas PL NW, Albuquerque, NM", :locatable_type => "RedPerson", :locatable_id => 2},
        {:address => "1101 Makian PL NW, Albuquerque, NM", :locatable_type => "RedPerson", :locatable_id => 3},
        {:address => "1300 Coal Ave SW, Albuquerque, NM", :locatable_type => "RedPerson", :locatable_id => 4},
        {:address => "900 Cam del Rio NW, Albuquerque, NM", :locatable_type => "RedPerson", :locatable_id => 5},
      ])
      
    blue_person = BluePerson.create(
      [ {:name => "Buzz Lightyear"},
        {:name => "Boris Godunov"},
        {:name => "F.L. Fulton"},
        {:name => "Span Watson"},
        {:name => "Rick Boutwell"},
        {:name => "Roger Wicker"},
      ]
    )
    
    red_person = RedPerson.create(
      [ {:name => "Billy Badguy", :description => "Does bad stuff"},
        {:name => "Boris Badenov", :description => "Known associate of Natasha Fatale"},
        {:name => "Natasha Fatale", :description => "Known associate of Boris Badenov"},
        {:name => "Jamie Koch", :description => "Inept or malicious, we're not sure which"},
        {:name => "Cruella deVil", :description => "Hide your dogs!"},
      ]
    )
    
  end

  def self.down
    drop_table :locations
    drop_table :blue_people
    drop_table :red_people
  end
end
