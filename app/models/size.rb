class Size < ActiveHash::Base
  self.data = [
    { id: 0, name: 'サイズ' }, { id: 1, name: 'XS' }, { id: 2, name: 'S' },
    { id: 3, name: 'M' }, { id: 4, name: 'L' }, { id: 5, name: 'XL' },
    { id: 6, name: 'FREE' }

    { id: 7, name: '23cm以下' }, { id: 8, name: '23.5cm' }, { id: 9, name: '24cm' },
    { id: 10, name: '24.5cm' }, { id: 11, name: '25cm' }, { id: 12, name: '25.5cm' },
    { id: 13, name: '26cm以上' }
  ]
  include ActiveHash::Associations
  has_many :closets
end
