Martians::Engine.routes.draw do
  mount Martians::Engine.server => Martians.cable.mount_path, as: :cable
end
