class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カテゴリー' }, { id: 1, name: 'アウター' }, { id: 2, name: 'トップス' },
    { id: 3, name: 'ボトムス' }, { id: 4, name: 'キャップ' }, { id: 5, name: 'シューズ' },
    { id: 6, name: 'バッグ' }
  ]
  include ActiveHash::Associations
  has_many :closets
end
