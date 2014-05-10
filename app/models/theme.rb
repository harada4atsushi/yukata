class Theme < ActiveRecord::Base
  belongs_to :woman
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates :woman_id, :presence => true

  def self.info
    {
      1 => {
        :mission => "レベル1　笑顔の写真",
        :mission_text => "まずは、手始めに女の子の写真を撮ろう。",
        :hint_text => "全力の笑顔をお願いしよう。" 
      },
      2 => {
        :mission => "レベル2　ピース写真",
        :mission_text => "日本人だったらこのポーズ<br />ピース写真をとろう。",
        :hint_text => "ピースと言いながら取ると笑顔になる不思議！！" 
      },
      3 => {
        :mission => "レベル3　ばいばい写真",
        :mission_text => "手を振る女の子はとっても可愛いです。",
        :hint_text => "皇族の方はいつもこのポーズです。（笑）" 
      },
      4 => {
        :mission => "レベル4　ジャンプ写真",
        :mission_text => "ジャンプ写真　揺れてる女の子の写真を撮ろう<br />躍動感があるよ。",
        :hint_text => "ジャンプ！ジャンプ！" 
      },
      5 => {
        :mission => "レベル5　2ショット写真",
        :mission_text => "2ショット写真はできるだけ仲良さそうに！！近づいて取ってね。",
        :hint_text => "2ショットだ～！" 
      }
    }
  end
end