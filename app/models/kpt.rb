class Kpt < ApplicationRecord
  belongs_to :user
  validates :keep_content, presence: true, length: { maximum: 140}
  validates :problem_content, presence: true, length: { maximum: 140}
  validates :try_content, length: { maximum: 140}
  validates :keep_status, presence: true
  validates :problem_status, presence: true
  validates :try_status, presence: true
  validates :start_time, presence: true
  enum keep_status:{
    ●達成●:2, ●問題●:0, ●少し達成●:1
  } 
  enum problem_status:{
    ○問題○:0, ○少し達成○:1, ○達成○:2
  } 
  enum try_status:{
    ◎少し達成◎:1, ◎達成◎:2,◎問題◎:0,
  } 
end
