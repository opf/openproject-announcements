module PluginSpecHelper
  def disable_flash_sweep
    @controller.instance_eval{flash.stub!(:sweep)}
  end
end