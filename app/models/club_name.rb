class Club < ActiveHash::Base
  self.data = [
    { id: 1, name: '学生自治会 執行委員会' },
    { id: 2, name: '学生ホール管理運営委員会' },
    { id: 3, name: '体育会本部' },
    { id: 4, name: '文化部連合' },
    { id: 5, name: 'サークル連合理事会' },
    { id: 6, name: '大学祭実行委員会' },
  ]
end

