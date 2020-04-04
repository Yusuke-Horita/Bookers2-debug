class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

    def self.search(keyword, method)
      if method == "partial_match"
        where("title like?", "%#{keyword}%")
      elsif method == "perfect_match"
        where("title like?", "#{keyword}")
      elsif method == "forward_match"
        where("title like?", "#{keyword}%")
      elsif method == "backward_match"
        where("title like?", "%#{keyword}")
      else
        all
      end
    end
end
