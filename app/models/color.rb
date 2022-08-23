class Color < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カラー' }, { id: 1, name: 'ホワイト' }, { id: 2, name: 'ブラック' },
    { id: 3, name: 'グレー' }, { id: 4, name: 'ブラウン' }, { id: 5, name: 'ブルー' },
    { id: 6, name: 'グリーン' }, { id: 7, name: 'イエロー' }, { id: 8, name: 'オレンジ' },
    { id: 9, name: 'レッド' }, { id: 10, name: 'パープル' }, { id: 11, name: 'ピンク' },
    { id: 12, name: 'ベージュ' }, { id: 13, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :closets
end