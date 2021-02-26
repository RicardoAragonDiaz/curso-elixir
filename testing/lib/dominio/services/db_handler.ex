defprotocol DbHandler do
  def create_user(handler, user)
  def find_user(handler, id)
end
