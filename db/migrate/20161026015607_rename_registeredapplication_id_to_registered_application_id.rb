class RenameRegisteredapplicationIdToRegisteredApplicationId < ActiveRecord::Migration
  def change
    rename_column :events, :registeredapplication_id, :registered_application_id
  end
end
