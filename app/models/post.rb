class Post < ActiveRecord::Base
  belongs_to :user

  def body_markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    markdown.render(self.body)
  end
end
