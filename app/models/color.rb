class Color < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カラー' }, { id: 1, name: 'ホワイト', backcolor: "#fff" }, { id: 2, name: 'ブラック', backcolor: "#000" },
    { id: 3, name: 'グレー', backcolor: "#808080" }, { id: 4, name: 'ブラウン', backcolor: "#660000" }, { id: 5, name: 'ブルー', backcolor: "#0000CD" },
    { id: 6, name: 'グリーン', backcolor: "#006400" }, { id: 7, name: 'イエロー', backcolor: "#FFFF00" }, { id: 8, name: 'オレンジ', backcolor: "#fd7e00" },
    { id: 9, name: 'レッド', backcolor: "#FF0000" }, { id: 10, name: 'パープル', backcolor: "#8B008B" }, { id: 11, name: 'ピンク', backcolor: "#FF82B2" },
    { id: 12, name: 'ベージュ', backcolor: "#FFE4C4" }, { id: 13, name: 'その他', backcolor: "#d3d3d3" },
  ]
  include ActiveHash::Associations
  has_many :closets
end