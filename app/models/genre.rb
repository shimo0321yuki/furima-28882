class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'レディース'}
    { id: 2, name: 'メンズ'}
    { id: 3, name: 'ベビー、キッズ'}
    { id: 4, name: 'インテリア、住まい、小物'}
    { id: 5, name: '本、音楽、ゲーム'}
    { id: 6, name: 'コスメ、香水、美容'}
    { id: 7, name: '家電、スマホ、カメラ'}
    { id: 8, name: 'スポーツ、レジャー'}
    { id: 9, name: 'ハンドメイド'}
    { id: 10, name: 'チケット'}
    { id: 11, name: '自動車、オートバイ、自転車'}
    { id: 12, name: 'その他'}
  ]
end
