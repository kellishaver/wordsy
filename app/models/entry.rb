class Entry < ApplicationRecord

  require 'fileutils'
  require 'aws-sdk'

  default_scope { order(word: :asc) }

  validates_uniqueness_of :word


  before_save :generate_polly_audio
  after_destroy :remove_audio

  def generate_polly_audio
    polly = Aws::Polly::Client.new(
      region: "us-west-2",
      access_key_id: AWS_PUBLIC_KEY,
      secret_access_key: AWS_SECRET_KEY
    )

    self.word.upcase!

    if self.word.length > 1
      speak = self.word.downcase
    else
      speak = self.word
    end

    resp = polly.synthesize_speech({
      response_target: "#{Rails.root.join('public/words')}/#{self.word}.mp3",
      output_format: "mp3",
      text: speak,
      text_type: "text",
      voice_id: "Matthew"
    })

  end

  def remove_audio
    mp3 = Rails.root.join('public', 'words', "#{self.word}.mp3")
    if File.file?(mp3)
      File.delete(mp3)
    end
  end  

end
