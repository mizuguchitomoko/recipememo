class Recipe < ApplicationRecord
  belongs_to :user, optional: true#作業進んだらoptional: true削除
  attachment :image
end