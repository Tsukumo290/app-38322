class Color < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カラー' }, { id: 1, name: 'ホワイト' }, { id: 2, name: 'イエロー' },
    { id: 3, name: 'オレンジ' }, { id: 4, name: 'レッド' }, { id: 5, name: 'ピンク' },
    { id: 6, name: 'パープル' }, { id: 7, name: 'ブルー' }, { id: 8, name: 'グリーン' },
    { id: 9, name: 'ベージュ' }, { id: 10, name: 'ブラウン' }, { id: 11, name: 'グレー' },
    { id: 12, name: 'ブラック' }, { id: 13, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :closets
end
