class Occupation < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '選手'},
    {id: 3, name: 'マネージャー'},
    {id: 4, name: '監督・コーチ'},
    {id: 5, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :organizations

end

  
