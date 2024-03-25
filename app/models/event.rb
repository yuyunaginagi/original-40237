class Event < ActiveHash::Base
  self.data = [
    { id: 1,  name: '---' },
    { id: 2,  name: '100m' },
    { id: 3,  name: '200m' },
    { id: 4,  name: '400m' },
    { id: 5,  name: '800m' },
    { id: 6,  name: '1500m' },
    { id: 7,  name: '5000m' },
    { id: 8,  name: '100mH' },
    { id: 9,  name: '110mH' },
    { id: 10, name: '400mH' },    
    { id: 11, name: '走高跳' },
    { id: 12, name: '棒高跳' },
    { id: 13, name: '走幅跳' },
    { id: 14, name: '三段跳' },
    { id: 15, name: 'やり投' },
    { id: 16, name: '砲丸投' },
    { id: 17, name: '円盤投' },
    { id: 18, name: 'ハンマー投' },
    { id: 19, name: '七種競技' },
    { id: 20, name: '八種競技' },
    { id: 21, name: '300m' },
    { id: 22, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :results
end