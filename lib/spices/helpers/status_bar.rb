class StatusBar
  def self.visible?
    Spices.world.uia('UIATarget.localTarget().frontMostApp().statusBar().isVisible()')['value'] == 1
  end
end
