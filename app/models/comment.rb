class Comment
  include DataMapper::Resource
  property :id, Serial
  property :content, String
  belongs_to :picture
  validates_presence_of :content

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
end
