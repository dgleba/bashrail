module ApplicationHelper
  # override default kaminari pagination method to use twitter-bootstrap theme
  def paginate(objects, options={})
    options.reverse_merge!(theme: 'twitter-bootstrap-3')
    super(objects, options)
  end
end
