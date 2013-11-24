class AddUserToTicketMessages < ActiveRecord::Migration
  def change
    add_reference :ticket_messages, :user, index: true
  end
end
