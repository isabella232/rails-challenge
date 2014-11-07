# require 'datamapper_adapter'

class Picture
  include DataMapper::Resource
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  property :id, Serial
  property :title, String
  property :description, Text
  mount_uploader :file, PictureUploader
  validates_presence_of :file, :title, :description
  has n, :comments, :constraint => :destroy

end
